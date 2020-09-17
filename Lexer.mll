{
open Lexing
open Parser
open PrintErrors
open Error
open Format
exception Terminate

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

exception Not_Hex_Digit of char

(* Checks if a character represents a hex value *)
let is_hex ch = (ch >= '0' && ch <= '9') || (ch >= 'a' && ch <= 'f') || (ch >= 'A' && ch <= 'Z')

(* Returns the hexadecimal value of a character *)
let hex_value ch position_start position_end = match ch with
 | '0'..'9' -> Char.code ch - Char.code '0'
 | 'a'..'f' -> Char.code ch - Char.code 'a' + 10
 | 'A'..'F' -> Char.code ch - Char.code 'A' + 10
 | _ as c -> let pos = position_context position_start position_end in
             print_position err_formatter pos;
             fatal "Not valid hex value";
             raise Terminate

(* Returns the ASCII code of a hex char of the form: '\xhh' *)
let parse_hex str position_start position_end =
 let h1 = hex_value str.[2] position_start position_end in
 let h2 = hex_value str.[3] position_start position_end in
 Char.chr (16 * h1 + h2)


(*  increment lines *)
let incr_linenum lexbuf =
  let pos = lexbuf.Lexing.lex_curr_p in

  lexbuf.Lexing.lex_curr_p <- { pos with
    Lexing.pos_lnum = pos.Lexing.pos_lnum + 1;
    Lexing.pos_bol = pos.Lexing.pos_cnum;
  }






let create_hashtable size init =
  let tbl = Hashtbl.create size in
    List.iter (fun (key, data) -> Hashtbl.add tbl key data) init;
     (tbl)

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
  | _ as chr {   let pos = position_point lexbuf.Lexing.lex_curr_p in
            		 print_position err_formatter pos;
            		 error "Invalid character %c" chr;
                 lexer lexbuf
             }
  | eof     { T_eof }


(*multiline_comments*)
and multiline_comments level position_start = parse
     | "*>" {

              if level = 0 then
                lexer lexbuf
              else multiline_comments (level-1) (position_start) lexbuf
            }

    | "<*"  {
              multiline_comments (level+1) (position_start) lexbuf
            }
    | '\n'  { incr_linenum lexbuf; multiline_comments (level) (position_start) (lexbuf) }
    | _     { multiline_comments (level) (position_start) lexbuf }
    | eof   { let position_end = lexbuf.Lexing.lex_curr_p in
  			      let pos = position_context position_start position_end in
  			      print_position err_formatter pos;
  			      fatal "Unterminated comment section";
  			      T_eof
            }



(*Characters*)
and read_char position_start = parse
     | '\\' 'n' '\''  {T_character ('\n')}
     | '\\' 't' '\''  {T_character ('\t')}
     | '\\' 'r' '\''  {T_character ('\r')}
     | '\\' '0' '\''  {T_character ('\000')}
     | '\\' '\\' '\'' {T_character ('\\')}
     | '\\' '\'' '\'' {T_character ('\'')}
     | '\\' '\"' '\'' {T_character ('\"')}

     | '\\' "x" hex hex '\'' as temp  { T_character (String.get (String.make 1 (parse_hex (temp) (position_start) (lexbuf.Lexing.lex_curr_p))) (0) )  } (* prosoxi na to doyme *)

     | _ as chr '\''  {  T_character (chr) }
     | _              { dispose_char position_start lexbuf  }

and dispose_char position_start = parse
     | '\n'               { incr_linenum lexbuf; dispose_char position_start lexbuf}         (* add line *)

     | '\''               { let position_end = lexbuf.Lexing.lex_curr_p in
   		                      let pos = position_context position_start position_end in
   			                    print_position err_formatter pos;
   			                    error "Invalid character constant";
   			                    lexer lexbuf
                          }

     | eof                { let position_end = lexbuf.Lexing.lex_curr_p in
   		                      let pos = position_context position_start position_end in
   			                    print_position err_formatter pos;
   			                    fatal "Character constant terminated with EOF";
   			                    T_eof
                          }  (* ERROR("character not terminated") *)


     | _                  { dispose_char position_start lexbuf }

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
   | '"'          { let position_end = lexbuf.Lexing.lex_curr_p in
 		                let pos = position_context position_start position_end in
 			              print_position err_formatter pos;
 			              error "Multiline string";
 			              lexer lexbuf
                  }

   | eof          { let position_end = lexbuf.Lexing.lex_curr_p in
 		                let pos = position_context position_start position_end in
 			              print_position err_formatter pos;
 			              fatal "String terminated with EOF";
                    T_eof
                  }
   | _            { dispose_string (my_string) (position_start) (lexbuf) }
