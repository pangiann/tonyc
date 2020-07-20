type typ =
    TYPE_none
  | TYPE_int
  | TYPE_char
  | TYPE_bool
  | TYPE_array of
      typ *
      int
  | TYPE_list of
      typ

let rec sizeOfType t =
  match t with
  | TYPE_int            -> 8
  | TYPE_char           -> 1
  | TYPE_bool           -> 1
  | TYPE_array (et, sz) -> 8
  | TYPE_list   _       -> 8
  | _                   -> 0


let rec equalType t1 t2 =
 let rec extract_list_type l = match l with
   | TYPE_list t -> extract_list_type t
   | x -> x
 in
 match t1, t2 with
 | TYPE_array (et1, sz1), TYPE_array (et2, sz2) -> equalType et1 et2
 | TYPE_list et1, TYPE_list et2                 -> equalType et1 et2 || ((extract_list_type (TYPE_list et2)) = TYPE_none) || ((extract_list_type (TYPE_list et1)) = TYPE_none) (* empty list has type: TYPE_list TYPE_none *)
 | _                                            -> t1 = t2

let rec getType = function
 | TYPE_list  t      -> getType t
 | TYPE_array (t, _) -> getType t
 | x                 -> x
