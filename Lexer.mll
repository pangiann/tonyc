{
open Lexing
open Parser




(*  convert string to a list of chars *)
let implode l =
  let result = Bytes.create(List.length l)
  in
    let rec imp i = function
     | [] -> result
     | c::l -> Bytes.set result i c;  imp (i+1) l
    in
     imp 0 l

(* convert list of chars to a string *)
let explode s =
  let rec exp i l =
    if i < 0 then l else exp (i - 1) (s.[i] :: l) in
   exp (String.length s - 1) []


(*  increment lines *)
let incr_linenum lexbuf =
  let pos = lexbuf.Lexing.lex_curr_p in

  lexbuf.Lexing.lex_curr_p <- { pos with
    Lexing.pos_lnum = pos.Lexing.pos_lnum + 1;
    Lexing.pos_bol = pos.Lexing.pos_cnum;
  }
  (*Printf.printf "our lines now are updated to: %d\n" pos.pos_lnum*)


(* function for errors *)
let error s start lexbuf =
    Printf.printf "[--------------------------]\nline: %d char: %d -> %s\n[--------------------------]\n" (start.pos_lnum) (start.pos_cnum - start.pos_bol)  (s)
(*  else
    let pos = lexbuf.Lexing.lex_curr_p in
      Printf.printf "[--------------------------]\nline: %d char: %d -> %s\n[--------------------------]\n" (pos.pos_lnum) (pos.pos_cnum - pos.pos_bol)  (s)*)



let create_hashtable size init =
  let tbl = Hashtbl.create size in
    List.iter (fun (key, data) -> Hashtbl.add tbl key data) init;
     (tbl)
  (*
  type token =
    | T_eof   | T_const | T_var
    | T_int   | T_bool  | T_char
    | T_list  | T_nil   | T_nil_qm | T_hashtag | T_head | T_tail
    | T_array
    | T_new
    | T_skip
    | T_decl  | T_def   | T_return | T_exit | T_ref
    | T_plus  | T_minus | T_mul | T_div | T_mod
    | T_not   | T_and   | T_or | T_true | T_false
    | T_lparen | T_rparen | T_lbracket | T_rbracket
    | T_comma | T_semicolon | T_colon | T_assignment
    | T_equal | T_less | T_lesseq | T_greater | T_greatereq  | T_noteq
    | T_if | T_else | T_elsif | T_for | T_end
    | T_character of char | T_string of string
  *)
  let keyword_table =
  create_hashtable 26 [
     ("int", T_int);     ("bool", T_bool);   ("char", T_char);
     ("list", T_list);   ("nil", T_nil);     ("nil?", T_nil_qm);
     ("head", T_head);   ("tail", T_tail);
     ("new", T_new);
     ("skip", T_skip);
     ("decl", T_decl);   ("def", T_def);     ("return", T_return);     ("exit", T_exit);     ("ref", T_ref);
     ("mod", T_mod);
     ("not", T_not);     ("and", T_and);     ("or", T_or);
     ("true", T_true);   ("false", T_false);
     ("if", T_if);       ("else", T_else);   ("elsif", T_elsif);
     ("for", T_for);     ("end", T_end);
  ]

}


let digit = ['0'-'9']
let int = '-'? digit+
let letter = ['a' - 'z' 'A' - 'Z']
let hex = ['0' - '9' 'a' - 'f' 'A' - 'F']
let white = [' ' '\t' '\r']
let id = letter (letter | digit | '_' | '?')*



rule lexer =
  parse
  | id as word
   { try
      let token = Hashtbl.find keyword_table word in
      token
    with Not_found ->
      T_var (word)
    }

  | '#'      { T_hashtag }
  | '+'      { T_plus }
  | '-'      { T_minus }
  | '*'      { T_mul }
  | '/'      { T_div }

  | '"'      { read_string [] (lexbuf.Lexing.lex_curr_p) (lexbuf) }
  | "'"      { read_char (lexbuf.Lexing.lex_curr_p) (lexbuf) }

  | '('      { T_lparen }
  | ')'      { T_rparen }
  | '['      { T_lbracket }
  | ']'      { T_rbracket }
  | ','      { T_comma }
  | ';'      { T_semicolon }
  | ':'      { T_colon }
  | ":="     { T_assignment }
  | '='      { T_equal }
  | '<'      { T_less }
  | "<="     { T_lesseq }
  | '>'      { T_greater }
  | ">="     { T_greatereq }
  | "<>"     { T_noteq }

  | '%' [^ '\n']* '\n'  { incr_linenum lexbuf; lexer lexbuf }
  | "<*"                { multiline_comments 0 (lexbuf.Lexing.lex_curr_p) lexbuf }

  | digit+ as dig { T_const (int_of_string dig) }

  | '\n'     { incr_linenum lexbuf; lexer lexbuf}
  | white+   { lexer lexbuf }
  | _ as chr { error ("invalid character") (lexbuf.Lexing.lex_curr_p) (lexbuf);
                    lexer lexbuf }
  | eof     { T_eof }


(*multiline_comments*)
and multiline_comments level position = parse
     | "*>" { Printf.printf "comments (%d) end\n" level;
              if level = 0 then
                lexer lexbuf
              else multiline_comments (level-1) (position) lexbuf
            }

    | "<*"  { Printf.printf "comments (%d) start\n" (level+1);
              multiline_comments (level+1) (position) lexbuf
            }
    | '\n'  { incr_linenum lexbuf; multiline_comments (level) (position) (lexbuf) }
    | _     { multiline_comments (level) (position) lexbuf }
    | eof   { error ("comments are not closed") (position) (lexbuf);
              T_eof
            }



(*Characters*)
and read_char position = parse
     | '\\' 'n' '\''  {T_character ('\n')}
     | '\\' 't' '\''  {T_character ('\t')}
     | '\\' 'r' '\''  {T_character ('\r')}
     | '\\' '0' '\''  {T_character ('\000')}
     | '\\' '\\' '\'' {T_character ('\\')}
     | '\\' '\'' '\'' {T_character ('\'')}
     | '\\' '\"' '\'' {T_character ('\"')}

    (* | '\\' "x" hex hex '\'' as temp  { T_character (temp)  } *) (* prosoxi na to doyme *)

     | _ as chr '\''  {  T_character (chr) }
     | _              { dispose_char position lexbuf  }

and dispose_char position = parse
     | '\n'               { incr_linenum lexbuf; dispose_char position lexbuf}         (* add line *)

     | '\''               { error("invalid character") (position) (lexbuf); lexer lexbuf}

     | eof                { error("Character not terminated") (position) (lexbuf); T_eof }  (* ERROR("character not terminated") *)


     | _                  { dispose_char position lexbuf }

(*Strings*)
and read_string my_string position_start = parse

  | '\\' 'n'          { read_string (('\n')::my_string) (position_start) (lexbuf) }
  | '\\' '0'          { read_string (('\000')::my_string) (position_start) (lexbuf) }
  | '\\' 'r'          { read_string (('\r')::my_string) (position_start) (lexbuf) }
  | '\\' 't'          { read_string (('\t')::my_string) (position_start) (lexbuf) }
  | '\\' '\\'         { read_string (('\\')::my_string) (position_start) (lexbuf) }
  | '\\' '\"'         { read_string (('\"')::my_string) (position_start) (lexbuf) }

  | [^ '\n' '"' '\\']+ as word { let
                                  new_list = ((List.rev (explode (word))) @ (my_string))
                                 in
                                  read_string (new_list) (position_start) (lexbuf)
                               }

  | '"'                        { let
                                  str = Bytes.to_string(implode ( List.rev my_string ))
                                 in

                                  T_string (str)
                               }

  | _              { dispose_string (my_string) (position_start) (lexbuf) }

and dispose_string my_string position_start  = parse
   | '\n'         { incr_linenum lexbuf; dispose_string (my_string) (position_start) lexbuf }
   | '"'          { error ("strings with many lines not valid") (position_start) (lexbuf); lexer lexbuf }

   | eof          { error ("string not terminated") (position_start) (lexbuf);  T_eof  }
   | _            { dispose_string (my_string) (position_start) (lexbuf) }


  {
   let string_of_token token =
       match token with
       | T_eof   -> "T_eof"
       | T_const _ -> "T_const"
       | T_var _  -> "T_var"
       | T_int   -> "T_int"
       | T_bool  -> "T_bool"
       | T_char  -> "T_char"
       | T_list  -> "T_list"
       | T_nil   -> "T_nil"
       | T_nil_qm -> "T_nil_qm"
       | T_hashtag -> "T_hashtag"
       | T_head   -> "T_head"
       | T_tail   -> "T_tail"
       | T_array  -> "T_array"
       | T_new    -> "T_new"
       | T_skip   -> "T_skip"
       | T_decl   -> "T_decl"
       | T_def    -> "T_def"
       | T_return -> "T_return"
       | T_exit   -> "T_exit"
       | T_ref    -> "T_ref"
       | T_plus   -> "T_plus"
       | T_minus  -> "T_minus"
       | T_mul    -> "T_mul"
       | T_div    -> "T_div"
       | T_mod    -> "T_mod"
       | T_not    -> "T_not"
       | T_and    -> "T_and"
       | T_or     -> "T_or"
       | T_true   -> "T_true"
       | T_false  -> "T_false"
       | T_lparen -> "T_lparen"
       | T_rparen -> "T_rparen"
       | T_lbracket  -> "T_lbracket"
       | T_rbracket  -> "T_rbracket"
       | T_comma   -> "T_comma"
       | T_semicolon  -> "T_semicolon"
       | T_colon  -> "T_colon"
       | T_assignment  -> "T_assignment"
       | T_equal  -> "T_equal"
       | T_less   -> "T_less"
       | T_lesseq  -> "T_lesseq"
       | T_greater  -> "T_greater"
       | T_greatereq  -> "T_greatereq"
       | T_noteq  -> "T_noteq"
       | T_if  -> "T_if"
       | T_else  -> "T_else"
       | T_elsif  -> "T_elsif"
       | T_for  -> "T_for"
       | T_end  -> "T_end"
       | T_string _ -> "T_string"
       | T_character _ -> "T_character"



   let rec parse lexbuf =
      let token = lexer lexbuf in
      Printf.printf "token = %s, lexeme = \"%s\"\n"
        (string_of_token token) (Lexing.lexeme lexbuf);
      if token <> T_eof then parse lexbuf

(*
   let main () =
       let cin =
         if Array.length Sys.argv > 1
         then open_in Sys.argv.(1)
         else stdin
       in
       let lexbuf = Lexing.from_channel cin in
       try parse lexbuf
       with End_of_file -> ()
   let _ = Printexc.print main ()

       (* let rec loop () =
           let token = lexer lexbuf in
           Printf.printf "token = %s, lexeme =\"%s\"\n"
             (string_of_token token) (Lexing.lexeme lexbuf);
           if token <> T_eof then loop () in
       loop ()
       *)
       *)
  }
