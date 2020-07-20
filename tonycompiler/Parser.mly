%{
  open Lexer
  open Ast
  open Error
  open Format
  open PrintErrors
  open Types


%}

%token <int> T_const
%token <string> T_var

%token T_eof
%token T_int
%token T_bool
%token T_char
%token T_list
%token T_nil
%token T_nil_qm
%token T_hashtag
%token T_head
%token T_tail
%token T_array
%token T_new
%token T_skip
%token T_decl
%token T_def
%token T_return
%token T_exit
%token T_ref
%token T_plus
%token T_minus
%token T_mul
%token T_div
%token T_mod
%token T_not
%token T_and
%token T_or
%token T_true
%token T_false
%token T_lparen
%token T_rparen
%token T_lbracket
%token T_rbracket
%token T_comma
%token T_semicolon
%token T_colon
%token T_assignment
%token T_equal
%token T_less
%token T_lesseq
%token T_greater
%token T_greatereq
%token T_noteq
%token T_if
%token T_else
%token T_elsif
%token T_for
%token T_end

%left T_or
%left T_and
%nonassoc T_not
%nonassoc T_equal T_noteq T_greater T_less T_greatereq T_lesseq
%right T_hashtag
%left T_plus T_minus
%left T_mul T_div T_mod
%nonassoc T_neg


%token <char> T_character
%token <string> T_string


%start program
%type <Ast.ast_program> program
%type <Ast.ast_func_def> func_def
%type <Ast.header_properties> header
%type <Ast.ast_inside_func_def list> inside_func_def
%type <Ast.same_type_defs_properties list> maybe_formal_defs
%type <Ast.same_type_defs_properties list> formal_defs
%type <Ast.same_type_defs_properties> same_type_defs
%type <string list> defs

%type <Ast.ast_func_decl> func_decl

%type <Ast.var_decl_properties> var_def

%type <Ast.ast_stmt list> stmt_list
%type <Ast.ast_stmt> stmt

%type <Ast.simple_properties> simple
%type <Ast.simple_properties list> simple_list
%type <Ast.expr_properties> expr
%type <Ast.expr_properties list> maybe_actual_params
%type <Ast.expr_properties list> actual_params

%%


/* Grammar */

program   : func_def T_eof    { (ast_tree := Some $1); $1 }

func_def  : T_def header T_colon inside_func_def stmt stmt_list T_end
            { Fundef ($2, $4, ($5 :: $6)) }
          | T_def header error { missing_colon_error ($startpos, $endpos); raise Terminate }
          | T_def header T_colon inside_func_def stmt stmt_list error { missing_end_error ($startpos, $endpos); raise Terminate }


header      : maybe_mytype T_var T_lparen maybe_formal_defs T_rparen
              { { header_info = FunHeader ($1, $2, $4); header_error_pos = ($startpos, $endpos); frame_size = 0; var_type_list = [] } }
            | maybe_mytype error { missing_func_name_error ($startpos, $endpos); raise Terminate }
            | maybe_mytype T_var error { missing_lparen_error ($startpos, $endpos); raise Terminate }
            | maybe_mytype T_var T_lparen error { header_definitions_error ($startpos, $endpos); raise Terminate }
            | maybe_mytype T_var T_lparen maybe_formal_defs error { missing_rparen_error ($startpos, $endpos); raise Terminate }



inside_func_def : func_def  inside_func_def    { (I_Fundef($1)) :: $2 }
                | func_decl inside_func_def    { (I_Fundecl($1)) :: $2 }
                | var_def   inside_func_def    { (I_Vardecl($1)) :: $2 }
                | /* empty */                  { [NO_OTHER_DEF] }

stmt_list   : /*empty*/       { [] }
            | stmt stmt_list  { $1 :: $2 }

stmt        : simple          { S_simple ($1) }
            | T_exit          { S_exit }
            | T_return expr   { S_return ($2) }
            | T_return error  { missing_return_expr ($startpos, $endpos); raise Terminate }
            | if_whole        { S_if  ($1) }
            | for_whole       { S_for ($1) }

for_whole : T_for for_head T_colon for_body  T_end  { ($2, $4) }
          | T_for for_head error                    { missing_colon_after_for_error ($startpos, $endpos); raise Terminate }
          | T_for for_head T_colon for_body error   { missing_end_after_for_error ($startpos, $endpos); raise Terminate }


for_head  : simple_list T_semicolon expr T_semicolon simple_list { ($1, $3, $5) }
          | simple_list error { missing_semic_after_for_error ($startpos, $endpos); raise Terminate }
          | simple_list T_semicolon error { expr_after_for_error ($startpos, $endpos); raise Terminate }
          | simple_list T_semicolon expr error { missing_semic_after_for_cond_error ($startpos, $endpos); raise Terminate }
          | simple_list T_semicolon expr T_semicolon error { simple_after_for_cond_error ($startpos, $endpos); raise Terminate }


for_body  : stmt stmt_list { $1 :: $2 }

if_whole    : if_cond if_body T_end  { ($1, $2) }
            | if_cond if_body error  { missing_end_after_if_error ($startpos, $endpos); raise Terminate }


if_cond     : T_if expr T_colon  { $2 }
            | T_if error         { expr_after_if_error ($startpos, $endpos); raise Terminate }
            | T_if expr error    { missing_colon_after_if_expr_error ($startpos, $endpos); raise Terminate }

if_body     : stmt stmt_list maybe_elif maybe_else  { ($1 :: $2, $3, $4) }


maybe_elif : /* empty */ { None }
            | elif_whole { Some $1 }

maybe_else : /* empty */ { None }
            | else_whole { Some $1 }

else_whole  : T_else T_colon stmt stmt_list { $3 :: $4 }
            | T_else { missing_colon_after_else_error ($startpos, $endpos); raise Terminate }


elif_whole  : elif_cond stmt stmt_list { [($1, $2 :: $3)]  }
            | elif_cond stmt stmt_list elif_whole  {  ($1, $2 :: $3) :: $4 }

elif_cond   : T_elsif expr T_colon { $2 }
            | T_elsif error        { expr_after_elsif_error ($startpos, $endpos); raise Terminate }
            | T_elsif expr error   { missing_colon_after_elsif_error ($startpos, $endpos); raise Terminate }



maybe_mytype : /* empty */ { TYPE_none }
             | mytype      { $1 }

maybe_formal_defs  : /* nothing */        { [] }
                   | formal_defs          { $1 }

formal_defs      : same_type_defs                          { [$1] }
                 | same_type_defs T_semicolon formal_defs  { $1 :: $3 }

same_type_defs   : mytype  defs      { { defs_info = SameTypeDefs ($1, $2); defs_error_pos = ($startpos, $endpos) } }
                 | T_ref mytype defs { { defs_info = SameTypeDefsByRef ($2, $3); defs_error_pos = ($startpos, $endpos) } }
                 | T_ref error       { missing_type_error ($startpos, $endpos); raise Terminate }

defs   : T_var                 { [$1] }
       | T_var T_comma defs    { $1 :: $3 }
      /* | T_var error           { missing_comma_var_def_error ($startpos, $endpos); raise Terminate } */



mytype    : T_int                               { TYPE_int }
          | T_bool                              { TYPE_bool }
          | T_char                              { TYPE_char }
          | mytype T_lbracket T_rbracket        { TYPE_array ($1, -1)}
          | T_list T_lbracket mytype T_rbracket { TYPE_list $3 }

func_decl   : T_decl header { $2 }

var_def     : mytype defs             { { var_info = ($1, $2); var_error_pos = ($startpos, $endpos) } }
          /*  | mytype error            { var_def_error ($startpos, $endpos); raise Terminate } */

simple      : T_skip                  { { simple_info = Simple_skip; simple_error_pos = ($startpos, $endpos) } }
            | atom T_assignment expr  { { simple_info = Simple_assignment($1, $3); simple_error_pos = ($startpos, $endpos) } }
            | atom T_assignment error {  syntax_assignment_error ($startpos, $endpos); raise Terminate }
            | call                    { { simple_info = Simple_call ($1); simple_error_pos = ($startpos, $endpos) }  }

simple_list : simple                                    { [$1] }
            | simple_list T_comma simple                { $3 :: $1 }


call        : T_var T_lparen maybe_actual_params T_rparen  { ($1, $3) }
            | T_var error { missing_lparen_call_error ($startpos, $endpos); raise Terminate }
            | T_var T_lparen error { wrong_function_call ($startpos, $endpos); raise Terminate }
            | T_var T_lparen maybe_actual_params error { missing_rparen_call_error ($startpos, $endpos); raise Terminate }



maybe_actual_params    : /* empty */    { [] }
                       | actual_params  { $1 }


actual_params   : expr                                 { [$1] }
                | expr T_comma actual_params           { $1 :: $3 }
                /*| expr error                           { missing_comma_call_args_error ($startpos, $endpos); raise Terminate } */



atom        : T_var                                     { { atom_info = A_var ($1); atom_error_pos = ($startpos, $endpos); atom_frame_place = 0; atom_depth = 0; atom_byrefFlag = false; atom_callbyref = false; } }
            | T_string                                  { { atom_info = A_string ($1); atom_error_pos = ($startpos, $endpos); atom_frame_place = 0; atom_depth = 0; atom_byrefFlag = false; atom_callbyref = false; } }
            | atom T_lbracket expr T_rbracket           { { atom_info = A_structure ($1, $3); atom_error_pos = ($startpos, $endpos); atom_frame_place = 0; atom_depth = 0; atom_byrefFlag = false; atom_callbyref = false; } }
            | atom T_lbracket expr error                { missing_rbracket_error ($startpos, $endpos); raise Terminate }
            | call                                      { { atom_info = A_call ($1); atom_error_pos = ($startpos, $endpos); atom_frame_place = 0; atom_depth = 0; atom_byrefFlag = false; atom_callbyref = false; } }


expr        : atom                                      { { expr_info = E_atom ($1);     expr_error_pos = ($startpos, $endpos) }  }
            | T_const                                   { { expr_info = E_const($1);     expr_error_pos = ($startpos, $endpos) }  }
            | T_character                               { { expr_info = E_character($1); expr_error_pos = ($startpos, $endpos) }  }
            | T_lparen expr T_rparen                    { $2 }
            | T_lparen expr error                       { missing_rparen_expr_error ($startpos, $endpos); raise Terminate }
          /*  | unary_op expr %prec T_neg                 { { expr_info = E_unary_op ($1, $2); expr_error_pos = ($startpos, $endpos) }  }*/

            | T_plus expr                               { { expr_info = E_unary_op (O_plus, $2); expr_error_pos = ($startpos, $endpos) }  }
            | T_minus expr                              { { expr_info = E_unary_op (O_minus, $2); expr_error_pos = ($startpos, $endpos) } }

            | expr binary_op expr                       { { expr_info = E_binary_op ($1, $2, $3); expr_error_pos = ($startpos, $endpos) } }

/*
            | expr T_plus expr                          { E_binary_op ($1, O_plus, $3)  }
            | expr T_minus expr                         { E_binary_op ($1, O_minus, $3) }
            | expr T_mul expr                           { E_binary_op ($1, O_mul, $3)   }
            | expr T_div expr                           { E_binary_op ($1, O_div, $3)   }
            | expr T_mod expr                           { E_binary_op ($1, O_mod, $3)   }

*/

            | expr compare_op expr                      { { expr_info = E_compare_op ($1, $2, $3); expr_error_pos = ($startpos, $endpos); } }
/*
            | expr T_equal expr                         { E_compare_op ($1, O_eq, $3)        }
            | expr T_noteq expr                         { E_compare_op ($1, O_noteq,  $3)    }
            | expr T_less expr                          { E_compare_op ($1, O_less,   $3)    }
            | expr T_lesseq expr                        { E_compare_op ($1, O_lesseq, $3)    }
            | expr T_greater expr                       { E_compare_op ($1, O_greater, $3)   }
            | expr T_greatereq expr                     { E_compare_op ($1, O_greatereq, $3) }
*/

            | T_true                                    { { expr_info = E_true; expr_error_pos = ($startpos, $endpos); } }
            | T_false                                   { { expr_info = E_false; expr_error_pos = ($startpos, $endpos); } }

            | T_not expr                                { { expr_info = E_unary_op (O_not, $2); expr_error_pos = ($startpos, $endpos); } }

            | expr boolean_op expr                      { { expr_info = E_bool_op ($1, $2,  $3); expr_error_pos= ($startpos, $endpos); } }
/*
            | expr T_or expr                            { { E_bool_op ($1, O_or,  $3) }
            | expr T_and expr                           { { E_bool_op ($1, O_and, $3) }
*/
            | expr binary_op error                      { invalid_binary_expr_error($startpos, $endpos); raise Terminate }
            | expr compare_op error                     { invalid_cmp_expr_error($startpos, $endpos); raise Terminate }

            | T_new mytype T_lbracket expr T_rbracket   { { expr_info = E_new ($2,  $4);   expr_error_pos = ($startpos, $endpos) } }
            | T_new mytype error                        { missing_lbracket_new_error ($startpos, $endpos); raise Terminate }
            | T_new mytype T_lbracket expr error        { missing_rbracket_new_error ($startpos, $endpos); raise Terminate }
            | T_nil                                     { { expr_info = E_nil;             expr_error_pos = ($startpos, $endpos) } }

            | T_nil_qm T_lparen expr T_rparen           { { expr_info = E_nilqm($3);       expr_error_pos = ($startpos, $endpos) } }
            | expr T_hashtag expr                       { { expr_info = E_hashtag($1, $3); expr_error_pos = ($startpos, $endpos) } }
            | T_head T_lparen expr T_rparen             { { expr_info = E_head($3);        expr_error_pos = ($startpos, $endpos) } }
            | T_tail T_lparen expr T_rparen             { { expr_info = E_tail($3);        expr_error_pos = ($startpos, $endpos) } }


%inline unary_op:
    | T_minus   { O_minus }
    | T_plus    { O_plus  }

%inline binary_op:
    | T_plus    { O_plus  }
    | T_minus   { O_minus }
    | T_mul     { O_mul   }
    | T_div     { O_div   }
    | T_mod     { O_mod   }

%inline compare_op:
    | T_equal     { O_eq         }
    | T_noteq     { O_noteq      }
    | T_greater   { O_greater    }
    | T_less      { O_less       }
    | T_greatereq { O_greatereq  }
    | T_lesseq    { O_lesseq     }

%inline boolean_op:
    | T_and     { O_and }
    | T_or      { O_or  }

%%
