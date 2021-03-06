

type typ = TYPE_none	      (* no type (should not be used)       *)
        | TYPE_int	        (* int                                *)
        | TYPE_char	        (* byte                               *)
        | TYPE_bool	        (* boolean                            *)
        | TYPE_array of     (* array                              *)
            typ *	          (*   element type                     *)
            int	            (*   size of array, if known, or -1   *)
        | TYPE_list of	    (* list                               *)
            typ	            (*   element type                     *)

val sizeOfType : typ -> int
val equalType : typ -> typ -> bool
val getType : typ -> typ
