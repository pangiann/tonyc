%{
 open Ast
%}



%token T_eof
%token <int> T_const
%token <string> T_var
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
%type <Ast.ast_stmt list> program
%type <ast_stmt list> stmt_list
%type <ast_stmt> stmt

%type <ast_expr> expr


%%

/* Grammar */
program   : func_def T_eof    { () }

stmt_list   : /*empty*/       { () }
            | stmt stmt_list  { () }

stmt        : simple          { () }
            | T_exit          { () }
            | T_return expr   { () }
            | T_if expr T_colon stmt stmt_list elif else_aux T_end            { () }
            | T_for simple_list T_semicolon expr T_semicolon simple_list T_colon stmt stmt_list T_end { () }



elif        : /*empty*/                                 { () }
            | T_elsif expr T_colon stmt stmt_list elif  { () }

else_aux    : /*empty*/ { () }
            | T_else T_colon stmt stmt_list { () }


func_def    : T_def header T_colon inside_func_def stmt stmt_list T_end { () }


header      : mytype_aux T_var T_lparen args T_rparen { () }


mytype_aux  : /* empty */ { () }
            | mytype { () }

args        : formal               { () }
            | /* nothing */        { () }
            | formal T_semicolon args_aux  { () }

args_aux    : formal T_semicolon args_aux  { () }
            | formal                       { () }

formal      : ref mytype T_var formal_id { () }



ref        : /* empty */ { () }
           | T_ref { () }


mytype    : T_int                               { () }
          | T_bool                              { () }
          | T_char                              { () }
          | mytype T_lbracket T_rbracket        { () }
          | T_list T_lbracket mytype T_rbracket { () }


formal_id : /*empty*/               { () }
          | T_comma T_var formal_id  { () }


inside_func_def : inside_func_def func_def    { () }
                | inside_func_def func_decl   { () }
                | inside_func_def var_def     { () }
                | /* empty */                 { () }


func_decl   : T_decl header { () }


var_def     : mytype T_var formal_id { () }


simple      : T_skip                  { () }
            | atom T_assignment expr  { () }
            | call                    { () }

simple_list : simple                                    { () }
            | simple_list T_comma simple                { () }


call        : T_var T_lparen expr_aux T_rparen  { () }


expr_aux    : /* empty */ { () }
            | expr expr_list { () }


expr_list   : /*empty*/                                 { () }
            | T_comma expr expr_list                    { () }


atom        : T_var                                     { () }
            | T_string                                  { () }
            | atom T_lbracket expr T_rbracket           { () }
            | call                                      { () }


expr        : atom                                      { () }
            | T_const                                   { E_const $1 }
            | T_character                               { E_character $1 }
            | T_lparen expr T_rparen                    { $2 }

            | T_plus expr                               { $2 }
            | T_minus expr                              { E_unary_op (O_minus, $2) }

            | expr T_plus expr                          { E_op ($1, O_plus, $3)  }
            | expr T_minus expr                         { E_op ($1, O_minus, $3) }
            | expr T_mul expr                           { E_op ($1, O_mul, $3)   }
            | expr T_div expr                           { E_op ($1, O_div, $3)   }
            | expr T_mod expr                           { E_op ($1, O_mod, $3)   }


            | expr T_equal expr                         { E_op ($1, O_eq, $3)        }
            | expr T_noteq expr                         { E_op ($1, O_noteq, $3)     }
            | expr T_less expr                          { E_op ($1, O_less, $3)      }
            | expr T_lesseq expr                        { E_op ($1, O_lesseq, $3)    }
            | expr T_greater expr                       { E_op ($1, O_greater, $3)   }
            | expr T_greatereq expr                     { E_op ($1, O_greatereq, $3) }


            | T_true                                    { E_true  $1           }
            | T_false                                   { E_false $1           }

            | T_not expr                                { E_unary_op (O_not $2)}
            | expr T_or expr                            { E_op ($1, O_or,  $2) }
            | expr T_and expr                           { E_op ($1, O_and, $2) }

            | T_new mytype T_lbracket expr T_rbracket   {  }
            | T_nil                                     {  }
            | T_nil_qm T_lparen expr T_rparen           {  }
            | expr T_hashtag expr                       {  }
            | T_head T_lparen expr T_rparen             { () }
            | T_tail T_lparen expr T_rparen             { () }

%%
