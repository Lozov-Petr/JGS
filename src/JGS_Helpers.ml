open OCanren
open JGS

(**************************************************************************************************)
(************************************* Pretty-printing ********************************************)
(**************************************************************************************************)

let pp_lnat : Std.Nat.logic -> string =
 fun n ->
  let rec helper n =
    match n with
    | OCanren.Var _ -> (0, Some n)
    | Value Std.Nat.O -> (0, None)
    | Value (S n') ->
        let n, v = helper n' in
        (n + 1, v)
  in
  match helper n with
  | 0, None -> "0"
  | 0, Some v -> [%show: Std.Nat.logic] () v
  | n, None -> Printf.sprintf "%d" n
  | n, Some v -> Printf.sprintf "%d + %s" n @@ [%show: Std.Nat.logic] () v

type 'a x = 'a HO.targ

let rec pp_ltarg : HO.jtype_logic HO.targ_logic -> string =
 fun arg ->
  GT.show OCanren.logic
    (GT.show HO.targ_fuly pp_ljtype
       (GT.show Std.Option.logic
       @@ GT.show Std.Pair.logic (GT.show HO.polarity_logic) pp_ljtype))
    arg

and pp_ljtype : HO.jtype_logic -> string =
 fun t ->
  GT.show OCanren.logic
    (GT.show HO.jtype_fuly
       (GT.show Std.List.logic pp_ltarg)
       pp_lnat pp_ljtype
       (GT.show Std.Option.logic pp_ljtype)
       (GT.show Std.List.logic pp_ljtype))
    t

let rec pp_jtyp_logic name_of : Format.formatter -> HO.jtype_logic -> unit =
  let open Format in
  let open OCanren.Std in
  let rec helper ppf :
      ( HO.jtype_logic HO.targ_logic List.logic,
        Nat.logic,
        HO.jtype_logic,
        HO.jtype_logic Option.logic,
        HO.jtype_logic List.logic )
      HO.jtype_fuly ->
      _ = function
    | HO.Null -> fprintf ppf "null"
    | HO.Array t -> fprintf ppf "Array<%a>" main t
    | HO.Interface (id, Value Std.List.Nil) | HO.Class (id, Value Std.List.Nil)
      ->
        fprintf ppf "%s" (name_of id)
    | HO.Interface (id, args) | HO.Class (id, args) ->
        fprintf ppf "%s<%a>" (name_of id)
          (GT.fmt Std.List.logic (pp_targ_logic name_of))
          args
    | Intersect args ->
        fprintf ppf "Intersect %a" (GT.fmt Std.List.logic main) args
    | HO.Var { upb; lwb = Value None; _ } ->
        fprintf ppf "(? extends %a)" main upb
    | HO.Var { upb; lwb = Value (Some lwb); _ } ->
        fprintf ppf "(? extends %a super %a)" main upb main lwb
    | HO.Var { upb; lwb = Var _; _ } ->
        fprintf ppf "Not implemented %s %d" __FILE__ __LINE__
  and main : _ -> HO.jtype_logic -> _ =
   fun ppf x -> GT.fmt OCanren.logic helper ppf x
  in
  main

and pp_pol ppf a = Format.fprintf ppf "%s" ((GT.show HO.polarity_logic) a)

and pp_targ_logic name_of : Format.formatter -> _ -> _ =
 fun ppf ->
  GT.fmt OCanren.logic
    (fun ppf -> function
      | HO.Type t -> pp_jtyp_logic name_of ppf t
      | HO.Wildcard (Value None) -> Format.fprintf ppf "?"
      | HO.Wildcard (Value (Some (Value (pol, t)))) ->
          Format.fprintf ppf "? %a %a" pp_pol pol (pp_jtyp_logic name_of) t
      | _ -> assert false)
    ppf

let sep () = Printf.printf "\n\n%s\n\n" @@ String.make 100 '*'

(**************************************************************************************************)
(**************************************** Injectors ***********************************************)
(**************************************************************************************************)

let pair_inj : ('a -> 'b) -> ('c -> 'd) -> 'a * 'c -> ('b, 'd) Std.Pair.injected
    =
 fun f g (a, b) -> !!(f a, g b)

let polarity_inj : polarity -> HO.polarity_injected = function
  | Extends -> !!HO.Extends
  | Super -> !!HO.Super

let option_inj : ('a -> 'b) -> 'a option -> 'b Std.Option.injected =
 fun f -> function None -> Std.none () | Some x -> Std.some (f x)

let rec targ_inj : jtype targ -> HO.jtype_injected HO.targ_injected = function
  | Type t -> !!(HO.Type (jtype_inj t))
  | Wildcard x ->
      !!(HO.Wildcard (option_inj (pair_inj polarity_inj jtype_inj) x))

and jtype_inj : jtype -> HO.jtype_injected = function
  | Null -> !!HO.Null
  | Array t -> !!(HO.Array (jtype_inj t))
  | Class (id, args) -> !!(HO.Class (Std.nat id, Std.list targ_inj args))
  | Interface (id, args) ->
      !!(HO.Interface (Std.nat id, Std.list targ_inj args))
  | Var { id; index; upb; lwb } ->
      !!(HO.Var
           {
             id = Std.nat id;
             index = Std.nat index;
             upb = jtype_inj upb;
             lwb = option_inj jtype_inj lwb;
           })
  | Intersect l -> !!(HO.Intersect (Std.list jtype_inj l))

let idecl_inj : idecl -> HO.idecl_injected =
 fun { params; supers } ->
  !!HO.
      { params = Std.list jtype_inj params; supers = Std.list jtype_inj supers }

let cdecl_inj : cdecl -> HO.cdecl_injected =
 fun { params; super; supers } ->
  !!HO.
      {
        params = Std.list jtype_inj params;
        super = jtype_inj super;
        supers = Std.list jtype_inj supers;
      }

let decl_inj : decl -> HO.decl_injected = function
  | I i -> !!(HO.I (idecl_inj i))
  | C c -> !!(HO.C (cdecl_inj c))

let class_ id args : JGS.HO.jtype_injected = !!(HO.Class (id, args))
let interface id args = !!(HO.Interface (id, args))
let array t = !!(HO.Array t)
let intersect xs = !!(HO.Intersect xs)
let wildcard xs : _ JGS.HO.targ_injected = !!(HO.Wildcard xs)
let type_ t : _ JGS.HO.targ_injected = !!(HO.Type t)
let var index id lwb upb = !!(HO.Var { index; id; lwb; upb })

(**************************************************************************************************)
(*********************************** Relational helpers *******************************************)
(**************************************************************************************************)

let remove_intersercts_and_vars query q =
  let open HO in
  wc @@ fun inter ->
  wc @@ fun id ->
  wc @@ fun lwb ->
  wc @@ fun upb ->
  wc @@ fun index ->
  fresh ()
    (q =/= !!(Intersect inter))
    (q =/= !!(Var { id; lwb; upb; index }))
    (query q)
