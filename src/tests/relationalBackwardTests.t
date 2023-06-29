  $ ./relationalBackwardTests.exe
  1.1 (?) < Object : 
  [
    Array (Class (1, []));
    Class (1, []);
    Interface (1, [])
  ]
  
  
  ****************************************************************************************************
  
  1.2 Object[] < (?) : 
  [
    Class (1, []);
    Interface (2, []);
    Interface (3, []);
    Array (Var {id=_.55, index=_.56, upb=_.57, lwb=Some (Class (1, []))});
    Array (Interface (1, []));
    Array (Class (1, []))
  ]
  
  
  ****************************************************************************************************
  
  2 (?) < Cloneable : 
  [
    Array (Class (1, []));
    Class (2, []);
    Interface (2, [])
  ]
  
  
  ****************************************************************************************************
  
  3 (?) < Serializable : 
  [
    Array (Class (1, []));
    Class (3, []);
    Intersect ([Interface (3, []) | _.72]);
    Var {id=_.62, index=_.63, upb=Interface (3, []), lwb=_.64};
    Null;
    Intersect ([_.71 [=/= Interface (3, [])]; Interface (3, []) | _.156]);
    Intersect ([_.71 [=/= Interface (3, [])]; _.155 [=/= Interface (3, [])]; Interface (3, []) | _.183]);
    Intersect ([_.71 [=/= Interface (3, [])]; _.155 [=/= Interface (3, [])]; _.182 [=/= Interface (3, [])]; Interface (3, []) | _.214]);
    Interface (3, []);
    Intersect ([_.71 [=/= Interface (3, [])]; _.155 [=/= Interface (3, [])]; _.182 [=/= Interface (3, [])]; _.213 [=/= Interface (3, [])]; Interface (3, []) | _.244])
  ]
  
  
  ****************************************************************************************************
  
  4.1 (?) < Object[] : 
  [
    Array (Class (1, []));
    Array (Array (Class (1, [])));
    Array (Intersect ([Class (1, []) | _.556]));
    Array (Var {id=_.523, index=_.524, upb=Class (1, []), lwb=_.525});
    Array (Null);
    Array (Intersect ([_.555 [=/= Class (1, [])]; Class (1, []) | _.921]));
    Array (Class (2, []));
    Array (Class (3, []));
    Array (Intersect ([_.555 [=/= Class (1, [])]; _.920 [=/= Class (1, [])]; Class (1, []) | _.1032]));
    Array (Intersect ([_.555 [=/= Class (1, [])]; _.920 [=/= Class (1, [])]; _.1031 [=/= Class (1, [])]; Class (1, []) | _.1156]))
  ]
  
  
  ****************************************************************************************************
  
  4.2 Object < (?) : 
  [
    Var {id=_.42, index=_.43, upb=_.44, lwb=Some (Class (1, []))};
    Interface (1, []);
    Class (1, [])
  ]
  
  
  ****************************************************************************************************
  
  5 Cloneable < (?): 
  [
    Var {id=_.44, index=_.45, upb=_.46, lwb=Some (Interface (2, []))};
    Class (2, []);
    Interface (2, []);
    Class (1, []);
    Interface (1, [])
  ]
  
  
  ****************************************************************************************************
  
  6 Serializable < (?) : 
  [
    Var {id=_.44, index=_.45, upb=_.46, lwb=Some (Interface (3, []))};
    Class (3, []);
    Interface (3, []);
    Class (1, []);
    Interface (1, [])
  ]
  
  
  ****************************************************************************************************
  
  7.1 (?) < Serializable[] : 
  [
    Array (Array (Class (1, [])));
    Array (Class (3, []));
    Array (Intersect ([Interface (3, []) | _.547]));
    Array (Var {id=_.508, index=_.509, upb=Interface (3, []), lwb=_.510});
    Array (Null);
    Array (Intersect ([_.546 [=/= Interface (3, [])]; Interface (3, []) | _.922]));
    Array (Intersect ([_.546 [=/= Interface (3, [])]; _.921 [=/= Interface (3, [])]; Interface (3, []) | _.1036]));
    Array (Intersect ([_.546 [=/= Interface (3, [])]; _.921 [=/= Interface (3, [])]; _.1035 [=/= Interface (3, [])]; Interface (3, []) | _.1163]));
    Array (Interface (3, []));
    Array (Intersect ([_.546 [=/= Interface (3, [])]; _.921 [=/= Interface (3, [])]; _.1035 [=/= Interface (3, [])]; _.1162 [=/= Interface (3, [])]; Interface (3, []) | _.1293]))
  ]
  
  
  ****************************************************************************************************
  
  7.2 Object[][] < (?) : 
  [
    Array (Class (1, []));
    Array (Interface (2, []));
    Array (Interface (3, []));
    Array (Array (Var {id=_.68, index=_.69, upb=_.70, lwb=Some (Class (1, []))}));
    Array (Array (Interface (1, [])));
    Array (Array (Class (1, [])))
  ]
  
  
  ****************************************************************************************************
  
  Class A: 66
  
  Class B: 67
  
  8.1 (?) < A : 
  [
    Class (66, []);
    Class (67, []);
    Interface (66, [])
  ]
  
  
  ****************************************************************************************************
  
  8.2 B < (?) : 
  [
    Var {id=_.42, index=_.43, upb=_.44, lwb=Some (Class (67, []))};
    Interface (67, []);
    Class (67, []);
    Interface (66, []);
    Class (66, [])
  ]
  
  
  ****************************************************************************************************
  
  8.3 (?) < B : 
  [
    Class (67, []);
    Interface (67, [])
  ]
  
  
  ****************************************************************************************************
  
  8.4 A < (?) : 
  [
    Var {id=_.42, index=_.43, upb=_.44, lwb=Some (Class (66, []))};
    Interface (66, []);
    Class (66, []);
    Interface (1, []);
    Class (1, [])
  ]
  
  
  ****************************************************************************************************
  
  Interface A: 81
  
  Class C: 82
  
  9 C < (?) : 
  [
    Var {id=_.42, index=_.43, upb=_.44, lwb=Some (Class (82, []))};
    Interface (82, []);
    Class (82, []);
    Interface (66, []);
    Class (66, []);
    Interface (81, []);
    Class (81, [])
  ]
  
  
  ****************************************************************************************************
  
  10.1 (?) < IA : 
  [
    Class (81, []);
    Class (82, []);
    Interface (81, [])
  ]
  
  
  ****************************************************************************************************
  
  10.2 C < (?) : 
  [
    Var {id=_.42, index=_.43, upb=_.44, lwb=Some (Class (82, []))};
    Interface (82, []);
    Class (82, []);
    Interface (66, []);
    Class (66, []);
    Interface (81, []);
    Class (81, [])
  ]
  
  
  ****************************************************************************************************
  
  Interface B: 89
  
  11 IB < (?) : 
  [
    Var {id=_.44, index=_.45, upb=_.46, lwb=Some (Interface (89, []))};
    Class (89, []);
    Interface (89, []);
    Class (81, []);
    Interface (81, [])
  ]
  
  
  ****************************************************************************************************
  
  Class D<X>: 90
  
  Class E<X, Y>: 91
  
  Class F<X, Y>: 94
  
  12.1 (?) < E<D<B>, A> : 
  [
    Class (94, [Type (Class (66, [])); Type (Class (67, []))]);
    Interface (94, [Type (Class (66, [])); Type (Class (67, []))]);
    Class (94, [Type (Class (66, [])); Type (Class (67, [])); Type (Class (_.14060, []))]);
    Interface (94, [Type (Class (66, [])); Type (Class (67, [])); Type (Class (_.14099, []))]);
    Class (94, [Type (Class (66, [])); Type (Class (67, [])); Type (Interface (_.15508, []))]);
    Interface (94, [Type (Class (66, [])); Type (Class (67, [])); Type (Interface (_.15559, []))]);
    Class (94, [Type (Class (66, [])); Type (Class (67, [])); Type (Array (Class (_.16928, [])))]);
    Interface (94, [Type (Class (66, [])); Type (Class (67, [])); Type (Array (Class (_.16980, [])))]);
    Class (94, [Type (Class (66, [])); Type (Class (67, [])); Type (Null)]);
    Interface (94, [Type (Class (66, [])); Type (Class (67, [])); Type (Null)])
  ]
  
  
  ****************************************************************************************************
  
  12.2 (? - is class) < E<D<B>, A> : 
  [
    Class (94, [Type (Class (66, [])); Type (Class (67, []))]);
    Class (94, [Type (Class (66, [])); Type (Class (67, [])); Type (Class (_.6995, []))]);
    Class (94, [Type (Class (66, [])); Type (Class (67, [])); Type (Interface (_.7719, []))]);
    Class (94, [Type (Class (66, [])); Type (Class (67, [])); Type (Array (Class (_.8425, [])))]);
    Class (94, [Type (Class (66, [])); Type (Class (67, [])); Type (Null)]);
    Class (94, [Type (Class (66, [])); Type (Class (67, [])); Type (Intersect ([]))]);
    Class (94, [Type (Class (66, [])); Type (Class (67, [])); Type (Array (Interface (_.9070, [])))]);
    Class (94, [Type (Class (66, [])); Type (Class (67, [])); Type (Array (Array (Class (_.10761, []))))]);
    Class (94, [Type (Class (66, [])); Type (Class (67, [])); Type (Class (_.6995, [Type (Var {id=_.14725, index=0, upb=_.14726, lwb=_.14727})]))]);
    Class (94, [Type (Class (66, [])); Type (Class (67, [])); Type (Array (Null))])
  ]
  
  
  ****************************************************************************************************
  
  12.3 F<A, B> < (?) : 
  [
    Var {id=_.160, index=_.161, upb=_.162, lwb=Some (Class (94, [Type (Class (66, [])); Type (Class (67, []))]))};
    Interface (91, [Type (Class (90, [Type (Class (67, []))])); Type (Class (66, []))]);
    Class (91, [Type (Class (90, [Type (Class (67, []))])); Type (Class (66, []))]);
    Interface (94, [Type (Class (66, [])); Type (Class (67, []))]);
    Class (94, [Type (Class (66, [])); Type (Class (67, []))]);
    Interface (94, [Type (Class (66, [])); Wildcard (Some ((Extends, Class (67, []))))]);
    Class (94, [Type (Class (66, [])); Wildcard (Some ((Extends, Class (67, []))))]);
    Interface (94, [Type (Class (66, [])); Wildcard (Some ((Super, Class (67, []))))]);
    Class (94, [Type (Class (66, [])); Wildcard (Some ((Super, Class (67, []))))]);
    Interface (94, [Wildcard (Some ((Extends, Class (66, [])))); Type (Class (67, []))]);
    Class (94, [Wildcard (Some ((Extends, Class (66, [])))); Type (Class (67, []))]);
    Interface (94, [Wildcard (Some ((Extends, Class (66, [])))); Wildcard (Some ((Extends, Class (67, []))))]);
    Class (94, [Wildcard (Some ((Extends, Class (66, [])))); Wildcard (Some ((Extends, Class (67, []))))]);
    Interface (94, [Wildcard (Some ((Extends, Class (66, [])))); Wildcard (Some ((Super, Class (67, []))))]);
    Class (94, [Wildcard (Some ((Extends, Class (66, [])))); Wildcard (Some ((Super, Class (67, []))))]);
    Interface (94, [Wildcard (Some ((Super, Class (66, [])))); Type (Class (67, []))]);
    Class (94, [Wildcard (Some ((Super, Class (66, [])))); Type (Class (67, []))]);
    Interface (94, [Wildcard (Some ((Super, Class (66, [])))); Wildcard (Some ((Extends, Class (67, []))))]);
    Class (94, [Wildcard (Some ((Super, Class (66, [])))); Wildcard (Some ((Extends, Class (67, []))))]);
    Interface (94, [Wildcard (Some ((Super, Class (66, [])))); Wildcard (Some ((Super, Class (67, []))))]);
    Class (94, [Wildcard (Some ((Super, Class (66, [])))); Wildcard (Some ((Super, Class (67, []))))])
  ]

