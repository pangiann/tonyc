
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | T_var of (
# 13 "Parser.mly"
       (string)
# 11 "Parser.ml"
  )
    | T_true
    | T_tail
    | T_string of (
# 74 "Parser.mly"
       (string)
# 18 "Parser.ml"
  )
    | T_skip
    | T_semicolon
    | T_rparen
    | T_return
    | T_ref
    | T_rbracket
    | T_plus
    | T_or
    | T_noteq
    | T_not
    | T_nil_qm
    | T_nil
    | T_new
    | T_mul
    | T_mod
    | T_minus
    | T_lparen
    | T_list
    | T_lesseq
    | T_less
    | T_lbracket
    | T_int
    | T_if
    | T_head
    | T_hashtag
    | T_greatereq
    | T_greater
    | T_for
    | T_false
    | T_exit
    | T_equal
    | T_eof
    | T_end
    | T_elsif
    | T_else
    | T_div
    | T_def
    | T_decl
    | T_const of (
# 12 "Parser.mly"
       (int)
# 61 "Parser.ml"
  )
    | T_comma
    | T_colon
    | T_character of (
# 73 "Parser.mly"
       (char)
# 68 "Parser.ml"
  )
    | T_char
    | T_bool
    | T_assignment
    | T_array
    | T_and
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState312
  | MenhirState304
  | MenhirState303
  | MenhirState302
  | MenhirState296
  | MenhirState295
  | MenhirState290
  | MenhirState288
  | MenhirState287
  | MenhirState286
  | MenhirState285
  | MenhirState281
  | MenhirState279
  | MenhirState277
  | MenhirState273
  | MenhirState271
  | MenhirState267
  | MenhirState266
  | MenhirState264
  | MenhirState262
  | MenhirState260
  | MenhirState258
  | MenhirState257
  | MenhirState254
  | MenhirState252
  | MenhirState251
  | MenhirState249
  | MenhirState243
  | MenhirState240
  | MenhirState239
  | MenhirState235
  | MenhirState234
  | MenhirState232
  | MenhirState230
  | MenhirState229
  | MenhirState228
  | MenhirState226
  | MenhirState223
  | MenhirState220
  | MenhirState219
  | MenhirState216
  | MenhirState214
  | MenhirState213
  | MenhirState212
  | MenhirState211
  | MenhirState210
  | MenhirState208
  | MenhirState207
  | MenhirState205
  | MenhirState204
  | MenhirState202
  | MenhirState201
  | MenhirState199
  | MenhirState198
  | MenhirState196
  | MenhirState195
  | MenhirState194
  | MenhirState193
  | MenhirState191
  | MenhirState190
  | MenhirState188
  | MenhirState187
  | MenhirState186
  | MenhirState183
  | MenhirState180
  | MenhirState177
  | MenhirState176
  | MenhirState171
  | MenhirState170
  | MenhirState168
  | MenhirState166
  | MenhirState162
  | MenhirState160
  | MenhirState159
  | MenhirState158
  | MenhirState156
  | MenhirState155
  | MenhirState153
  | MenhirState152
  | MenhirState150
  | MenhirState149
  | MenhirState147
  | MenhirState146
  | MenhirState144
  | MenhirState143
  | MenhirState142
  | MenhirState139
  | MenhirState138
  | MenhirState136
  | MenhirState133
  | MenhirState132
  | MenhirState130
  | MenhirState129
  | MenhirState128
  | MenhirState125
  | MenhirState124
  | MenhirState119
  | MenhirState118
  | MenhirState116
  | MenhirState113
  | MenhirState109
  | MenhirState108
  | MenhirState107
  | MenhirState105
  | MenhirState104
  | MenhirState103
  | MenhirState101
  | MenhirState100
  | MenhirState98
  | MenhirState96
  | MenhirState95
  | MenhirState93
  | MenhirState91
  | MenhirState90
  | MenhirState88
  | MenhirState85
  | MenhirState83
  | MenhirState82
  | MenhirState79
  | MenhirState77
  | MenhirState76
  | MenhirState73
  | MenhirState71
  | MenhirState69
  | MenhirState68
  | MenhirState66
  | MenhirState64
  | MenhirState60
  | MenhirState58
  | MenhirState57
  | MenhirState51
  | MenhirState46
  | MenhirState45
  | MenhirState36
  | MenhirState35
  | MenhirState31
  | MenhirState29
  | MenhirState27
  | MenhirState25
  | MenhirState19
  | MenhirState18
  | MenhirState13
  | MenhirState11
  | MenhirState9
  | MenhirState5
  | MenhirState3
  | MenhirState1
  | MenhirState0

# 1 "Parser.mly"
  
  open Lexer
  open Ast
  open Error
  open Format
  open PrintErrors
  open Types



# 251 "Parser.ml"

let rec _menhir_reduce82 : _menhir_env -> ((('ttv_tail * _menhir_state * 'tv_maybe_mytype * Lexing.position) * Lexing.position * (
# 13 "Parser.mly"
       (string)
# 256 "Parser.ml"
) * Lexing.position) * Lexing.position) * _menhir_state * (
# 82 "Parser.mly"
      (Ast.same_type_defs_properties list)
# 260 "Parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__5_ ->
    let ((((_menhir_stack, _menhir_s, (_1 : 'tv_maybe_mytype), _startpos__1_), _endpos__2_, (_2 : (
# 13 "Parser.mly"
       (string)
# 266 "Parser.ml"
    )), _startpos__2_), _startpos__3_), _, (_4 : (
# 82 "Parser.mly"
      (Ast.same_type_defs_properties list)
# 270 "Parser.ml"
    ))) = _menhir_stack in
    let _5 = () in
    let _3 = () in
    let _v : (
# 80 "Parser.mly"
      (Ast.header_properties)
# 277 "Parser.ml"
    ) = let _endpos = _endpos__5_ in
    let _startpos = _startpos__1_ in
    
# 118 "Parser.mly"
                                                                  ( missing_rparen_error (_startpos, _endpos); raise Terminate )
# 283 "Parser.ml"
     in
    _menhir_goto_header _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce11 : _menhir_env -> (('ttv_tail * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 290 "Parser.ml"
) * Lexing.position) * _menhir_state * Lexing.position) * _menhir_state * (
# 97 "Parser.mly"
      (Ast.expr_properties list)
# 294 "Parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__4_ ->
    let (((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 13 "Parser.mly"
       (string)
# 300 "Parser.ml"
    )), _startpos__1_), _, _startpos__2_), _, (_3 : (
# 97 "Parser.mly"
      (Ast.expr_properties list)
# 304 "Parser.ml"
    ))) = _menhir_stack in
    let _4 = () in
    let _2 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__4_ in
    let _v : 'tv_call = let _endpos = _endpos__4_ in
    let _startpos = _startpos__1_ in
    
# 223 "Parser.mly"
                                                       ( missing_rparen_call_error (_startpos, _endpos); raise Terminate )
# 315 "Parser.ml"
     in
    _menhir_goto_call _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_goto_if_whole : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_if_whole -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv895) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_if_whole) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv893) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_if_whole) : 'tv_if_whole) = _v in
    ((let _v : (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 332 "Parser.ml"
    ) = 
# 134 "Parser.mly"
                              ( S_if  (_1) )
# 336 "Parser.ml"
     in
    _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv894)) : 'freshtv896)

and _menhir_error306 : _menhir_env -> ('ttv_tail * _menhir_state * 'tv_if_cond * Lexing.position) * _menhir_state * 'tv_if_body -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv891 * _menhir_state * 'tv_if_cond * Lexing.position) * _menhir_state * 'tv_if_body) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv889 * _menhir_state * 'tv_if_cond * Lexing.position) * _menhir_state * 'tv_if_body) = Obj.magic _menhir_stack in
    let (_endpos__3_ : Lexing.position) = _endpos in
    ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_if_cond), _startpos__1_), _, (_2 : 'tv_if_body)) = _menhir_stack in
    let _3 = () in
    let _v : 'tv_if_whole = let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 152 "Parser.mly"
                                     ( missing_end_after_if_error (_startpos, _endpos); raise Terminate )
# 356 "Parser.ml"
     in
    _menhir_goto_if_whole _menhir_env _menhir_stack _menhir_s _v) : 'freshtv890)) : 'freshtv892)

and _menhir_error53 : _menhir_env -> ((('ttv_tail * _menhir_state * 'tv_maybe_mytype * Lexing.position) * Lexing.position * (
# 13 "Parser.mly"
       (string)
# 363 "Parser.ml"
) * Lexing.position) * Lexing.position) * _menhir_state * (
# 82 "Parser.mly"
      (Ast.same_type_defs_properties list)
# 367 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv887 * _menhir_state * 'tv_maybe_mytype * Lexing.position) * Lexing.position * (
# 13 "Parser.mly"
       (string)
# 374 "Parser.ml"
    ) * Lexing.position) * Lexing.position) * _menhir_state * (
# 82 "Parser.mly"
      (Ast.same_type_defs_properties list)
# 378 "Parser.ml"
    )) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
    ((let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce82 _menhir_env (Obj.magic _menhir_stack) _endpos) : 'freshtv888)

and _menhir_reduce78 : _menhir_env -> ((('ttv_tail * _menhir_state * 'tv_maybe_mytype * Lexing.position) * Lexing.position * (
# 13 "Parser.mly"
       (string)
# 387 "Parser.ml"
) * Lexing.position) * Lexing.position) * _menhir_state * (
# 82 "Parser.mly"
      (Ast.same_type_defs_properties list)
# 391 "Parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__5_ ->
    let ((((_menhir_stack, _menhir_s, (_1 : 'tv_maybe_mytype), _startpos__1_), _endpos__2_, (_2 : (
# 13 "Parser.mly"
       (string)
# 397 "Parser.ml"
    )), _startpos__2_), _startpos__3_), _, (_4 : (
# 82 "Parser.mly"
      (Ast.same_type_defs_properties list)
# 401 "Parser.ml"
    ))) = _menhir_stack in
    let _5 = () in
    let _3 = () in
    let _v : (
# 80 "Parser.mly"
      (Ast.header_properties)
# 408 "Parser.ml"
    ) = let _endpos = _endpos__5_ in
    let _startpos = _startpos__1_ in
    
# 114 "Parser.mly"
              ( { header_info = FunHeader (_1, _2, _4); header_error_pos = (_startpos, _endpos); frame_size = 0; var_type_list = [] } )
# 414 "Parser.ml"
     in
    _menhir_goto_header _menhir_env _menhir_stack _menhir_s _v

and _menhir_error39 : _menhir_env -> ((('ttv_tail * _menhir_state * 'tv_maybe_mytype * Lexing.position) * Lexing.position * (
# 13 "Parser.mly"
       (string)
# 421 "Parser.ml"
) * Lexing.position) * Lexing.position) * _menhir_state * (
# 82 "Parser.mly"
      (Ast.same_type_defs_properties list)
# 425 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv885 * _menhir_state * 'tv_maybe_mytype * Lexing.position) * Lexing.position * (
# 13 "Parser.mly"
       (string)
# 432 "Parser.ml"
    ) * Lexing.position) * Lexing.position) * _menhir_state * (
# 82 "Parser.mly"
      (Ast.same_type_defs_properties list)
# 436 "Parser.ml"
    )) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
    ((let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce82 _menhir_env (Obj.magic _menhir_stack) _endpos) : 'freshtv886)

and _menhir_reduce106 : _menhir_env -> ('ttv_tail * _menhir_state * 'tv_mytype * Lexing.position) * _menhir_state -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__3_ _ ->
    let ((_menhir_stack, _menhir_s, (_1 : 'tv_mytype), _startpos__1_), _) = _menhir_stack in
    let _3 = () in
    let _2 = () in
    let _startpos = _startpos__1_ in
    let _v : 'tv_mytype = 
# 203 "Parser.mly"
                                                ( TYPE_array (_1, -1))
# 451 "Parser.ml"
     in
    _menhir_goto_mytype _menhir_env _menhir_stack _menhir_s _v _startpos

and _menhir_reduce13 : _menhir_env -> ('ttv_tail * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 458 "Parser.ml"
) * Lexing.position) -> Lexing.position -> _menhir_state -> (
# 85 "Parser.mly"
      (string list)
# 462 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__3_ _ (_3 : (
# 85 "Parser.mly"
      (string list)
# 467 "Parser.ml"
  )) ->
    let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 13 "Parser.mly"
       (string)
# 472 "Parser.ml"
    )), _startpos__1_) = _menhir_stack in
    let _2 = () in
    let _endpos = _endpos__3_ in
    let _v : (
# 85 "Parser.mly"
      (string list)
# 479 "Parser.ml"
    ) = 
# 195 "Parser.mly"
                               ( _1 :: _3 )
# 483 "Parser.ml"
     in
    _menhir_goto_defs _menhir_env _menhir_stack _endpos _menhir_s _v

and _menhir_goto_inside_func_def : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 81 "Parser.mly"
      (Ast.ast_inside_func_def list)
# 490 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv873 * _menhir_state * (
# 89 "Parser.mly"
      (Ast.var_decl_properties)
# 500 "Parser.ml"
        )) * _menhir_state * (
# 81 "Parser.mly"
      (Ast.ast_inside_func_def list)
# 504 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv871 * _menhir_state * (
# 89 "Parser.mly"
      (Ast.var_decl_properties)
# 510 "Parser.ml"
        )) * _menhir_state * (
# 81 "Parser.mly"
      (Ast.ast_inside_func_def list)
# 514 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 89 "Parser.mly"
      (Ast.var_decl_properties)
# 519 "Parser.ml"
        ))), _, (_2 : (
# 81 "Parser.mly"
      (Ast.ast_inside_func_def list)
# 523 "Parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 81 "Parser.mly"
      (Ast.ast_inside_func_def list)
# 528 "Parser.ml"
        ) = 
# 124 "Parser.mly"
                                               ( (I_Vardecl(_1)) :: _2 )
# 532 "Parser.ml"
         in
        _menhir_goto_inside_func_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv872)) : 'freshtv874)
    | MenhirState64 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv877 * _menhir_state * (
# 79 "Parser.mly"
      (Ast.ast_func_def)
# 540 "Parser.ml"
        )) * _menhir_state * (
# 81 "Parser.mly"
      (Ast.ast_inside_func_def list)
# 544 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv875 * _menhir_state * (
# 79 "Parser.mly"
      (Ast.ast_func_def)
# 550 "Parser.ml"
        )) * _menhir_state * (
# 81 "Parser.mly"
      (Ast.ast_inside_func_def list)
# 554 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 79 "Parser.mly"
      (Ast.ast_func_def)
# 559 "Parser.ml"
        ))), _, (_2 : (
# 81 "Parser.mly"
      (Ast.ast_inside_func_def list)
# 563 "Parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 81 "Parser.mly"
      (Ast.ast_inside_func_def list)
# 568 "Parser.ml"
        ) = 
# 122 "Parser.mly"
                                               ( (I_Fundef(_1)) :: _2 )
# 572 "Parser.ml"
         in
        _menhir_goto_inside_func_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv876)) : 'freshtv878)
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv881 * _menhir_state * (
# 87 "Parser.mly"
      (Ast.ast_func_decl)
# 580 "Parser.ml"
        )) * _menhir_state * (
# 81 "Parser.mly"
      (Ast.ast_inside_func_def list)
# 584 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv879 * _menhir_state * (
# 87 "Parser.mly"
      (Ast.ast_func_decl)
# 590 "Parser.ml"
        )) * _menhir_state * (
# 81 "Parser.mly"
      (Ast.ast_inside_func_def list)
# 594 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 87 "Parser.mly"
      (Ast.ast_func_decl)
# 599 "Parser.ml"
        ))), _, (_2 : (
# 81 "Parser.mly"
      (Ast.ast_inside_func_def list)
# 603 "Parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 81 "Parser.mly"
      (Ast.ast_inside_func_def list)
# 608 "Parser.ml"
        ) = 
# 123 "Parser.mly"
                                               ( (I_Fundecl(_1)) :: _2 )
# 612 "Parser.ml"
         in
        _menhir_goto_inside_func_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv880)) : 'freshtv882)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv883 * Lexing.position * _menhir_state * Lexing.position) * _menhir_state * (
# 80 "Parser.mly"
      (Ast.header_properties)
# 620 "Parser.ml"
        ))) * _menhir_state * (
# 81 "Parser.mly"
      (Ast.ast_inside_func_def list)
# 624 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_exit ->
            _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | T_for ->
            _menhir_run257 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_if ->
            _menhir_run252 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_return ->
            _menhir_run249 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_skip ->
            _menhir_run248 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState68 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_string _v ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState68 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_var _v ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState68 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState68) : 'freshtv884)
    | _ ->
        _menhir_fail ()

and _menhir_error245 : _menhir_env -> (('ttv_tail * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 653 "Parser.ml"
) * Lexing.position) * _menhir_state * Lexing.position) * _menhir_state * (
# 97 "Parser.mly"
      (Ast.expr_properties list)
# 657 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv869 * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 664 "Parser.ml"
    ) * Lexing.position) * _menhir_state * Lexing.position) * _menhir_state * (
# 97 "Parser.mly"
      (Ast.expr_properties list)
# 668 "Parser.ml"
    )) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
    ((let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce11 _menhir_env (Obj.magic _menhir_stack) _endpos) : 'freshtv870)

and _menhir_reduce8 : _menhir_env -> (('ttv_tail * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 677 "Parser.ml"
) * Lexing.position) * _menhir_state * Lexing.position) * _menhir_state * (
# 97 "Parser.mly"
      (Ast.expr_properties list)
# 681 "Parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__4_ ->
    let (((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 13 "Parser.mly"
       (string)
# 687 "Parser.ml"
    )), _startpos__1_), _, _startpos__2_), _, (_3 : (
# 97 "Parser.mly"
      (Ast.expr_properties list)
# 691 "Parser.ml"
    ))) = _menhir_stack in
    let _4 = () in
    let _2 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__4_ in
    let _v : 'tv_call = 
# 220 "Parser.mly"
                                                           ( (_1, _3) )
# 700 "Parser.ml"
     in
    _menhir_goto_call _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_error236 : _menhir_env -> (('ttv_tail * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 707 "Parser.ml"
) * Lexing.position) * _menhir_state * Lexing.position) * _menhir_state * (
# 97 "Parser.mly"
      (Ast.expr_properties list)
# 711 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv867 * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 718 "Parser.ml"
    ) * Lexing.position) * _menhir_state * Lexing.position) * _menhir_state * (
# 97 "Parser.mly"
      (Ast.expr_properties list)
# 722 "Parser.ml"
    )) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
    ((let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce11 _menhir_env (Obj.magic _menhir_stack) _endpos) : 'freshtv868)

and _menhir_reduce93 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (
# 97 "Parser.mly"
      (Ast.expr_properties list)
# 733 "Parser.ml"
    ) = 
# 227 "Parser.mly"
                                        ( [] )
# 737 "Parser.ml"
     in
    _menhir_goto_maybe_actual_params _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce39 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__1_ _menhir_s _startpos__1_ ->
    let _1 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 749 "Parser.ml"
    ) = let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    
# 275 "Parser.mly"
                                                        ( { expr_info = E_true; expr_error_pos = (_startpos, _endpos); } )
# 755 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce58 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__1_ _menhir_s _startpos__1_ ->
    let _1 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 767 "Parser.ml"
    ) = let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    
# 291 "Parser.mly"
                                                        ( { expr_info = E_nil;             expr_error_pos = (_startpos, _endpos) } )
# 773 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_run77 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 13 "Parser.mly"
       (string)
# 780 "Parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_lparen ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv865 * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 792 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState77 in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_character _v ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState79 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_const _v ->
            _menhir_run111 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState79 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_false ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState79 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_head ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_lparen ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_minus ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_new ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_nil ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState79 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_nil_qm ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_not ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_plus ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_string _v ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState79 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_tail ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_true ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState79 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_var _v ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState79 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_rparen ->
            _menhir_reduce93 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState79) : 'freshtv866)
    | T_and | T_div | T_equal | T_greater | T_greatereq | T_hashtag | T_lbracket | T_less | T_lesseq | T_minus | T_mod | T_mul | T_noteq | T_or | T_plus | T_rparen ->
        _menhir_reduce3 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState77

and _menhir_run86 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce39 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s _startpos

and _menhir_run87 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_lparen ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv861 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_character _v ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState88 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_const _v ->
            _menhir_run164 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState88 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_false ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState88 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_head ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_lparen ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_minus ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_new ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_nil ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState88 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_nil_qm ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_not ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_plus ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_string _v ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState88 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_tail ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_true ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState88 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_var _v ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState88 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState88) : 'freshtv862)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv863 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv864)

and _menhir_run90 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState90 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run164 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState90 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState90 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState90 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState90

and _menhir_run91 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState91 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run164 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState91 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState91 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState91 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState91 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState91 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState91 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState91

and _menhir_run92 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_lparen ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv857 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_character _v ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState93 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_const _v ->
            _menhir_run164 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState93 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_false ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState93 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_head ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_lparen ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_minus ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_new ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_nil ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState93 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_nil_qm ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_not ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_plus ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_string _v ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState93 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_tail ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_true ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState93 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_var _v ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState93 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState93) : 'freshtv858)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv859 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv860)

and _menhir_run94 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce58 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s _startpos

and _menhir_run95 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_bool ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState95 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_char ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState95 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_int ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState95 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_list ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState95 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState95

and _menhir_run108 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState108 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run164 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState108 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState108 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState108 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState108 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState108 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState108 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState108

and _menhir_run109 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState109 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState109 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState109 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState109 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState109 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState109 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState109 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState109

and _menhir_run161 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_lparen ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv853 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_character _v ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState162 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_const _v ->
            _menhir_run164 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState162 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_false ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState162 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_head ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState162 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_lparen ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState162 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_minus ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState162 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_new ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState162 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_nil ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState162 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_nil_qm ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState162 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_not ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState162 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_plus ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState162 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_string _v ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState162 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_tail ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState162 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_true ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState162 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_var _v ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState162 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState162) : 'freshtv854)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv855 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv856)

and _menhir_run163 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce40 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s _startpos

and _menhir_run164 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 12 "Parser.mly"
       (int)
# 1212 "Parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce22 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s _v _startpos

and _menhir_run165 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 73 "Parser.mly"
       (char)
# 1221 "Parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce23 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s _v _startpos

and _menhir_reduce40 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__1_ _menhir_s _startpos__1_ ->
    let _1 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 1235 "Parser.ml"
    ) = let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    
# 276 "Parser.mly"
                                                        ( { expr_info = E_false; expr_error_pos = (_startpos, _endpos); } )
# 1241 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce22 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 12 "Parser.mly"
       (int)
# 1248 "Parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__1_ _menhir_s (_1 : (
# 12 "Parser.mly"
       (int)
# 1253 "Parser.ml"
  )) _startpos__1_ ->
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 1260 "Parser.ml"
    ) = let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    
# 245 "Parser.mly"
                                                        ( { expr_info = E_const(_1);     expr_error_pos = (_startpos, _endpos) }  )
# 1266 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce23 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 73 "Parser.mly"
       (char)
# 1273 "Parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__1_ _menhir_s (_1 : (
# 73 "Parser.mly"
       (char)
# 1278 "Parser.ml"
  )) _startpos__1_ ->
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 1285 "Parser.ml"
    ) = let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    
# 246 "Parser.mly"
                                                        ( { expr_info = E_character(_1); expr_error_pos = (_startpos, _endpos) }  )
# 1291 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_goto_maybe_else : _menhir_env -> 'ttv_tail -> 'tv_maybe_else -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv851 * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 1301 "Parser.ml"
    )) * _menhir_state * (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 1305 "Parser.ml"
    )) * _menhir_state * 'tv_maybe_elif) = Obj.magic _menhir_stack in
    let (_v : 'tv_maybe_else) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv849 * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 1312 "Parser.ml"
    )) * _menhir_state * (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 1316 "Parser.ml"
    )) * _menhir_state * 'tv_maybe_elif) = Obj.magic _menhir_stack in
    let ((_4 : 'tv_maybe_else) : 'tv_maybe_else) = _v in
    ((let (((_menhir_stack, _menhir_s, (_1 : (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 1322 "Parser.ml"
    ))), _, (_2 : (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 1326 "Parser.ml"
    ))), _, (_3 : 'tv_maybe_elif)) = _menhir_stack in
    let _v : 'tv_if_body = 
# 159 "Parser.mly"
                                                    ( (_1 :: _2, _3, _4) )
# 1331 "Parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv847) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_if_body) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv845 * _menhir_state * 'tv_if_cond * Lexing.position) * _menhir_state * 'tv_if_body) = Obj.magic _menhir_stack in
    ((if _menhir_env._menhir_error then
      _menhir_error306 _menhir_env (Obj.magic _menhir_stack)
    else
      let _tok = _menhir_env._menhir_token in
      match _tok with
      | T_end ->
          let (_menhir_env : _menhir_env) = _menhir_env in
          let (_menhir_stack : ('freshtv843 * _menhir_state * 'tv_if_cond * Lexing.position) * _menhir_state * 'tv_if_body) = Obj.magic _menhir_stack in
          ((let _menhir_env = _menhir_discard _menhir_env in
          let (_menhir_env : _menhir_env) = _menhir_env in
          let (_menhir_stack : ('freshtv841 * _menhir_state * 'tv_if_cond * Lexing.position) * _menhir_state * 'tv_if_body) = Obj.magic _menhir_stack in
          ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_if_cond), _startpos__1_), _, (_2 : 'tv_if_body)) = _menhir_stack in
          let _3 = () in
          let _v : 'tv_if_whole = 
# 151 "Parser.mly"
                                     ( (_1, _2) )
# 1356 "Parser.ml"
           in
          _menhir_goto_if_whole _menhir_env _menhir_stack _menhir_s _v) : 'freshtv842)) : 'freshtv844)
      | _ ->
          (assert (not _menhir_env._menhir_error);
          _menhir_env._menhir_error <- true;
          _menhir_error306 _menhir_env (Obj.magic _menhir_stack))) : 'freshtv846)) : 'freshtv848)) : 'freshtv850)) : 'freshtv852)

and _menhir_goto_maybe_formal_defs : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 82 "Parser.mly"
      (Ast.same_type_defs_properties list)
# 1367 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv835 * _menhir_state * 'tv_maybe_mytype * Lexing.position) * Lexing.position * (
# 13 "Parser.mly"
       (string)
# 1377 "Parser.ml"
        ) * Lexing.position) * Lexing.position) * _menhir_state * (
# 82 "Parser.mly"
      (Ast.same_type_defs_properties list)
# 1381 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_error39 _menhir_env (Obj.magic _menhir_stack)
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_rparen ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : ((('freshtv833 * _menhir_state * 'tv_maybe_mytype * Lexing.position) * Lexing.position * (
# 13 "Parser.mly"
       (string)
# 1393 "Parser.ml"
              ) * Lexing.position) * Lexing.position) * _menhir_state * (
# 82 "Parser.mly"
      (Ast.same_type_defs_properties list)
# 1397 "Parser.ml"
              )) = Obj.magic _menhir_stack in
              let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
              ((let _menhir_env = _menhir_discard _menhir_env in
              _menhir_reduce78 _menhir_env (Obj.magic _menhir_stack) _endpos) : 'freshtv834)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_error39 _menhir_env (Obj.magic _menhir_stack))) : 'freshtv836)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv839 * _menhir_state * 'tv_maybe_mytype * Lexing.position) * Lexing.position * (
# 13 "Parser.mly"
       (string)
# 1411 "Parser.ml"
        ) * Lexing.position) * Lexing.position) * _menhir_state * (
# 82 "Parser.mly"
      (Ast.same_type_defs_properties list)
# 1415 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_error53 _menhir_env (Obj.magic _menhir_stack)
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_rparen ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : ((('freshtv837 * _menhir_state * 'tv_maybe_mytype * Lexing.position) * Lexing.position * (
# 13 "Parser.mly"
       (string)
# 1427 "Parser.ml"
              ) * Lexing.position) * Lexing.position) * _menhir_state * (
# 82 "Parser.mly"
      (Ast.same_type_defs_properties list)
# 1431 "Parser.ml"
              )) = Obj.magic _menhir_stack in
              let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
              ((let _menhir_env = _menhir_discard _menhir_env in
              _menhir_reduce78 _menhir_env (Obj.magic _menhir_stack) _endpos) : 'freshtv838)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_error53 _menhir_env (Obj.magic _menhir_stack))) : 'freshtv840)
    | _ ->
        _menhir_fail ()

and _menhir_reduce79 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_maybe_mytype * Lexing.position -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__2_ ->
    let (_menhir_stack, _menhir_s, (_1 : 'tv_maybe_mytype), _startpos__1_) = _menhir_stack in
    let _2 = () in
    let _v : (
# 80 "Parser.mly"
      (Ast.header_properties)
# 1450 "Parser.ml"
    ) = let _endpos = _endpos__2_ in
    let _startpos = _startpos__1_ in
    
# 115 "Parser.mly"
                                 ( missing_func_name_error (_startpos, _endpos); raise Terminate )
# 1456 "Parser.ml"
     in
    _menhir_goto_header _menhir_env _menhir_stack _menhir_s _v

and _menhir_run59 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 13 "Parser.mly"
       (string)
# 1463 "Parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_comma ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv829 * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 1475 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_var _v ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState60 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60) : 'freshtv830)
    | T_bool | T_char | T_decl | T_def | T_exit | T_for | T_if | T_int | T_list | T_return | T_skip | T_string _ | T_var _ ->
        _menhir_reduce12 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv831 * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 1495 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv832)

and _menhir_run30 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 13 "Parser.mly"
       (string)
# 1503 "Parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_comma ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv827 * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 1515 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_var _v ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState31 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31) : 'freshtv828)
    | T_rparen | T_semicolon ->
        _menhir_reduce12 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_error30 _menhir_env (Obj.magic _menhir_stack)

and _menhir_run20 : _menhir_env -> ('ttv_tail * _menhir_state * 'tv_mytype * Lexing.position) * _menhir_state -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce106 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s

and _menhir_reduce107 : _menhir_env -> (('ttv_tail * _menhir_state * Lexing.position)) * _menhir_state * 'tv_mytype * Lexing.position -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__4_ _ ->
    let ((_menhir_stack, _menhir_s, _startpos__1_), _, (_3 : 'tv_mytype), _startpos__3_) = _menhir_stack in
    let _4 = () in
    let _2 = () in
    let _1 = () in
    let _startpos = _startpos__1_ in
    let _v : 'tv_mytype = 
# 204 "Parser.mly"
                                                ( TYPE_list _3 )
# 1548 "Parser.ml"
     in
    _menhir_goto_mytype _menhir_env _menhir_stack _menhir_s _v _startpos

and _menhir_run11 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_mytype * Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_rbracket ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv825 * _menhir_state * 'tv_mytype * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState11 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce106 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv826)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11

and _menhir_goto_defs : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 85 "Parser.mly"
      (string list)
# 1573 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v ->
    match _menhir_s with
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv805 * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 1582 "Parser.ml"
        ) * Lexing.position)) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 85 "Parser.mly"
      (string list)
# 1589 "Parser.ml"
        )) = _v in
        (_menhir_reduce13 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s _v : 'freshtv806)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv809 * _menhir_state * Lexing.position) * _menhir_state * 'tv_mytype * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 85 "Parser.mly"
      (string list)
# 1600 "Parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv807 * _menhir_state * Lexing.position) * _menhir_state * 'tv_mytype * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos__3_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : (
# 85 "Parser.mly"
      (string list)
# 1609 "Parser.ml"
        )) : (
# 85 "Parser.mly"
      (string list)
# 1613 "Parser.ml"
        )) = _v in
        ((let ((_menhir_stack, _menhir_s, _startpos__1_), _, (_2 : 'tv_mytype), _startpos__2_) = _menhir_stack in
        let _1 = () in
        let _v : (
# 84 "Parser.mly"
      (Ast.same_type_defs_properties)
# 1620 "Parser.ml"
        ) = let _endpos = _endpos__3_ in
        let _startpos = _startpos__1_ in
        
# 191 "Parser.mly"
                                     ( { defs_info = SameTypeDefsByRef (_2, _3); defs_error_pos = (_startpos, _endpos) } )
# 1626 "Parser.ml"
         in
        _menhir_goto_same_type_defs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv808)) : 'freshtv810)
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv813 * _menhir_state * 'tv_mytype * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 85 "Parser.mly"
      (string list)
# 1637 "Parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv811 * _menhir_state * 'tv_mytype * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos__2_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : (
# 85 "Parser.mly"
      (string list)
# 1646 "Parser.ml"
        )) : (
# 85 "Parser.mly"
      (string list)
# 1650 "Parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_mytype), _startpos__1_) = _menhir_stack in
        let _v : (
# 84 "Parser.mly"
      (Ast.same_type_defs_properties)
# 1656 "Parser.ml"
        ) = let _endpos = _endpos__2_ in
        let _startpos = _startpos__1_ in
        
# 190 "Parser.mly"
                                     ( { defs_info = SameTypeDefs (_1, _2); defs_error_pos = (_startpos, _endpos) } )
# 1662 "Parser.ml"
         in
        _menhir_goto_same_type_defs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv812)) : 'freshtv814)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv815 * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 1670 "Parser.ml"
        ) * Lexing.position)) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 85 "Parser.mly"
      (string list)
# 1677 "Parser.ml"
        )) = _v in
        (_menhir_reduce13 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s _v : 'freshtv816)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv823 * _menhir_state * 'tv_mytype * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _endpos in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 85 "Parser.mly"
      (string list)
# 1688 "Parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv821 * _menhir_state * 'tv_mytype * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos__2_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : (
# 85 "Parser.mly"
      (string list)
# 1697 "Parser.ml"
        )) : (
# 85 "Parser.mly"
      (string list)
# 1701 "Parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_mytype), _startpos__1_) = _menhir_stack in
        let _v : (
# 89 "Parser.mly"
      (Ast.var_decl_properties)
# 1707 "Parser.ml"
        ) = let _endpos = _endpos__2_ in
        let _startpos = _startpos__1_ in
        
# 208 "Parser.mly"
                                      ( { var_info = (_1, _2); var_error_pos = (_startpos, _endpos) } )
# 1713 "Parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv819) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 89 "Parser.mly"
      (Ast.var_decl_properties)
# 1721 "Parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv817 * _menhir_state * (
# 89 "Parser.mly"
      (Ast.var_decl_properties)
# 1728 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_bool ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_char ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_decl ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState57
        | T_def ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState57 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_int ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_list ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_exit | T_for | T_if | T_return | T_skip | T_string _ | T_var _ ->
            _menhir_reduce92 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState57) : 'freshtv818)) : 'freshtv820)) : 'freshtv822)) : 'freshtv824)
    | _ ->
        _menhir_fail ()

and _menhir_goto_formal_defs : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 83 "Parser.mly"
      (Ast.same_type_defs_properties list)
# 1757 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv799 * _menhir_state * (
# 84 "Parser.mly"
      (Ast.same_type_defs_properties)
# 1766 "Parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 83 "Parser.mly"
      (Ast.same_type_defs_properties list)
# 1772 "Parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv797 * _menhir_state * (
# 84 "Parser.mly"
      (Ast.same_type_defs_properties)
# 1778 "Parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : (
# 83 "Parser.mly"
      (Ast.same_type_defs_properties list)
# 1784 "Parser.ml"
        )) : (
# 83 "Parser.mly"
      (Ast.same_type_defs_properties list)
# 1788 "Parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 84 "Parser.mly"
      (Ast.same_type_defs_properties)
# 1793 "Parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : (
# 83 "Parser.mly"
      (Ast.same_type_defs_properties list)
# 1799 "Parser.ml"
        ) = 
# 188 "Parser.mly"
                                                           ( _1 :: _3 )
# 1803 "Parser.ml"
         in
        _menhir_goto_formal_defs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv798)) : 'freshtv800)
    | MenhirState51 | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv803) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 83 "Parser.mly"
      (Ast.same_type_defs_properties list)
# 1813 "Parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv801) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 83 "Parser.mly"
      (Ast.same_type_defs_properties list)
# 1821 "Parser.ml"
        )) : (
# 83 "Parser.mly"
      (Ast.same_type_defs_properties list)
# 1825 "Parser.ml"
        )) = _v in
        ((let _v : (
# 82 "Parser.mly"
      (Ast.same_type_defs_properties list)
# 1830 "Parser.ml"
        ) = 
# 185 "Parser.mly"
                                          ( _1 )
# 1834 "Parser.ml"
         in
        _menhir_goto_maybe_formal_defs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv802)) : 'freshtv804)
    | _ ->
        _menhir_fail ()

and _menhir_reduce92 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (
# 81 "Parser.mly"
      (Ast.ast_inside_func_def list)
# 1845 "Parser.ml"
    ) = 
# 125 "Parser.mly"
                                               ( [NO_OTHER_DEF] )
# 1849 "Parser.ml"
     in
    _menhir_goto_inside_func_def _menhir_env _menhir_stack _menhir_s _v

and _menhir_run46 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_bool ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_char ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_int ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_list ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _ ->
        _menhir_reduce101 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState46

and _menhir_reduce115 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_call * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_call), _startpos__1_) = _menhir_stack in
    let _startpos = _startpos__1_ in
    let _v : (
# 94 "Parser.mly"
      (Ast.simple_properties)
# 1881 "Parser.ml"
    ) = let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    
# 214 "Parser.mly"
                                      ( { simple_info = Simple_call (_1); simple_error_pos = (_startpos, _endpos) }  )
# 1887 "Parser.ml"
     in
    _menhir_goto_simple _menhir_env _menhir_stack _menhir_s _v _startpos

and _menhir_error269 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_call * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    _menhir_reduce115 _menhir_env (Obj.magic _menhir_stack)

and _menhir_reduce7 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_call * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_call), _startpos__1_) = _menhir_stack in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_atom = let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    
# 241 "Parser.mly"
                                                        ( { atom_info = A_call (_1); atom_error_pos = (_startpos, _endpos); atom_frame_place = 0; atom_depth = 0; atom_byrefFlag = false; atom_callbyref = false; } )
# 1905 "Parser.ml"
     in
    _menhir_goto_atom _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_error270 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_atom * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run176 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_atom * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState176 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState176 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState176 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState176 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState176 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState176 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState176 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState176 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState176 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState176 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState176 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState176 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState176 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState176 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState176 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState176

and _menhir_error175 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_atom * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_reduce62 : _menhir_env -> (('ttv_tail * _menhir_state * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 1962 "Parser.ml"
) * Lexing.position -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__4_ _ ->
    let (((_menhir_stack, _menhir_s, _startpos__1_), _startpos__2_), _endpos__3_, _, (_3 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 1968 "Parser.ml"
    )), _startpos__3_) = _menhir_stack in
    let _4 = () in
    let _2 = () in
    let _1 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__4_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 1978 "Parser.ml"
    ) = let _endpos = _endpos__4_ in
    let _startpos = _startpos__1_ in
    
# 296 "Parser.mly"
                                                        ( { expr_info = E_tail(_3);        expr_error_pos = (_startpos, _endpos) } )
# 1984 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce59 : _menhir_env -> (('ttv_tail * _menhir_state * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 1991 "Parser.ml"
) * Lexing.position -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__4_ _ ->
    let (((_menhir_stack, _menhir_s, _startpos__1_), _startpos__2_), _endpos__3_, _, (_3 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 1997 "Parser.ml"
    )), _startpos__3_) = _menhir_stack in
    let _4 = () in
    let _2 = () in
    let _1 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__4_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2007 "Parser.ml"
    ) = let _endpos = _endpos__4_ in
    let _startpos = _startpos__1_ in
    
# 293 "Parser.mly"
                                                        ( { expr_info = E_nilqm(_3);       expr_error_pos = (_startpos, _endpos) } )
# 2013 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce55 : _menhir_env -> ((('ttv_tail * _menhir_state * Lexing.position) * _menhir_state * 'tv_mytype * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2020 "Parser.ml"
) * Lexing.position -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__5_ _ ->
    let ((((_menhir_stack, _menhir_s, _startpos__1_), _, (_2 : 'tv_mytype), _startpos__2_), _), _endpos__4_, _, (_4 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2026 "Parser.ml"
    )), _startpos__4_) = _menhir_stack in
    let _5 = () in
    let _3 = () in
    let _1 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__5_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2036 "Parser.ml"
    ) = let _endpos = _endpos__5_ in
    let _startpos = _startpos__1_ in
    
# 288 "Parser.mly"
                                                        ( { expr_info = E_new (_2,  _4);   expr_error_pos = (_startpos, _endpos) } )
# 2042 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce61 : _menhir_env -> (('ttv_tail * _menhir_state * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2049 "Parser.ml"
) * Lexing.position -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__4_ _ ->
    let (((_menhir_stack, _menhir_s, _startpos__1_), _startpos__2_), _endpos__3_, _, (_3 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2055 "Parser.ml"
    )), _startpos__3_) = _menhir_stack in
    let _4 = () in
    let _2 = () in
    let _1 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__4_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2065 "Parser.ml"
    ) = let _endpos = _endpos__4_ in
    let _startpos = _startpos__1_ in
    
# 295 "Parser.mly"
                                                        ( { expr_info = E_head(_3);        expr_error_pos = (_startpos, _endpos) } )
# 2071 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_run168 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2078 "Parser.ml"
) * Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState168 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run164 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState168 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState168 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState168 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState168 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState168 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState168 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState168 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState168 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState168 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState168 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState168 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState168 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState168 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState168 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState168

and _menhir_run186 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2123 "Parser.ml"
) * Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState186 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run164 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState186 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState186 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState186 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState186

and _menhir_run188 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2168 "Parser.ml"
) * Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState188 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run164 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState188 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState188 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState188 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState188 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState188 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState188 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState188 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState188 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState188 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState188 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState188 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState188 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState188 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState188 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState188

and _menhir_run171 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2213 "Parser.ml"
) * Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState171 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run164 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState171 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState171 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState171 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState171 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState171 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState171 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState171

and _menhir_run180 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2258 "Parser.ml"
) * Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState180 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run164 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState180 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState180 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState180 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState180 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState180 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState180 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState180 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState180 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState180 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState180 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState180 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState180 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState180 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState180 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState180

and _menhir_run191 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2303 "Parser.ml"
) * Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState191 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run164 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState191 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState191 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState191 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState191 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState191 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState191 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState191 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState191 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState191 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState191 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState191 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState191 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState191 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState191 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState191

and _menhir_run196 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2348 "Parser.ml"
) * Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState196 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run164 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState196 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState196 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState196 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState196 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState196 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState196 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState196 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState196 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState196 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState196 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState196 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState196 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState196 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState196 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState196

and _menhir_run199 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2393 "Parser.ml"
) * Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState199 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run164 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState199 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState199 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState199 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState199 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState199 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState199 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState199 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState199 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState199 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState199 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState199 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState199 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState199 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState199 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState199

and _menhir_run194 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2438 "Parser.ml"
) * Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState194 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run164 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState194 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState194 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState194 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState194 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState194 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState194 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState194 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState194 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState194 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState194 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState194 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState194 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState194 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState194 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState194

and _menhir_run202 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2483 "Parser.ml"
) * Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState202 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run164 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState202 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState202 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState202 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState202 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState202 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState202 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState202 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState202 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState202 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState202 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState202 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState202 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState202 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState202 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState202

and _menhir_run205 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2528 "Parser.ml"
) * Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState205 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run164 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState205 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState205 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState205 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState205 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState205 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState205 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState205 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState205 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState205 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState205 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState205 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState205 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState205 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState205 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState205

and _menhir_run208 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2573 "Parser.ml"
) * Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState208 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run164 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState208 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState208 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState208 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState208 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState208 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState208 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState208 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState208 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState208 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState208 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState208 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState208 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState208 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState208 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState208

and _menhir_run183 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2618 "Parser.ml"
) * Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState183 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run164 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState183 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState183 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState183 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState183 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState183 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState183 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState183 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState183 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState183 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState183 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState183 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState183 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState183 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState183 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState183

and _menhir_run211 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2663 "Parser.ml"
) * Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState211 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run164 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState211 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState211 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState211 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState211 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState211 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState211 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState211 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState211 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState211 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState211 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState211 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState211 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState211 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState211 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState211

and _menhir_reduce31 : _menhir_env -> (('ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2708 "Parser.ml"
) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2712 "Parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2718 "Parser.ml"
    )), _startpos__1_), _), _endpos__3_, _, (_3 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2722 "Parser.ml"
    )), _startpos__3_) = _menhir_stack in
    let _10 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__3_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2730 "Parser.ml"
    ) = let _2 =
      let _1 = _10 in
      
# 307 "Parser.mly"
                ( O_div   )
# 2736 "Parser.ml"
      
    in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 254 "Parser.mly"
                                                        ( { expr_info = E_binary_op (_1, _2, _3); expr_error_pos = (_startpos, _endpos) } )
# 2744 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce32 : _menhir_env -> (('ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2751 "Parser.ml"
) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2755 "Parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2761 "Parser.ml"
    )), _startpos__1_), _), _endpos__3_, _, (_3 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2765 "Parser.ml"
    )), _startpos__3_) = _menhir_stack in
    let _10 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__3_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2773 "Parser.ml"
    ) = let _2 =
      let _1 = _10 in
      
# 308 "Parser.mly"
                ( O_mod   )
# 2779 "Parser.ml"
      
    in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 254 "Parser.mly"
                                                        ( { expr_info = E_binary_op (_1, _2, _3); expr_error_pos = (_startpos, _endpos) } )
# 2787 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce5 : _menhir_env -> (('ttv_tail * Lexing.position * _menhir_state * 'tv_atom * Lexing.position)) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2794 "Parser.ml"
) * Lexing.position -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__4_ _ ->
    let ((_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_atom), _startpos__1_), _endpos__3_, _, (_3 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2800 "Parser.ml"
    )), _startpos__3_) = _menhir_stack in
    let _4 = () in
    let _2 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__4_ in
    let _v : 'tv_atom = let _endpos = _endpos__4_ in
    let _startpos = _startpos__1_ in
    
# 239 "Parser.mly"
                                                        ( { atom_info = A_structure (_1, _3); atom_error_pos = (_startpos, _endpos); atom_frame_place = 0; atom_depth = 0; atom_byrefFlag = false; atom_callbyref = false; } )
# 2811 "Parser.ml"
     in
    _menhir_goto_atom _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce30 : _menhir_env -> (('ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2818 "Parser.ml"
) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2822 "Parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2828 "Parser.ml"
    )), _startpos__1_), _), _endpos__3_, _, (_3 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2832 "Parser.ml"
    )), _startpos__3_) = _menhir_stack in
    let _10 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__3_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2840 "Parser.ml"
    ) = let _2 =
      let _1 = _10 in
      
# 306 "Parser.mly"
                ( O_mul   )
# 2846 "Parser.ml"
      
    in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 254 "Parser.mly"
                                                        ( { expr_info = E_binary_op (_1, _2, _3); expr_error_pos = (_startpos, _endpos) } )
# 2854 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce24 : _menhir_env -> ('ttv_tail * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2861 "Parser.ml"
) * Lexing.position -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__3_ _ ->
    let ((_menhir_stack, _menhir_s, _startpos__1_), _endpos__2_, _, (_2 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2867 "Parser.ml"
    )), _startpos__2_) = _menhir_stack in
    let _3 = () in
    let _1 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__3_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2876 "Parser.ml"
    ) = 
# 247 "Parser.mly"
                                                        ( _2 )
# 2880 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_run116 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2887 "Parser.ml"
) * Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState116 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState116 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState116 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState116 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState116 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState116 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState116 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState116

and _menhir_run128 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2932 "Parser.ml"
) * Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState128 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState128 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState128 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState128 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState128 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState128

and _menhir_run130 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 2977 "Parser.ml"
) * Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState130 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState130 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState130 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState130 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState130 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState130 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState130 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState130 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState130 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState130 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState130 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState130 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState130 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState130 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState130 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState130

and _menhir_run119 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 3022 "Parser.ml"
) * Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState119 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState119 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState119 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState119 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState119 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState119 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState119 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState119 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState119 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState119 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState119 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState119 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState119 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState119 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState119 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState119

and _menhir_run133 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 3067 "Parser.ml"
) * Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState133

and _menhir_run136 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 3112 "Parser.ml"
) * Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState136 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState136 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState136 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState136 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState136 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState136 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState136 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState136 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState136 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState136 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState136 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState136 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState136 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState136 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState136 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState136

and _menhir_run144 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 3157 "Parser.ml"
) * Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState144 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState144 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState144 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState144 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState144 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState144 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState144 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState144

and _menhir_run147 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 3202 "Parser.ml"
) * Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState147 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState147 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState147 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState147 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState147 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState147 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState147 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState147 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState147 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState147 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState147 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState147 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState147 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState147 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState147 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState147

and _menhir_run142 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 3247 "Parser.ml"
) * Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState142 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState142 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState142 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState142 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState142 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState142 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState142 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState142 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState142 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState142 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState142 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState142 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState142 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState142 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState142 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState142

and _menhir_run150 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 3292 "Parser.ml"
) * Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState150 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState150 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState150 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState150 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState150

and _menhir_run153 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 3337 "Parser.ml"
) * Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState153 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState153 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState153 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState153 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState153 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState153 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState153 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState153 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState153 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState153 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState153 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState153 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState153 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState153 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState153 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState153

and _menhir_run156 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 3382 "Parser.ml"
) * Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState156 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState156 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState156 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState156 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState156

and _menhir_run139 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 3427 "Parser.ml"
) * Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState139 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState139 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState139 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState139 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState139 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState139 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState139 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState139 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState139 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState139 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState139 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState139 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState139 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState139 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState139 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState139

and _menhir_run159 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 3472 "Parser.ml"
) * Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState159 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState159 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState159 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState159 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState159 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState159 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState159 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState159 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState159 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState159 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState159 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState159 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState159 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState159 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState159 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState159

and _menhir_goto_maybe_actual_params : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 97 "Parser.mly"
      (Ast.expr_properties list)
# 3517 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv791 * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 3527 "Parser.ml"
        ) * Lexing.position) * _menhir_state * Lexing.position) * _menhir_state * (
# 97 "Parser.mly"
      (Ast.expr_properties list)
# 3531 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_error236 _menhir_env (Obj.magic _menhir_stack)
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_rparen ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : (('freshtv789 * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 3543 "Parser.ml"
              ) * Lexing.position) * _menhir_state * Lexing.position) * _menhir_state * (
# 97 "Parser.mly"
      (Ast.expr_properties list)
# 3547 "Parser.ml"
              )) = Obj.magic _menhir_stack in
              let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
              ((let _menhir_env = _menhir_discard _menhir_env in
              _menhir_reduce8 _menhir_env (Obj.magic _menhir_stack) _endpos) : 'freshtv790)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_error236 _menhir_env (Obj.magic _menhir_stack))) : 'freshtv792)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv795 * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 3561 "Parser.ml"
        ) * Lexing.position) * _menhir_state * Lexing.position) * _menhir_state * (
# 97 "Parser.mly"
      (Ast.expr_properties list)
# 3565 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_error245 _menhir_env (Obj.magic _menhir_stack)
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_rparen ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : (('freshtv793 * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 3577 "Parser.ml"
              ) * Lexing.position) * _menhir_state * Lexing.position) * _menhir_state * (
# 97 "Parser.mly"
      (Ast.expr_properties list)
# 3581 "Parser.ml"
              )) = Obj.magic _menhir_stack in
              let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
              ((let _menhir_env = _menhir_discard _menhir_env in
              _menhir_reduce8 _menhir_env (Obj.magic _menhir_stack) _endpos) : 'freshtv794)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_error245 _menhir_env (Obj.magic _menhir_stack))) : 'freshtv796)
    | _ ->
        _menhir_fail ()

and _menhir_run267 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 3596 "Parser.ml"
) * Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_skip ->
        _menhir_run248 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState267 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState267 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState267 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState267

and _menhir_reduce97 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _v : 'tv_maybe_else = 
# 165 "Parser.mly"
                         ( None )
# 3619 "Parser.ml"
     in
    _menhir_goto_maybe_else _menhir_env _menhir_stack _v

and _menhir_error293 : _menhir_env -> (('ttv_tail * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 3626 "Parser.ml"
)) * _menhir_state * (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 3630 "Parser.ml"
)) * _menhir_state * 'tv_maybe_elif -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    _menhir_reduce97 _menhir_env (Obj.magic _menhir_stack)

and _menhir_reduce3 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 3638 "Parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 13 "Parser.mly"
       (string)
# 3644 "Parser.ml"
    )), _startpos__1_) = _menhir_stack in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_atom = let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    
# 237 "Parser.mly"
                                                        ( { atom_info = A_var (_1); atom_error_pos = (_startpos, _endpos); atom_frame_place = 0; atom_depth = 0; atom_byrefFlag = false; atom_callbyref = false; } )
# 3653 "Parser.ml"
     in
    _menhir_goto_atom _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_run71 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 3660 "Parser.ml"
) * Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState71 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState71 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState71 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState71 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState71 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState71 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState71 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_rparen ->
        _menhir_reduce93 _menhir_env (Obj.magic _menhir_stack) MenhirState71
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState71

and _menhir_reduce4 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 74 "Parser.mly"
       (string)
# 3707 "Parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__1_ _menhir_s (_1 : (
# 74 "Parser.mly"
       (string)
# 3712 "Parser.ml"
  )) _startpos__1_ ->
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : 'tv_atom = let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    
# 238 "Parser.mly"
                                                        ( { atom_info = A_string (_1); atom_error_pos = (_startpos, _endpos); atom_frame_place = 0; atom_depth = 0; atom_byrefFlag = false; atom_callbyref = false; } )
# 3721 "Parser.ml"
     in
    _menhir_goto_atom _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_run73 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 13 "Parser.mly"
       (string)
# 3728 "Parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_lparen ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_and | T_colon | T_comma | T_div | T_else | T_elsif | T_end | T_equal | T_exit | T_for | T_greater | T_greatereq | T_hashtag | T_if | T_lbracket | T_less | T_lesseq | T_minus | T_mod | T_mul | T_noteq | T_or | T_plus | T_rbracket | T_return | T_rparen | T_semicolon | T_skip | T_string _ | T_var _ ->
        _menhir_reduce3 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState73

and _menhir_run74 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce39 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s _startpos

and _menhir_run75 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_lparen ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv785 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_character _v ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState76 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_const _v ->
            _menhir_run164 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState76 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_false ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState76 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_head ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_lparen ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_minus ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_new ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_nil ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState76 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_nil_qm ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_not ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_plus ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_string _v ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState76 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_tail ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_true ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState76 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_var _v ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState76 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState76) : 'freshtv786)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv787 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv788)

and _menhir_run81 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 74 "Parser.mly"
       (string)
# 3808 "Parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce4 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s _v _startpos

and _menhir_run82 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState82 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState82 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState82 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState82 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState82 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState82 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState82 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState82

and _menhir_run83 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState83 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState83 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState83 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState83 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState83 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState83 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState83 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState83

and _menhir_run84 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_lparen ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv781 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_character _v ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState85 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_const _v ->
            _menhir_run164 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState85 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_false ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState85 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_head ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_lparen ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_minus ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_new ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_nil ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState85 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_nil_qm ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_not ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_plus ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_string _v ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState85 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_tail ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_true ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState85 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_var _v ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState85 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState85) : 'freshtv782)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv783 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv784)

and _menhir_run99 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce58 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s _startpos

and _menhir_run100 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_bool ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_char ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_int ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_list ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState100

and _menhir_run104 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState104 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState104 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState104 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState104 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState104 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState104 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState104 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState104

and _menhir_run105 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState105 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState105 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState105 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState105 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState105 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState105 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState105 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState105

and _menhir_run106 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_lparen ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv777 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_character _v ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState107 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_const _v ->
            _menhir_run164 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState107 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_false ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_head ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_lparen ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_minus ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_new ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_nil ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_nil_qm ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_not ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_plus ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_string _v ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState107 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_tail ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_true ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState107 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_var _v ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState107 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState107) : 'freshtv778)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv779 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv780)

and _menhir_run110 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce40 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s _startpos

and _menhir_run111 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 12 "Parser.mly"
       (int)
# 4122 "Parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce22 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s _v _startpos

and _menhir_run112 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 73 "Parser.mly"
       (char)
# 4131 "Parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce23 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s _v _startpos

and _menhir_error313 : _menhir_env -> ((((('ttv_tail * Lexing.position * _menhir_state * Lexing.position) * _menhir_state * (
# 80 "Parser.mly"
      (Ast.header_properties)
# 4140 "Parser.ml"
))) * _menhir_state * (
# 81 "Parser.mly"
      (Ast.ast_inside_func_def list)
# 4144 "Parser.ml"
)) * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 4148 "Parser.ml"
)) * _menhir_state * (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 4152 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((((('freshtv775 * Lexing.position * _menhir_state * Lexing.position) * _menhir_state * (
# 80 "Parser.mly"
      (Ast.header_properties)
# 4159 "Parser.ml"
    ))) * _menhir_state * (
# 81 "Parser.mly"
      (Ast.ast_inside_func_def list)
# 4163 "Parser.ml"
    )) * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 4167 "Parser.ml"
    )) * _menhir_state * (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 4171 "Parser.ml"
    )) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((((('freshtv773 * Lexing.position * _menhir_state * Lexing.position) * _menhir_state * (
# 80 "Parser.mly"
      (Ast.header_properties)
# 4179 "Parser.ml"
    ))) * _menhir_state * (
# 81 "Parser.mly"
      (Ast.ast_inside_func_def list)
# 4183 "Parser.ml"
    )) * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 4187 "Parser.ml"
    )) * _menhir_state * (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 4191 "Parser.ml"
    )) = Obj.magic _menhir_stack in
    let (_endpos__7_ : Lexing.position) = _endpos in
    ((let (((((_menhir_stack, _endpos__1_, _menhir_s, _startpos__1_), _, (_2 : (
# 80 "Parser.mly"
      (Ast.header_properties)
# 4197 "Parser.ml"
    ))), _, (_4 : (
# 81 "Parser.mly"
      (Ast.ast_inside_func_def list)
# 4201 "Parser.ml"
    ))), _, (_5 : (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 4205 "Parser.ml"
    ))), _, (_6 : (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 4209 "Parser.ml"
    ))) = _menhir_stack in
    let _7 = () in
    let _3 = () in
    let _1 = () in
    let _v : (
# 79 "Parser.mly"
      (Ast.ast_func_def)
# 4217 "Parser.ml"
    ) = let _endpos = _endpos__7_ in
    let _startpos = _startpos__1_ in
    
# 110 "Parser.mly"
                                                                      ( missing_end_error (_startpos, _endpos); raise Terminate )
# 4223 "Parser.ml"
     in
    _menhir_goto_func_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv774)) : 'freshtv776)

and _menhir_goto_else_whole : _menhir_env -> 'ttv_tail -> 'tv_else_whole -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv771) = Obj.magic _menhir_stack in
    let (_v : 'tv_else_whole) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv769) = Obj.magic _menhir_stack in
    let ((_1 : 'tv_else_whole) : 'tv_else_whole) = _v in
    ((let _v : 'tv_maybe_else = 
# 166 "Parser.mly"
                         ( Some _1 )
# 4238 "Parser.ml"
     in
    _menhir_goto_maybe_else _menhir_env _menhir_stack _v) : 'freshtv770)) : 'freshtv772)

and _menhir_run288 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState288 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState288 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState288 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState288 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState288 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState288 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState288 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState288 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState288 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState288 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState288 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState288 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState288 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState288 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState288 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState288

and _menhir_error309 : _menhir_env -> ((('ttv_tail * _menhir_state * Lexing.position) * _menhir_state * 'tv_for_head)) * _menhir_state * 'tv_for_body -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv767 * _menhir_state * Lexing.position) * _menhir_state * 'tv_for_head)) * _menhir_state * 'tv_for_body) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv765 * _menhir_state * Lexing.position) * _menhir_state * 'tv_for_head)) * _menhir_state * 'tv_for_body) = Obj.magic _menhir_stack in
    let (_endpos__5_ : Lexing.position) = _endpos in
    ((let (((_menhir_stack, _menhir_s, _startpos__1_), _, (_2 : 'tv_for_head)), _, (_4 : 'tv_for_body)) = _menhir_stack in
    let _5 = () in
    let _3 = () in
    let _1 = () in
    let _v : 'tv_for_whole = let _endpos = _endpos__5_ in
    let _startpos = _startpos__1_ in
    
# 139 "Parser.mly"
                                                    ( missing_end_after_for_error (_startpos, _endpos); raise Terminate )
# 4301 "Parser.ml"
     in
    _menhir_goto_for_whole _menhir_env _menhir_stack _menhir_s _v) : 'freshtv766)) : 'freshtv768)

and _menhir_error47 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_maybe_mytype * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv763 * _menhir_state * 'tv_maybe_mytype * Lexing.position) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
    ((let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce79 _menhir_env (Obj.magic _menhir_stack) _endpos) : 'freshtv764)

and _menhir_reduce80 : _menhir_env -> ('ttv_tail * _menhir_state * 'tv_maybe_mytype * Lexing.position) * Lexing.position * (
# 13 "Parser.mly"
       (string)
# 4316 "Parser.ml"
) * Lexing.position -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__3_ ->
    let ((_menhir_stack, _menhir_s, (_1 : 'tv_maybe_mytype), _startpos__1_), _endpos__2_, (_2 : (
# 13 "Parser.mly"
       (string)
# 4322 "Parser.ml"
    )), _startpos__2_) = _menhir_stack in
    let _3 = () in
    let _v : (
# 80 "Parser.mly"
      (Ast.header_properties)
# 4328 "Parser.ml"
    ) = let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 116 "Parser.mly"
                                       ( missing_lparen_error (_startpos, _endpos); raise Terminate )
# 4334 "Parser.ml"
     in
    _menhir_goto_header _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce99 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (
# 82 "Parser.mly"
      (Ast.same_type_defs_properties list)
# 4343 "Parser.ml"
    ) = 
# 184 "Parser.mly"
                                          ( [] )
# 4347 "Parser.ml"
     in
    _menhir_goto_maybe_formal_defs _menhir_env _menhir_stack _menhir_s _v

and _menhir_error21 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_maybe_mytype * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv761 * _menhir_state * 'tv_maybe_mytype * Lexing.position) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
    ((let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce79 _menhir_env (Obj.magic _menhir_stack) _endpos) : 'freshtv762)

and _menhir_goto_mytype : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mytype -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v, _startpos) in
    match _menhir_s with
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv737 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_mytype * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState9
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_lbracket ->
              _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState9
          | T_rbracket ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : (('freshtv735 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_mytype * Lexing.position) = Obj.magic _menhir_stack in
              let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
              let (_menhir_s : _menhir_state) = MenhirState9 in
              ((let _menhir_env = _menhir_discard _menhir_env in
              _menhir_reduce107 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv736)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState9)) : 'freshtv738)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv741 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_mytype * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_lbracket ->
              _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState13
          | T_rbracket ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : (('freshtv739 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_mytype * Lexing.position) = Obj.magic _menhir_stack in
              let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
              let (_menhir_s : _menhir_state) = MenhirState13 in
              ((let _menhir_env = _menhir_discard _menhir_env in
              _menhir_reduce107 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv740)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13)) : 'freshtv742)
    | MenhirState46 | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv745 * _menhir_state * 'tv_mytype * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState18
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_lbracket ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : 'freshtv743 * _menhir_state * 'tv_mytype * Lexing.position) = Obj.magic _menhir_stack in
              let (_menhir_s : _menhir_state) = MenhirState18 in
              ((let _menhir_stack = (_menhir_stack, _menhir_s) in
              let _menhir_env = _menhir_discard _menhir_env in
              let _tok = _menhir_env._menhir_token in
              match _tok with
              | T_rbracket ->
                  _menhir_run20 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState19
              | _ ->
                  assert (not _menhir_env._menhir_error);
                  _menhir_env._menhir_error <- true;
                  _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19) : 'freshtv744)
          | T_var _ ->
              _menhir_reduce102 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState18)) : 'freshtv746)
    | MenhirState27 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv747 * _menhir_state * Lexing.position) * _menhir_state * 'tv_mytype * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState29
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_lbracket ->
              _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState29
          | T_var _v ->
              _menhir_run30 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState29 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState29)) : 'freshtv748)
    | MenhirState51 | MenhirState25 | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv749 * _menhir_state * 'tv_mytype * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState36
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_lbracket ->
              _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState36
          | T_var _v ->
              _menhir_run30 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState36 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState36)) : 'freshtv750)
    | MenhirState45 | MenhirState66 | MenhirState64 | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv751 * _menhir_state * 'tv_mytype * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState58
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_lbracket ->
              _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState58
          | T_var _v ->
              _menhir_run59 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState58 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState58)) : 'freshtv752)
    | MenhirState95 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv755 * _menhir_state * Lexing.position) * _menhir_state * 'tv_mytype * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState96
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_lbracket ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : ('freshtv753 * _menhir_state * Lexing.position) * _menhir_state * 'tv_mytype * Lexing.position) = Obj.magic _menhir_stack in
              let (_menhir_s : _menhir_state) = MenhirState96 in
              ((let _menhir_stack = (_menhir_stack, _menhir_s) in
              let _menhir_env = _menhir_discard _menhir_env in
              let _tok = _menhir_env._menhir_token in
              match _tok with
              | T_character _v ->
                  _menhir_run112 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState98 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_const _v ->
                  _menhir_run111 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState98 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_false ->
                  _menhir_run110 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState98 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_head ->
                  _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_lparen ->
                  _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_minus ->
                  _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_new ->
                  _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_nil ->
                  _menhir_run99 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState98 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_nil_qm ->
                  _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_not ->
                  _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_plus ->
                  _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_rbracket ->
                  _menhir_run20 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState98
              | T_string _v ->
                  _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState98 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_tail ->
                  _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_true ->
                  _menhir_run74 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState98 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_var _v ->
                  _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState98 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | _ ->
                  assert (not _menhir_env._menhir_error);
                  _menhir_env._menhir_error <- true;
                  _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState98) : 'freshtv754)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState96)) : 'freshtv756)
    | MenhirState100 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv759 * _menhir_state * Lexing.position) * _menhir_state * 'tv_mytype * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState101
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_lbracket ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : ('freshtv757 * _menhir_state * Lexing.position) * _menhir_state * 'tv_mytype * Lexing.position) = Obj.magic _menhir_stack in
              let (_menhir_s : _menhir_state) = MenhirState101 in
              ((let _menhir_stack = (_menhir_stack, _menhir_s) in
              let _menhir_env = _menhir_discard _menhir_env in
              let _tok = _menhir_env._menhir_token in
              match _tok with
              | T_character _v ->
                  _menhir_run112 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState103 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_const _v ->
                  _menhir_run111 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState103 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_false ->
                  _menhir_run110 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState103 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_head ->
                  _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_lparen ->
                  _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_minus ->
                  _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_new ->
                  _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_nil ->
                  _menhir_run99 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState103 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_nil_qm ->
                  _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_not ->
                  _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_plus ->
                  _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_rbracket ->
                  _menhir_run20 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState103
              | T_string _v ->
                  _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState103 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_tail ->
                  _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_true ->
                  _menhir_run74 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState103 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_var _v ->
                  _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState103 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | _ ->
                  assert (not _menhir_env._menhir_error);
                  _menhir_env._menhir_error <- true;
                  _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState103) : 'freshtv758)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState101)) : 'freshtv760)
    | _ ->
        _menhir_fail ()

and _menhir_run27 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_bool ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_char ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_int ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_list ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState27

and _menhir_reduce12 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 4618 "Parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 13 "Parser.mly"
       (string)
# 4624 "Parser.ml"
    )), _startpos__1_) = _menhir_stack in
    let _endpos = _endpos__1_ in
    let _v : (
# 85 "Parser.mly"
      (string list)
# 4630 "Parser.ml"
    ) = 
# 194 "Parser.mly"
                               ( [_1] )
# 4634 "Parser.ml"
     in
    _menhir_goto_defs _menhir_env _menhir_stack _endpos _menhir_s _v

and _menhir_reduce72 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 84 "Parser.mly"
      (Ast.same_type_defs_properties)
# 4641 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (_1 : (
# 84 "Parser.mly"
      (Ast.same_type_defs_properties)
# 4647 "Parser.ml"
    ))) = _menhir_stack in
    let _v : (
# 83 "Parser.mly"
      (Ast.same_type_defs_properties list)
# 4652 "Parser.ml"
    ) = 
# 187 "Parser.mly"
                                                           ( [_1] )
# 4656 "Parser.ml"
     in
    _menhir_goto_formal_defs _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_func_def : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 79 "Parser.mly"
      (Ast.ast_func_def)
# 4663 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState45 | MenhirState66 | MenhirState64 | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv719 * _menhir_state * (
# 79 "Parser.mly"
      (Ast.ast_func_def)
# 4673 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_bool ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_char ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_decl ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState64
        | T_def ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState64 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_int ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_list ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_exit | T_for | T_if | T_return | T_skip | T_string _ | T_var _ ->
            _menhir_reduce92 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState64) : 'freshtv720)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv733 * _menhir_state * (
# 79 "Parser.mly"
      (Ast.ast_func_def)
# 4701 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_eof ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv729 * _menhir_state * (
# 79 "Parser.mly"
      (Ast.ast_func_def)
# 4711 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv727 * _menhir_state * (
# 79 "Parser.mly"
      (Ast.ast_func_def)
# 4717 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : (
# 79 "Parser.mly"
      (Ast.ast_func_def)
# 4722 "Parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 78 "Parser.mly"
      (Ast.ast_program)
# 4728 "Parser.ml"
            ) = 
# 105 "Parser.mly"
                              ( (ast_tree := Some _1); _1 )
# 4732 "Parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv725) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 78 "Parser.mly"
      (Ast.ast_program)
# 4740 "Parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv723) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 78 "Parser.mly"
      (Ast.ast_program)
# 4748 "Parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv721) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 78 "Parser.mly"
      (Ast.ast_program)
# 4756 "Parser.ml"
            )) : (
# 78 "Parser.mly"
      (Ast.ast_program)
# 4760 "Parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv722)) : 'freshtv724)) : 'freshtv726)) : 'freshtv728)) : 'freshtv730)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv731 * _menhir_state * (
# 79 "Parser.mly"
      (Ast.ast_func_def)
# 4770 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv732)) : 'freshtv734)
    | _ ->
        _menhir_fail ()

and _menhir_goto_header : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 80 "Parser.mly"
      (Ast.header_properties)
# 4780 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv709 * Lexing.position * _menhir_state * Lexing.position) * _menhir_state * (
# 80 "Parser.mly"
      (Ast.header_properties)
# 4790 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_error43 _menhir_env (Obj.magic _menhir_stack)
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_colon ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : ('freshtv707 * Lexing.position * _menhir_state * Lexing.position) * _menhir_state * (
# 80 "Parser.mly"
      (Ast.header_properties)
# 4802 "Parser.ml"
              )) = Obj.magic _menhir_stack in
              ((let _menhir_env = _menhir_discard _menhir_env in
              let _tok = _menhir_env._menhir_token in
              match _tok with
              | T_bool ->
                  _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_char ->
                  _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_decl ->
                  _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState45
              | T_def ->
                  _menhir_run1 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState45 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_int ->
                  _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_list ->
                  _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_exit | T_for | T_if | T_return | T_skip | T_string _ | T_var _ ->
                  _menhir_reduce92 _menhir_env (Obj.magic _menhir_stack) MenhirState45
              | _ ->
                  assert (not _menhir_env._menhir_error);
                  _menhir_env._menhir_error <- true;
                  _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45) : 'freshtv708)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_error43 _menhir_env (Obj.magic _menhir_stack))) : 'freshtv710)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv717 * Lexing.position * _menhir_state) * _menhir_state * (
# 80 "Parser.mly"
      (Ast.header_properties)
# 4834 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv715 * Lexing.position * _menhir_state) * _menhir_state * (
# 80 "Parser.mly"
      (Ast.header_properties)
# 4840 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _endpos__1_, _menhir_s), _, (_2 : (
# 80 "Parser.mly"
      (Ast.header_properties)
# 4845 "Parser.ml"
        ))) = _menhir_stack in
        let _1 = () in
        let _v : (
# 87 "Parser.mly"
      (Ast.ast_func_decl)
# 4851 "Parser.ml"
        ) = 
# 206 "Parser.mly"
                            ( _2 )
# 4855 "Parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv713) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 87 "Parser.mly"
      (Ast.ast_func_decl)
# 4863 "Parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv711 * _menhir_state * (
# 87 "Parser.mly"
      (Ast.ast_func_decl)
# 4870 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_bool ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_char ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_decl ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState66
        | T_def ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState66 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_int ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_list ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_exit | T_for | T_if | T_return | T_skip | T_string _ | T_var _ ->
            _menhir_reduce92 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState66) : 'freshtv712)) : 'freshtv714)) : 'freshtv716)) : 'freshtv718)
    | _ ->
        _menhir_fail ()

and _menhir_goto_call : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_call -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    match _menhir_s with
    | MenhirState288 | MenhirState260 | MenhirState271 | MenhirState252 | MenhirState249 | MenhirState71 | MenhirState79 | MenhirState240 | MenhirState82 | MenhirState83 | MenhirState98 | MenhirState103 | MenhirState104 | MenhirState105 | MenhirState176 | MenhirState109 | MenhirState116 | MenhirState124 | MenhirState128 | MenhirState159 | MenhirState156 | MenhirState153 | MenhirState150 | MenhirState147 | MenhirState144 | MenhirState130 | MenhirState142 | MenhirState136 | MenhirState139 | MenhirState133 | MenhirState119 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv701 * Lexing.position * _menhir_state * 'tv_call * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce7 _menhir_env (Obj.magic _menhir_stack) : 'freshtv702)
    | MenhirState76 | MenhirState85 | MenhirState88 | MenhirState90 | MenhirState91 | MenhirState93 | MenhirState107 | MenhirState108 | MenhirState162 | MenhirState186 | MenhirState211 | MenhirState208 | MenhirState205 | MenhirState202 | MenhirState199 | MenhirState196 | MenhirState188 | MenhirState194 | MenhirState191 | MenhirState168 | MenhirState183 | MenhirState180 | MenhirState171 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv703 * Lexing.position * _menhir_state * 'tv_call * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce7 _menhir_env (Obj.magic _menhir_stack) : 'freshtv704)
    | MenhirState68 | MenhirState312 | MenhirState257 | MenhirState277 | MenhirState279 | MenhirState281 | MenhirState285 | MenhirState286 | MenhirState302 | MenhirState303 | MenhirState295 | MenhirState296 | MenhirState264 | MenhirState267 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv705 * Lexing.position * _menhir_state * 'tv_call * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_error269 _menhir_env (Obj.magic _menhir_stack)
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_colon | T_comma | T_else | T_elsif | T_end | T_exit | T_for | T_if | T_return | T_semicolon | T_skip | T_string _ | T_var _ ->
              _menhir_reduce115 _menhir_env (Obj.magic _menhir_stack)
          | T_assignment | T_lbracket ->
              _menhir_reduce7 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_error269 _menhir_env (Obj.magic _menhir_stack))) : 'freshtv706)
    | _ ->
        _menhir_fail ()

and _menhir_reduce21 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_atom * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_atom), _startpos__1_) = _menhir_stack in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 4935 "Parser.ml"
    ) = let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    
# 244 "Parser.mly"
                                                        ( { expr_info = E_atom (_1);     expr_error_pos = (_startpos, _endpos) }  )
# 4941 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_goto_atom : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> 'tv_atom -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    match _menhir_s with
    | MenhirState288 | MenhirState260 | MenhirState271 | MenhirState252 | MenhirState249 | MenhirState71 | MenhirState79 | MenhirState240 | MenhirState82 | MenhirState83 | MenhirState98 | MenhirState103 | MenhirState104 | MenhirState105 | MenhirState176 | MenhirState109 | MenhirState116 | MenhirState124 | MenhirState128 | MenhirState159 | MenhirState156 | MenhirState153 | MenhirState150 | MenhirState147 | MenhirState144 | MenhirState130 | MenhirState142 | MenhirState136 | MenhirState139 | MenhirState133 | MenhirState119 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv693 * Lexing.position * _menhir_state * 'tv_atom * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_error123 _menhir_env (Obj.magic _menhir_stack)
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_lbracket ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : 'freshtv691 * Lexing.position * _menhir_state * 'tv_atom * Lexing.position) = Obj.magic _menhir_stack in
              ((let _menhir_env = _menhir_discard _menhir_env in
              let _tok = _menhir_env._menhir_token in
              match _tok with
              | T_character _v ->
                  _menhir_run112 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState124 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_const _v ->
                  _menhir_run111 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState124 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_false ->
                  _menhir_run110 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState124 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_head ->
                  _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState124 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_lparen ->
                  _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState124 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_minus ->
                  _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState124 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_new ->
                  _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState124 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_nil ->
                  _menhir_run99 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState124 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_nil_qm ->
                  _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState124 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_not ->
                  _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState124 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_plus ->
                  _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState124 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_string _v ->
                  _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState124 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_tail ->
                  _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState124 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_true ->
                  _menhir_run74 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState124 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_var _v ->
                  _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState124 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | _ ->
                  assert (not _menhir_env._menhir_error);
                  _menhir_env._menhir_error <- true;
                  _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState124) : 'freshtv692)
          | T_and | T_colon | T_comma | T_div | T_else | T_elsif | T_end | T_equal | T_exit | T_for | T_greater | T_greatereq | T_hashtag | T_if | T_less | T_lesseq | T_minus | T_mod | T_mul | T_noteq | T_or | T_plus | T_rbracket | T_return | T_rparen | T_semicolon | T_skip | T_string _ | T_var _ ->
              _menhir_reduce21 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_error123 _menhir_env (Obj.magic _menhir_stack))) : 'freshtv694)
    | MenhirState76 | MenhirState85 | MenhirState88 | MenhirState90 | MenhirState91 | MenhirState93 | MenhirState107 | MenhirState108 | MenhirState162 | MenhirState186 | MenhirState211 | MenhirState208 | MenhirState205 | MenhirState202 | MenhirState199 | MenhirState196 | MenhirState188 | MenhirState194 | MenhirState191 | MenhirState168 | MenhirState183 | MenhirState180 | MenhirState171 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv695 * Lexing.position * _menhir_state * 'tv_atom * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_error175 _menhir_env (Obj.magic _menhir_stack)
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_lbracket ->
              _menhir_run176 _menhir_env (Obj.magic _menhir_stack)
          | T_and | T_div | T_equal | T_greater | T_greatereq | T_hashtag | T_less | T_lesseq | T_minus | T_mod | T_mul | T_noteq | T_or | T_plus | T_rparen ->
              _menhir_reduce21 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_error175 _menhir_env (Obj.magic _menhir_stack))) : 'freshtv696)
    | MenhirState68 | MenhirState312 | MenhirState257 | MenhirState277 | MenhirState279 | MenhirState281 | MenhirState285 | MenhirState286 | MenhirState302 | MenhirState303 | MenhirState295 | MenhirState296 | MenhirState264 | MenhirState267 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv699 * Lexing.position * _menhir_state * 'tv_atom * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_error270 _menhir_env (Obj.magic _menhir_stack)
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_assignment ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : 'freshtv697 * Lexing.position * _menhir_state * 'tv_atom * Lexing.position) = Obj.magic _menhir_stack in
              ((let _menhir_env = _menhir_discard _menhir_env in
              let _tok = _menhir_env._menhir_token in
              match _tok with
              | T_character _v ->
                  _menhir_run112 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState271 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_const _v ->
                  _menhir_run111 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState271 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_false ->
                  _menhir_run110 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState271 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_head ->
                  _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState271 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_lparen ->
                  _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState271 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_minus ->
                  _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState271 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_new ->
                  _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState271 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_nil ->
                  _menhir_run99 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState271 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_nil_qm ->
                  _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState271 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_not ->
                  _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState271 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_plus ->
                  _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState271 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_string _v ->
                  _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState271 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_tail ->
                  _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState271 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_true ->
                  _menhir_run74 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState271 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_var _v ->
                  _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState271 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | _ ->
                  assert (not _menhir_env._menhir_error);
                  _menhir_env._menhir_error <- true;
                  _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState271) : 'freshtv698)
          | T_lbracket ->
              _menhir_run176 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_error270 _menhir_env (Obj.magic _menhir_stack))) : 'freshtv700)
    | _ ->
        _menhir_fail ()

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5079 "Parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    match _menhir_s with
    | MenhirState109 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv553 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5089 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState113
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_and ->
              _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState113
          | T_div ->
              _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState113
          | T_equal ->
              _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState113
          | T_greater ->
              _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState113
          | T_greatereq ->
              _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState113
          | T_hashtag ->
              _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState113
          | T_less ->
              _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState113
          | T_lesseq ->
              _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState113
          | T_minus ->
              _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState113 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState113
          | T_mul ->
              _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState113
          | T_noteq ->
              _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState113
          | T_or ->
              _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState113
          | T_plus ->
              _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState113 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_rparen ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : ('freshtv551 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5129 "Parser.ml"
              ) * Lexing.position) = Obj.magic _menhir_stack in
              let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
              let (_menhir_s : _menhir_state) = MenhirState113 in
              ((let _menhir_env = _menhir_discard _menhir_env in
              _menhir_reduce24 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv552)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState113)) : 'freshtv554)
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv555 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5144 "Parser.ml"
        ) * Lexing.position) * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5148 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState118
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_div ->
              _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState118
          | T_mod ->
              _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState118
          | T_mul ->
              _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState118
          | T_and | T_colon | T_comma | T_else | T_elsif | T_end | T_equal | T_exit | T_for | T_greater | T_greatereq | T_hashtag | T_if | T_less | T_lesseq | T_minus | T_noteq | T_or | T_plus | T_rbracket | T_return | T_rparen | T_semicolon | T_skip | T_string _ | T_var _ ->
              _menhir_reduce28 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState118)) : 'freshtv556)
    | MenhirState119 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv557 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5172 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5176 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce30 _menhir_env (Obj.magic _menhir_stack) : 'freshtv558)
    | MenhirState124 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv561 * Lexing.position * _menhir_state * 'tv_atom * Lexing.position)) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5184 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState125
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_and ->
              _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState125
          | T_div ->
              _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState125
          | T_equal ->
              _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState125
          | T_greater ->
              _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState125
          | T_greatereq ->
              _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState125
          | T_hashtag ->
              _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState125
          | T_less ->
              _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState125
          | T_lesseq ->
              _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState125
          | T_minus ->
              _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState125
          | T_mul ->
              _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState125
          | T_noteq ->
              _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState125
          | T_or ->
              _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState125
          | T_plus ->
              _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_rbracket ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : (('freshtv559 * Lexing.position * _menhir_state * 'tv_atom * Lexing.position)) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5224 "Parser.ml"
              ) * Lexing.position) = Obj.magic _menhir_stack in
              let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
              let (_menhir_s : _menhir_state) = MenhirState125 in
              ((let _menhir_env = _menhir_discard _menhir_env in
              _menhir_reduce5 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv560)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState125)) : 'freshtv562)
    | MenhirState128 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv563 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5239 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5243 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState129
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_and ->
              _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState129
          | T_div ->
              _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState129
          | T_equal ->
              _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState129
          | T_greater ->
              _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState129
          | T_greatereq ->
              _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState129
          | T_hashtag ->
              _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState129
          | T_less ->
              _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState129
          | T_lesseq ->
              _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState129
          | T_minus ->
              _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState129
          | T_mul ->
              _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState129
          | T_noteq ->
              _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState129
          | T_plus ->
              _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_colon | T_comma | T_else | T_elsif | T_end | T_exit | T_for | T_if | T_or | T_rbracket | T_return | T_rparen | T_semicolon | T_skip | T_string _ | T_var _ ->
              _menhir_reduce43 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState129)) : 'freshtv564)
    | MenhirState130 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv565 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5287 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5291 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState132
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_div ->
              _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState132
          | T_hashtag ->
              _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState132
          | T_minus ->
              _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState132
          | T_mul ->
              _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState132
          | T_plus ->
              _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_and | T_colon | T_comma | T_else | T_elsif | T_end | T_exit | T_for | T_if | T_or | T_rbracket | T_return | T_rparen | T_semicolon | T_skip | T_string _ | T_var _ ->
              _menhir_reduce34 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState132)) : 'freshtv566)
    | MenhirState133 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv567 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5321 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5325 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce32 _menhir_env (Obj.magic _menhir_stack) : 'freshtv568)
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv569 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5333 "Parser.ml"
        ) * Lexing.position) * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5337 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState138
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_div ->
              _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState138
          | T_mod ->
              _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState138
          | T_mul ->
              _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState138
          | T_and | T_colon | T_comma | T_else | T_elsif | T_end | T_equal | T_exit | T_for | T_greater | T_greatereq | T_hashtag | T_if | T_less | T_lesseq | T_minus | T_noteq | T_or | T_plus | T_rbracket | T_return | T_rparen | T_semicolon | T_skip | T_string _ | T_var _ ->
              _menhir_reduce29 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState138)) : 'freshtv570)
    | MenhirState139 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv571 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5361 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5365 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce31 _menhir_env (Obj.magic _menhir_stack) : 'freshtv572)
    | MenhirState142 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv573 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5373 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5377 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState143
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_div ->
              _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState143
          | T_hashtag ->
              _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState143
          | T_minus ->
              _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState143 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState143
          | T_mul ->
              _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState143
          | T_plus ->
              _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState143 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_and | T_colon | T_comma | T_else | T_elsif | T_end | T_equal | T_exit | T_for | T_greater | T_greatereq | T_if | T_less | T_lesseq | T_noteq | T_or | T_rbracket | T_return | T_rparen | T_semicolon | T_skip | T_string _ | T_var _ ->
              _menhir_reduce60 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState143)) : 'freshtv574)
    | MenhirState144 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv575 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5407 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5411 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState146
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_div ->
              _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState146
          | T_hashtag ->
              _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState146
          | T_minus ->
              _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState146 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState146
          | T_mul ->
              _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState146
          | T_plus ->
              _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState146 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_and | T_colon | T_comma | T_else | T_elsif | T_end | T_exit | T_for | T_if | T_or | T_rbracket | T_return | T_rparen | T_semicolon | T_skip | T_string _ | T_var _ ->
              _menhir_reduce38 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState146)) : 'freshtv576)
    | MenhirState147 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv577 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5441 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5445 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState149
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_div ->
              _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState149
          | T_hashtag ->
              _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState149
          | T_minus ->
              _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState149 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState149
          | T_mul ->
              _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState149
          | T_plus ->
              _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState149 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_and | T_colon | T_comma | T_else | T_elsif | T_end | T_exit | T_for | T_if | T_or | T_rbracket | T_return | T_rparen | T_semicolon | T_skip | T_string _ | T_var _ ->
              _menhir_reduce36 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState149)) : 'freshtv578)
    | MenhirState150 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv579 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5475 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5479 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState152
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_div ->
              _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState152
          | T_hashtag ->
              _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState152
          | T_minus ->
              _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState152 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState152
          | T_mul ->
              _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState152
          | T_plus ->
              _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState152 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_and | T_colon | T_comma | T_else | T_elsif | T_end | T_exit | T_for | T_if | T_or | T_rbracket | T_return | T_rparen | T_semicolon | T_skip | T_string _ | T_var _ ->
              _menhir_reduce37 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState152)) : 'freshtv580)
    | MenhirState153 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv581 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5509 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5513 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState155
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_div ->
              _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState155
          | T_hashtag ->
              _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState155
          | T_minus ->
              _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState155
          | T_mul ->
              _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState155
          | T_plus ->
              _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_and | T_colon | T_comma | T_else | T_elsif | T_end | T_exit | T_for | T_if | T_or | T_rbracket | T_return | T_rparen | T_semicolon | T_skip | T_string _ | T_var _ ->
              _menhir_reduce35 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState155)) : 'freshtv582)
    | MenhirState156 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv583 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5543 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5547 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState158
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_div ->
              _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState158
          | T_hashtag ->
              _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState158
          | T_minus ->
              _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState158 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState158
          | T_mul ->
              _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState158
          | T_plus ->
              _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState158 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_and | T_colon | T_comma | T_else | T_elsif | T_end | T_exit | T_for | T_if | T_or | T_rbracket | T_return | T_rparen | T_semicolon | T_skip | T_string _ | T_var _ ->
              _menhir_reduce33 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState158)) : 'freshtv584)
    | MenhirState159 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv585 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5577 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5581 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState160
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_div ->
              _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState160
          | T_equal ->
              _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState160
          | T_greater ->
              _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState160
          | T_greatereq ->
              _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState160
          | T_hashtag ->
              _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState160
          | T_less ->
              _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState160
          | T_lesseq ->
              _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState160
          | T_minus ->
              _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState160 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState160
          | T_mul ->
              _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState160
          | T_noteq ->
              _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState160
          | T_plus ->
              _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState160 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_and | T_colon | T_comma | T_else | T_elsif | T_end | T_exit | T_for | T_if | T_or | T_rbracket | T_return | T_rparen | T_semicolon | T_skip | T_string _ | T_var _ ->
              _menhir_reduce42 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState160)) : 'freshtv586)
    | MenhirState162 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv589 * _menhir_state * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5623 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState166
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_and ->
              _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState166
          | T_div ->
              _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState166
          | T_equal ->
              _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState166
          | T_greater ->
              _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState166
          | T_greatereq ->
              _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState166
          | T_hashtag ->
              _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState166
          | T_less ->
              _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState166
          | T_lesseq ->
              _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState166
          | T_minus ->
              _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState166 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState166
          | T_mul ->
              _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState166
          | T_noteq ->
              _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState166
          | T_or ->
              _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState166
          | T_plus ->
              _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState166 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_rparen ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : (('freshtv587 * _menhir_state * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5663 "Parser.ml"
              ) * Lexing.position) = Obj.magic _menhir_stack in
              let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
              let (_menhir_s : _menhir_state) = MenhirState166 in
              ((let _menhir_env = _menhir_discard _menhir_env in
              _menhir_reduce61 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv588)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState166)) : 'freshtv590)
    | MenhirState168 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv591 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5678 "Parser.ml"
        ) * Lexing.position) * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5682 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState170
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_div ->
              _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState170
          | T_mod ->
              _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState170
          | T_mul ->
              _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState170
          | T_and | T_equal | T_greater | T_greatereq | T_hashtag | T_less | T_lesseq | T_minus | T_noteq | T_or | T_plus | T_rparen ->
              _menhir_reduce28 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState170)) : 'freshtv592)
    | MenhirState171 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv593 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5706 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5710 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce30 _menhir_env (Obj.magic _menhir_stack) : 'freshtv594)
    | MenhirState176 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv597 * Lexing.position * _menhir_state * 'tv_atom * Lexing.position)) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5718 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState177
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_and ->
              _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState177
          | T_div ->
              _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState177
          | T_equal ->
              _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState177
          | T_greater ->
              _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState177
          | T_greatereq ->
              _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState177
          | T_hashtag ->
              _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState177
          | T_less ->
              _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState177
          | T_lesseq ->
              _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState177
          | T_minus ->
              _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState177 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState177
          | T_mul ->
              _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState177
          | T_noteq ->
              _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState177
          | T_or ->
              _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState177
          | T_plus ->
              _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState177 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_rbracket ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : (('freshtv595 * Lexing.position * _menhir_state * 'tv_atom * Lexing.position)) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5758 "Parser.ml"
              ) * Lexing.position) = Obj.magic _menhir_stack in
              let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
              let (_menhir_s : _menhir_state) = MenhirState177 in
              ((let _menhir_env = _menhir_discard _menhir_env in
              _menhir_reduce5 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv596)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState177)) : 'freshtv598)
    | MenhirState180 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv599 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5773 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5777 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce32 _menhir_env (Obj.magic _menhir_stack) : 'freshtv600)
    | MenhirState183 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv601 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5785 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5789 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce31 _menhir_env (Obj.magic _menhir_stack) : 'freshtv602)
    | MenhirState186 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv603 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5797 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5801 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState187
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_and ->
              _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState187
          | T_div ->
              _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState187
          | T_equal ->
              _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState187
          | T_greater ->
              _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState187
          | T_greatereq ->
              _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState187
          | T_hashtag ->
              _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState187
          | T_less ->
              _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState187
          | T_lesseq ->
              _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState187
          | T_minus ->
              _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState187 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState187
          | T_mul ->
              _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState187
          | T_noteq ->
              _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState187
          | T_plus ->
              _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState187 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_or | T_rparen ->
              _menhir_reduce43 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState187)) : 'freshtv604)
    | MenhirState188 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv605 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5845 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5849 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState190
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_div ->
              _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState190
          | T_hashtag ->
              _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState190
          | T_minus ->
              _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState190 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState190
          | T_mul ->
              _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState190
          | T_plus ->
              _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState190 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_and | T_or | T_rparen ->
              _menhir_reduce34 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState190)) : 'freshtv606)
    | MenhirState191 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv607 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5879 "Parser.ml"
        ) * Lexing.position) * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5883 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState193
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_div ->
              _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState193
          | T_mod ->
              _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState193
          | T_mul ->
              _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState193
          | T_and | T_equal | T_greater | T_greatereq | T_hashtag | T_less | T_lesseq | T_minus | T_noteq | T_or | T_plus | T_rparen ->
              _menhir_reduce29 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState193)) : 'freshtv608)
    | MenhirState194 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv609 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5907 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5911 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState195
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_div ->
              _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState195
          | T_hashtag ->
              _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState195
          | T_minus ->
              _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState195 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState195
          | T_mul ->
              _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState195
          | T_plus ->
              _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState195 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_and | T_equal | T_greater | T_greatereq | T_less | T_lesseq | T_noteq | T_or | T_rparen ->
              _menhir_reduce60 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState195)) : 'freshtv610)
    | MenhirState196 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv611 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5941 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5945 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState198
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_div ->
              _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState198
          | T_hashtag ->
              _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState198
          | T_minus ->
              _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState198 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState198
          | T_mul ->
              _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState198
          | T_plus ->
              _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState198 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_and | T_or | T_rparen ->
              _menhir_reduce38 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState198)) : 'freshtv612)
    | MenhirState199 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv613 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5975 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 5979 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState201
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_div ->
              _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState201
          | T_hashtag ->
              _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState201
          | T_minus ->
              _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState201 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState201
          | T_mul ->
              _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState201
          | T_plus ->
              _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState201 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_and | T_or | T_rparen ->
              _menhir_reduce36 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState201)) : 'freshtv614)
    | MenhirState202 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv615 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6009 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6013 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState204
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_div ->
              _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState204
          | T_hashtag ->
              _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState204
          | T_minus ->
              _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState204 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState204
          | T_mul ->
              _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState204
          | T_plus ->
              _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState204 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_and | T_or | T_rparen ->
              _menhir_reduce37 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState204)) : 'freshtv616)
    | MenhirState205 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv617 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6043 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6047 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState207
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_div ->
              _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState207
          | T_hashtag ->
              _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState207
          | T_minus ->
              _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState207 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState207
          | T_mul ->
              _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState207
          | T_plus ->
              _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState207 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_and | T_or | T_rparen ->
              _menhir_reduce35 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState207)) : 'freshtv618)
    | MenhirState208 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv619 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6077 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6081 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState210
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_div ->
              _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState210
          | T_hashtag ->
              _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState210
          | T_minus ->
              _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState210 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState210
          | T_mul ->
              _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState210
          | T_plus ->
              _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState210 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_and | T_or | T_rparen ->
              _menhir_reduce33 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState210)) : 'freshtv620)
    | MenhirState211 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv621 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6111 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6115 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState212
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_div ->
              _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState212
          | T_equal ->
              _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState212
          | T_greater ->
              _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState212
          | T_greatereq ->
              _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState212
          | T_hashtag ->
              _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState212
          | T_less ->
              _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState212
          | T_lesseq ->
              _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState212
          | T_minus ->
              _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState212 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState212
          | T_mul ->
              _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState212
          | T_noteq ->
              _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState212
          | T_plus ->
              _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState212 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_and | T_or | T_rparen ->
              _menhir_reduce42 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState212)) : 'freshtv622)
    | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv623 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6157 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState213
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_div ->
              _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState213
          | T_mod ->
              _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState213
          | T_mul ->
              _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState213
          | T_and | T_equal | T_greater | T_greatereq | T_hashtag | T_less | T_lesseq | T_minus | T_noteq | T_or | T_plus | T_rparen ->
              _menhir_reduce27 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState213)) : 'freshtv624)
    | MenhirState107 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv627 * _menhir_state * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6181 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState214
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_and ->
              _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState214
          | T_div ->
              _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState214
          | T_equal ->
              _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState214
          | T_greater ->
              _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState214
          | T_greatereq ->
              _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState214
          | T_hashtag ->
              _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState214
          | T_less ->
              _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState214
          | T_lesseq ->
              _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState214
          | T_minus ->
              _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState214 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState214
          | T_mul ->
              _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState214
          | T_noteq ->
              _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState214
          | T_or ->
              _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState214
          | T_plus ->
              _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState214 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_rparen ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : (('freshtv625 * _menhir_state * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6221 "Parser.ml"
              ) * Lexing.position) = Obj.magic _menhir_stack in
              let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
              let (_menhir_s : _menhir_state) = MenhirState214 in
              ((let _menhir_env = _menhir_discard _menhir_env in
              _menhir_reduce61 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv626)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState214)) : 'freshtv628)
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv631 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6236 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState216
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_and ->
              _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState216
          | T_div ->
              _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState216
          | T_equal ->
              _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState216
          | T_greater ->
              _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState216
          | T_greatereq ->
              _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState216
          | T_hashtag ->
              _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState216
          | T_less ->
              _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState216
          | T_lesseq ->
              _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState216
          | T_minus ->
              _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState216 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState216
          | T_mul ->
              _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState216
          | T_noteq ->
              _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState216
          | T_or ->
              _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState216
          | T_plus ->
              _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState216 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_rparen ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : ('freshtv629 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6276 "Parser.ml"
              ) * Lexing.position) = Obj.magic _menhir_stack in
              let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
              let (_menhir_s : _menhir_state) = MenhirState216 in
              ((let _menhir_env = _menhir_discard _menhir_env in
              _menhir_reduce24 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv630)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState216)) : 'freshtv632)
    | MenhirState104 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv633 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6291 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState219
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_div ->
              _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState219
          | T_mod ->
              _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState219
          | T_mul ->
              _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState219
          | T_and | T_colon | T_comma | T_else | T_elsif | T_end | T_equal | T_exit | T_for | T_greater | T_greatereq | T_hashtag | T_if | T_less | T_lesseq | T_minus | T_noteq | T_or | T_plus | T_rbracket | T_return | T_rparen | T_semicolon | T_skip | T_string _ | T_var _ ->
              _menhir_reduce27 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState219)) : 'freshtv634)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv637 * _menhir_state * Lexing.position) * _menhir_state * 'tv_mytype * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6315 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState220
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_and ->
              _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState220
          | T_div ->
              _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState220
          | T_equal ->
              _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState220
          | T_greater ->
              _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState220
          | T_greatereq ->
              _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState220
          | T_hashtag ->
              _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState220
          | T_less ->
              _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState220
          | T_lesseq ->
              _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState220
          | T_minus ->
              _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState220 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState220
          | T_mul ->
              _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState220
          | T_noteq ->
              _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState220
          | T_or ->
              _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState220
          | T_plus ->
              _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState220 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_rbracket ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : ((('freshtv635 * _menhir_state * Lexing.position) * _menhir_state * 'tv_mytype * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6355 "Parser.ml"
              ) * Lexing.position) = Obj.magic _menhir_stack in
              let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
              let (_menhir_s : _menhir_state) = MenhirState220 in
              ((let _menhir_env = _menhir_discard _menhir_env in
              _menhir_reduce55 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv636)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState220)) : 'freshtv638)
    | MenhirState98 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv641 * _menhir_state * Lexing.position) * _menhir_state * 'tv_mytype * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6370 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState223
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_and ->
              _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState223
          | T_div ->
              _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState223
          | T_equal ->
              _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState223
          | T_greater ->
              _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState223
          | T_greatereq ->
              _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState223
          | T_hashtag ->
              _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState223
          | T_less ->
              _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState223
          | T_lesseq ->
              _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState223
          | T_minus ->
              _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState223 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState223
          | T_mul ->
              _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState223
          | T_noteq ->
              _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState223
          | T_or ->
              _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState223
          | T_plus ->
              _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState223 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_rbracket ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : ((('freshtv639 * _menhir_state * Lexing.position) * _menhir_state * 'tv_mytype * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6410 "Parser.ml"
              ) * Lexing.position) = Obj.magic _menhir_stack in
              let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
              let (_menhir_s : _menhir_state) = MenhirState223 in
              ((let _menhir_env = _menhir_discard _menhir_env in
              _menhir_reduce55 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv640)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState223)) : 'freshtv642)
    | MenhirState93 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv645 * _menhir_state * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6425 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState226
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_and ->
              _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState226
          | T_div ->
              _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState226
          | T_equal ->
              _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState226
          | T_greater ->
              _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState226
          | T_greatereq ->
              _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState226
          | T_hashtag ->
              _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState226
          | T_less ->
              _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState226
          | T_lesseq ->
              _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState226
          | T_minus ->
              _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState226 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState226
          | T_mul ->
              _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState226
          | T_noteq ->
              _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState226
          | T_or ->
              _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState226
          | T_plus ->
              _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState226 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_rparen ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : (('freshtv643 * _menhir_state * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6465 "Parser.ml"
              ) * Lexing.position) = Obj.magic _menhir_stack in
              let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
              let (_menhir_s : _menhir_state) = MenhirState226 in
              ((let _menhir_env = _menhir_discard _menhir_env in
              _menhir_reduce59 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv644)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState226)) : 'freshtv646)
    | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv647 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6480 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState228
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_div ->
              _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState228
          | T_equal ->
              _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState228
          | T_greater ->
              _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState228
          | T_greatereq ->
              _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState228
          | T_hashtag ->
              _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState228
          | T_less ->
              _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState228
          | T_lesseq ->
              _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState228
          | T_minus ->
              _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState228 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState228
          | T_mul ->
              _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState228
          | T_noteq ->
              _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState228
          | T_plus ->
              _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState228 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_and | T_or | T_rparen ->
              _menhir_reduce41 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState228)) : 'freshtv648)
    | MenhirState90 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv649 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6522 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState229
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_div ->
              _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState229
          | T_mod ->
              _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState229
          | T_mul ->
              _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState229
          | T_and | T_equal | T_greater | T_greatereq | T_hashtag | T_less | T_lesseq | T_minus | T_noteq | T_or | T_plus | T_rparen ->
              _menhir_reduce26 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState229)) : 'freshtv650)
    | MenhirState88 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv653 * _menhir_state * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6546 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState230
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_and ->
              _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState230
          | T_div ->
              _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState230
          | T_equal ->
              _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState230
          | T_greater ->
              _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState230
          | T_greatereq ->
              _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState230
          | T_hashtag ->
              _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState230
          | T_less ->
              _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState230
          | T_lesseq ->
              _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState230
          | T_minus ->
              _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState230 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState230
          | T_mul ->
              _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState230
          | T_noteq ->
              _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState230
          | T_or ->
              _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState230
          | T_plus ->
              _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState230 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_rparen ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : (('freshtv651 * _menhir_state * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6586 "Parser.ml"
              ) * Lexing.position) = Obj.magic _menhir_stack in
              let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
              let (_menhir_s : _menhir_state) = MenhirState230 in
              ((let _menhir_env = _menhir_discard _menhir_env in
              _menhir_reduce62 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv652)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState230)) : 'freshtv654)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv657 * _menhir_state * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6601 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState232
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_and ->
              _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState232
          | T_div ->
              _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState232
          | T_equal ->
              _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState232
          | T_greater ->
              _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState232
          | T_greatereq ->
              _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState232
          | T_hashtag ->
              _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState232
          | T_less ->
              _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState232
          | T_lesseq ->
              _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState232
          | T_minus ->
              _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState232 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState232
          | T_mul ->
              _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState232
          | T_noteq ->
              _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState232
          | T_or ->
              _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState232
          | T_plus ->
              _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState232 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_rparen ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : (('freshtv655 * _menhir_state * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6641 "Parser.ml"
              ) * Lexing.position) = Obj.magic _menhir_stack in
              let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
              let (_menhir_s : _menhir_state) = MenhirState232 in
              ((let _menhir_env = _menhir_discard _menhir_env in
              _menhir_reduce59 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv656)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState232)) : 'freshtv658)
    | MenhirState83 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv659 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6656 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState234
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_div ->
              _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState234
          | T_equal ->
              _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState234
          | T_greater ->
              _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState234
          | T_greatereq ->
              _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState234
          | T_hashtag ->
              _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState234
          | T_less ->
              _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState234
          | T_lesseq ->
              _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState234
          | T_minus ->
              _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState234 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState234
          | T_mul ->
              _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState234
          | T_noteq ->
              _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState234
          | T_plus ->
              _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState234 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_and | T_colon | T_comma | T_else | T_elsif | T_end | T_exit | T_for | T_if | T_or | T_rbracket | T_return | T_rparen | T_semicolon | T_skip | T_string _ | T_var _ ->
              _menhir_reduce41 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState234)) : 'freshtv660)
    | MenhirState82 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv661 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6698 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState235
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_div ->
              _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState235
          | T_mod ->
              _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState235
          | T_mul ->
              _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState235
          | T_and | T_colon | T_comma | T_else | T_elsif | T_end | T_equal | T_exit | T_for | T_greater | T_greatereq | T_hashtag | T_if | T_less | T_lesseq | T_minus | T_noteq | T_or | T_plus | T_rbracket | T_return | T_rparen | T_semicolon | T_skip | T_string _ | T_var _ ->
              _menhir_reduce26 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState235)) : 'freshtv662)
    | MenhirState71 | MenhirState240 | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv665 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6722 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState239
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_and ->
              _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState239
          | T_comma ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : 'freshtv663 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6736 "Parser.ml"
              ) * Lexing.position) = Obj.magic _menhir_stack in
              let (_menhir_s : _menhir_state) = MenhirState239 in
              ((let _menhir_stack = (_menhir_stack, _menhir_s) in
              let _menhir_env = _menhir_discard _menhir_env in
              let _tok = _menhir_env._menhir_token in
              match _tok with
              | T_character _v ->
                  _menhir_run112 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState240 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_const _v ->
                  _menhir_run111 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState240 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_false ->
                  _menhir_run110 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState240 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_head ->
                  _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState240 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_lparen ->
                  _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState240 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_minus ->
                  _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState240 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_new ->
                  _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState240 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_nil ->
                  _menhir_run99 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState240 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_nil_qm ->
                  _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState240 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_not ->
                  _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState240 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_plus ->
                  _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState240 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_string _v ->
                  _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState240 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_tail ->
                  _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState240 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_true ->
                  _menhir_run74 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState240 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_var _v ->
                  _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState240 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | _ ->
                  assert (not _menhir_env._menhir_error);
                  _menhir_env._menhir_error <- true;
                  _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState240) : 'freshtv664)
          | T_div ->
              _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState239
          | T_equal ->
              _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState239
          | T_greater ->
              _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState239
          | T_greatereq ->
              _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState239
          | T_hashtag ->
              _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState239
          | T_less ->
              _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState239
          | T_lesseq ->
              _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState239
          | T_minus ->
              _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState239 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState239
          | T_mul ->
              _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState239
          | T_noteq ->
              _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState239
          | T_or ->
              _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState239
          | T_plus ->
              _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState239 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_rparen ->
              _menhir_reduce1 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState239)) : 'freshtv666)
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv669 * _menhir_state * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6814 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState243
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_and ->
              _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState243
          | T_div ->
              _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState243
          | T_equal ->
              _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState243
          | T_greater ->
              _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState243
          | T_greatereq ->
              _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState243
          | T_hashtag ->
              _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState243
          | T_less ->
              _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState243
          | T_lesseq ->
              _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState243
          | T_minus ->
              _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState243 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState243
          | T_mul ->
              _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState243
          | T_noteq ->
              _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState243
          | T_or ->
              _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState243
          | T_plus ->
              _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState243 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_rparen ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : (('freshtv667 * _menhir_state * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6854 "Parser.ml"
              ) * Lexing.position) = Obj.magic _menhir_stack in
              let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
              let (_menhir_s : _menhir_state) = MenhirState243 in
              ((let _menhir_env = _menhir_discard _menhir_env in
              _menhir_reduce62 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv668)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState243)) : 'freshtv670)
    | MenhirState249 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv671 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6869 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState251
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_and ->
              _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState251
          | T_div ->
              _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState251
          | T_equal ->
              _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState251
          | T_greater ->
              _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState251
          | T_greatereq ->
              _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState251
          | T_hashtag ->
              _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState251
          | T_less ->
              _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState251
          | T_lesseq ->
              _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState251
          | T_minus ->
              _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState251 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState251
          | T_mul ->
              _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState251
          | T_noteq ->
              _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState251
          | T_or ->
              _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState251
          | T_plus ->
              _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState251 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_else | T_elsif | T_end | T_exit | T_for | T_if | T_return | T_skip | T_string _ | T_var _ ->
              _menhir_reduce120 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState251)) : 'freshtv672)
    | MenhirState252 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv677 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6915 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState254
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_and ->
              _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState254
          | T_colon ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : ('freshtv675 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6929 "Parser.ml"
              ) * Lexing.position) = Obj.magic _menhir_stack in
              let (_menhir_s : _menhir_state) = MenhirState254 in
              ((let _menhir_env = _menhir_discard _menhir_env in
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : ('freshtv673 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6937 "Parser.ml"
              ) * Lexing.position) = Obj.magic _menhir_stack in
              let (_ : _menhir_state) = _menhir_s in
              ((let ((_menhir_stack, _menhir_s, _startpos__1_), _endpos__2_, _, (_2 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6943 "Parser.ml"
              )), _startpos__2_) = _menhir_stack in
              let _3 = () in
              let _1 = () in
              let _startpos = _startpos__1_ in
              let _v : 'tv_if_cond = 
# 155 "Parser.mly"
                                 ( _2 )
# 6951 "Parser.ml"
               in
              _menhir_goto_if_cond _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv674)) : 'freshtv676)
          | T_div ->
              _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState254
          | T_equal ->
              _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState254
          | T_greater ->
              _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState254
          | T_greatereq ->
              _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState254
          | T_hashtag ->
              _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState254
          | T_less ->
              _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState254
          | T_lesseq ->
              _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState254
          | T_minus ->
              _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState254 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState254
          | T_mul ->
              _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState254
          | T_noteq ->
              _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState254
          | T_or ->
              _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState254
          | T_plus ->
              _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState254 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState254)) : 'freshtv678)
    | MenhirState260 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv681 * _menhir_state * (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 6989 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 6993 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState262
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_and ->
              _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState262
          | T_div ->
              _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState262
          | T_equal ->
              _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState262
          | T_greater ->
              _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState262
          | T_greatereq ->
              _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState262
          | T_hashtag ->
              _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState262
          | T_less ->
              _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState262
          | T_lesseq ->
              _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState262
          | T_minus ->
              _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState262 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState262
          | T_mul ->
              _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState262
          | T_noteq ->
              _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState262
          | T_or ->
              _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState262
          | T_plus ->
              _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState262 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_semicolon ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : (('freshtv679 * _menhir_state * (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 7033 "Parser.ml"
              ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 7037 "Parser.ml"
              ) * Lexing.position) = Obj.magic _menhir_stack in
              let (_menhir_s : _menhir_state) = MenhirState262 in
              ((let _menhir_stack = (_menhir_stack, _menhir_s) in
              let _menhir_env = _menhir_discard _menhir_env in
              let _tok = _menhir_env._menhir_token in
              match _tok with
              | T_skip ->
                  _menhir_run248 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState264 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_string _v ->
                  _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState264 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_var _v ->
                  _menhir_run69 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState264 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | _ ->
                  assert (not _menhir_env._menhir_error);
                  _menhir_env._menhir_error <- true;
                  _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState264) : 'freshtv680)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState262)) : 'freshtv682)
    | MenhirState271 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv683 * Lexing.position * _menhir_state * 'tv_atom * Lexing.position)) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 7063 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState273
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_and ->
              _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState273
          | T_div ->
              _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState273
          | T_equal ->
              _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState273
          | T_greater ->
              _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState273
          | T_greatereq ->
              _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState273
          | T_hashtag ->
              _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState273
          | T_less ->
              _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState273
          | T_lesseq ->
              _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState273
          | T_minus ->
              _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState273 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState273
          | T_mul ->
              _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState273
          | T_noteq ->
              _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState273
          | T_or ->
              _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState273
          | T_plus ->
              _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState273 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_colon | T_comma | T_else | T_elsif | T_end | T_exit | T_for | T_if | T_return | T_semicolon | T_skip | T_string _ | T_var _ ->
              _menhir_reduce113 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState273)) : 'freshtv684)
    | MenhirState288 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv689 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 7109 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState290
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_and ->
              _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState290
          | T_colon ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : ('freshtv687 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 7123 "Parser.ml"
              ) * Lexing.position) = Obj.magic _menhir_stack in
              let (_menhir_s : _menhir_state) = MenhirState290 in
              ((let _menhir_env = _menhir_discard _menhir_env in
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : ('freshtv685 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 7131 "Parser.ml"
              ) * Lexing.position) = Obj.magic _menhir_stack in
              let (_ : _menhir_state) = _menhir_s in
              ((let ((_menhir_stack, _menhir_s, _startpos__1_), _endpos__2_, _, (_2 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 7137 "Parser.ml"
              )), _startpos__2_) = _menhir_stack in
              let _3 = () in
              let _1 = () in
              let _v : 'tv_elif_cond = 
# 175 "Parser.mly"
                                   ( _2 )
# 7144 "Parser.ml"
               in
              _menhir_goto_elif_cond _menhir_env _menhir_stack _menhir_s _v) : 'freshtv686)) : 'freshtv688)
          | T_div ->
              _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState290
          | T_equal ->
              _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState290
          | T_greater ->
              _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState290
          | T_greatereq ->
              _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState290
          | T_hashtag ->
              _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState290
          | T_less ->
              _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState290
          | T_lesseq ->
              _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState290
          | T_minus ->
              _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState290 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_mod ->
              _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState290
          | T_mul ->
              _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState290
          | T_noteq ->
              _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState290
          | T_or ->
              _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState290
          | T_plus ->
              _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState290 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState290)) : 'freshtv690)
    | _ ->
        _menhir_fail ()

and _menhir_goto_actual_params : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 98 "Parser.mly"
      (Ast.expr_properties list)
# 7183 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState240 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv545 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 7192 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 98 "Parser.mly"
      (Ast.expr_properties list)
# 7198 "Parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv543 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 7204 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : (
# 98 "Parser.mly"
      (Ast.expr_properties list)
# 7210 "Parser.ml"
        )) : (
# 98 "Parser.mly"
      (Ast.expr_properties list)
# 7214 "Parser.ml"
        )) = _v in
        ((let ((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 7219 "Parser.ml"
        )), _startpos__1_), _) = _menhir_stack in
        let _2 = () in
        let _v : (
# 98 "Parser.mly"
      (Ast.expr_properties list)
# 7225 "Parser.ml"
        ) = 
# 232 "Parser.mly"
                                                       ( _1 :: _3 )
# 7229 "Parser.ml"
         in
        _menhir_goto_actual_params _menhir_env _menhir_stack _menhir_s _v) : 'freshtv544)) : 'freshtv546)
    | MenhirState71 | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv549) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 98 "Parser.mly"
      (Ast.expr_properties list)
# 7239 "Parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv547) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 98 "Parser.mly"
      (Ast.expr_properties list)
# 7247 "Parser.ml"
        )) : (
# 98 "Parser.mly"
      (Ast.expr_properties list)
# 7251 "Parser.ml"
        )) = _v in
        ((let _v : (
# 97 "Parser.mly"
      (Ast.expr_properties list)
# 7256 "Parser.ml"
        ) = 
# 228 "Parser.mly"
                                        ( _1 )
# 7260 "Parser.ml"
         in
        _menhir_goto_maybe_actual_params _menhir_env _menhir_stack _menhir_s _v) : 'freshtv548)) : 'freshtv550)
    | _ ->
        _menhir_fail ()

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_simple_list : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 7274 "Parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v, _startpos) in
    match _menhir_s with
    | MenhirState257 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv539 * _menhir_state * (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 7284 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState258
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_comma ->
              _menhir_run267 _menhir_env (Obj.magic _menhir_stack) MenhirState258
          | T_semicolon ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : 'freshtv537 * _menhir_state * (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 7298 "Parser.ml"
              ) * Lexing.position) = Obj.magic _menhir_stack in
              let (_menhir_s : _menhir_state) = MenhirState258 in
              ((let _menhir_stack = (_menhir_stack, _menhir_s) in
              let _menhir_env = _menhir_discard _menhir_env in
              let _tok = _menhir_env._menhir_token in
              match _tok with
              | T_character _v ->
                  _menhir_run112 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState260 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_const _v ->
                  _menhir_run111 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState260 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_false ->
                  _menhir_run110 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState260 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_head ->
                  _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState260 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_lparen ->
                  _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState260 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_minus ->
                  _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState260 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_new ->
                  _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState260 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_nil ->
                  _menhir_run99 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState260 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_nil_qm ->
                  _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState260 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_not ->
                  _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState260 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_plus ->
                  _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState260 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_string _v ->
                  _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState260 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_tail ->
                  _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState260 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_true ->
                  _menhir_run74 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState260 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_var _v ->
                  _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState260 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | _ ->
                  assert (not _menhir_env._menhir_error);
                  _menhir_env._menhir_error <- true;
                  _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState260) : 'freshtv538)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState258)) : 'freshtv540)
    | MenhirState264 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv541 * _menhir_state * (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 7348 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 7352 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * _menhir_state * (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 7356 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState266
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_comma ->
              _menhir_run267 _menhir_env (Obj.magic _menhir_stack) MenhirState266
          | T_colon ->
              _menhir_reduce64 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState266)) : 'freshtv542)
    | _ ->
        _menhir_fail ()

and _menhir_goto_for_whole : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_for_whole -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv535) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_for_whole) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv533) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_for_whole) : 'tv_for_whole) = _v in
    ((let _v : (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 7387 "Parser.ml"
    ) = 
# 135 "Parser.mly"
                              ( S_for (_1) )
# 7391 "Parser.ml"
     in
    _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv534)) : 'freshtv536)

and _menhir_goto_maybe_elif : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_maybe_elif -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv531 * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 7402 "Parser.ml"
    )) * _menhir_state * (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 7406 "Parser.ml"
    )) * _menhir_state * 'tv_maybe_elif) = Obj.magic _menhir_stack in
    ((if _menhir_env._menhir_error then
      _menhir_error293 _menhir_env (Obj.magic _menhir_stack)
    else
      let _tok = _menhir_env._menhir_token in
      match _tok with
      | T_else ->
          let (_menhir_env : _menhir_env) = _menhir_env in
          let (_menhir_stack : 'freshtv529) = Obj.magic _menhir_stack in
          let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
          let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
          ((let _menhir_stack = (_menhir_stack, _endpos, _startpos) in
          let _menhir_env = _menhir_discard _menhir_env in
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_colon ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : 'freshtv527 * Lexing.position * Lexing.position) = Obj.magic _menhir_stack in
              ((let _menhir_env = _menhir_discard _menhir_env in
              let _tok = _menhir_env._menhir_token in
              match _tok with
              | T_exit ->
                  _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState295
              | T_for ->
                  _menhir_run257 _menhir_env (Obj.magic _menhir_stack) MenhirState295 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_if ->
                  _menhir_run252 _menhir_env (Obj.magic _menhir_stack) MenhirState295 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_return ->
                  _menhir_run249 _menhir_env (Obj.magic _menhir_stack) MenhirState295 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_skip ->
                  _menhir_run248 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState295 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_string _v ->
                  _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState295 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | T_var _v ->
                  _menhir_run69 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState295 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
              | _ ->
                  assert (not _menhir_env._menhir_error);
                  _menhir_env._menhir_error <- true;
                  _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState295) : 'freshtv528)
          | T_end ->
              _menhir_reduce20 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_error294 _menhir_env (Obj.magic _menhir_stack)) : 'freshtv530)
      | T_end ->
          _menhir_reduce97 _menhir_env (Obj.magic _menhir_stack)
      | _ ->
          (assert (not _menhir_env._menhir_error);
          _menhir_env._menhir_error <- true;
          _menhir_error293 _menhir_env (Obj.magic _menhir_stack))) : 'freshtv532)

and _menhir_run69 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 13 "Parser.mly"
       (string)
# 7462 "Parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_lparen ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_assignment | T_lbracket ->
        _menhir_reduce3 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState69

and _menhir_run89 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (
# 74 "Parser.mly"
       (string)
# 7481 "Parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce4 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s _v _startpos

and _menhir_run248 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv525) = Obj.magic _menhir_stack in
    let (_endpos__1_ : Lexing.position) = _endpos in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_startpos__1_ : Lexing.position) = _startpos in
    ((let _1 = () in
    let _startpos = _startpos__1_ in
    let _v : (
# 94 "Parser.mly"
      (Ast.simple_properties)
# 7500 "Parser.ml"
    ) = let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    
# 211 "Parser.mly"
                                      ( { simple_info = Simple_skip; simple_error_pos = (_startpos, _endpos) } )
# 7506 "Parser.ml"
     in
    _menhir_goto_simple _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv526)

and _menhir_run249 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState249 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState249 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState249 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState249 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState249 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState249 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState249 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState249 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState249 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState249 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState249 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState249 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState249 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState249 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState249 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState249

and _menhir_run252 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_character _v ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState252 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_const _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState252 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_false ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState252 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_head ->
        _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState252 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_lparen ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState252 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_minus ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState252 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_new ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState252 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState252 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_nil_qm ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState252 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_not ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState252 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_plus ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState252 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState252 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_tail ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState252 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_true ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState252 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState252 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState252

and _menhir_run257 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_skip ->
        _menhir_run248 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState257 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState257 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState257 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState257

and _menhir_run278 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv523) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 7619 "Parser.ml"
    ) = 
# 131 "Parser.mly"
                              ( S_exit )
# 7623 "Parser.ml"
     in
    _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv524)

and _menhir_reduce20 : _menhir_env -> 'ttv_tail * Lexing.position * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _endpos__1_, _startpos__1_) = _menhir_stack in
    let _1 = () in
    let _v : 'tv_else_whole = let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    
# 169 "Parser.mly"
                     ( missing_colon_after_else_error (_startpos, _endpos); raise Terminate )
# 7636 "Parser.ml"
     in
    _menhir_goto_else_whole _menhir_env _menhir_stack _v

and _menhir_goto_elif_whole : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_elif_whole -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState287 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv517) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_elif_whole) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv515) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_elif_whole) : 'tv_elif_whole) = _v in
        ((let _v : 'tv_maybe_elif = 
# 163 "Parser.mly"
                         ( Some _1 )
# 7655 "Parser.ml"
         in
        _menhir_goto_maybe_elif _menhir_env _menhir_stack _menhir_s _v) : 'freshtv516)) : 'freshtv518)
    | MenhirState304 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv521 * _menhir_state * 'tv_elif_cond) * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 7663 "Parser.ml"
        )) * _menhir_state * (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 7667 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_elif_whole) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv519 * _menhir_state * 'tv_elif_cond) * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 7675 "Parser.ml"
        )) * _menhir_state * (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 7679 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_elif_whole) : 'tv_elif_whole) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_elif_cond)), _, (_2 : (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 7686 "Parser.ml"
        ))), _, (_3 : (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 7690 "Parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_elif_whole = 
# 173 "Parser.mly"
                                                   (  (_1, _2 :: _3) :: _4 )
# 7695 "Parser.ml"
         in
        _menhir_goto_elif_whole _menhir_env _menhir_stack _menhir_s _v) : 'freshtv520)) : 'freshtv522)
    | _ ->
        _menhir_fail ()

and _menhir_goto_stmt_list : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 7704 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState279 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv495 * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 7714 "Parser.ml"
        )) * _menhir_state * (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 7718 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv493 * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 7724 "Parser.ml"
        )) * _menhir_state * (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 7728 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 7733 "Parser.ml"
        ))), _, (_2 : (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 7737 "Parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_for_body = 
# 149 "Parser.mly"
                           ( _1 :: _2 )
# 7742 "Parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv491) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_for_body) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv489 * _menhir_state * Lexing.position) * _menhir_state * 'tv_for_head)) * _menhir_state * 'tv_for_body) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_error309 _menhir_env (Obj.magic _menhir_stack)
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_end ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : ((('freshtv487 * _menhir_state * Lexing.position) * _menhir_state * 'tv_for_head)) * _menhir_state * 'tv_for_body) = Obj.magic _menhir_stack in
              ((let _menhir_env = _menhir_discard _menhir_env in
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : ((('freshtv485 * _menhir_state * Lexing.position) * _menhir_state * 'tv_for_head)) * _menhir_state * 'tv_for_body) = Obj.magic _menhir_stack in
              ((let (((_menhir_stack, _menhir_s, _startpos__1_), _, (_2 : 'tv_for_head)), _, (_4 : 'tv_for_body)) = _menhir_stack in
              let _5 = () in
              let _3 = () in
              let _1 = () in
              let _v : 'tv_for_whole = 
# 137 "Parser.mly"
                                                    ( (_2, _4) )
# 7769 "Parser.ml"
               in
              _menhir_goto_for_whole _menhir_env _menhir_stack _menhir_s _v) : 'freshtv486)) : 'freshtv488)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_error309 _menhir_env (Obj.magic _menhir_stack))) : 'freshtv490)) : 'freshtv492)) : 'freshtv494)) : 'freshtv496)
    | MenhirState281 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv499 * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 7781 "Parser.ml"
        )) * _menhir_state * (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 7785 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv497 * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 7791 "Parser.ml"
        )) * _menhir_state * (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 7795 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 7800 "Parser.ml"
        ))), _, (_2 : (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 7804 "Parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 7809 "Parser.ml"
        ) = 
# 128 "Parser.mly"
                              ( _1 :: _2 )
# 7813 "Parser.ml"
         in
        _menhir_goto_stmt_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv498)) : 'freshtv500)
    | MenhirState286 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv501 * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 7821 "Parser.ml"
        )) * _menhir_state * (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 7825 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState287
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_elsif ->
              _menhir_run288 _menhir_env (Obj.magic _menhir_stack) MenhirState287 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_else | T_end ->
              _menhir_reduce95 _menhir_env (Obj.magic _menhir_stack) MenhirState287
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState287)) : 'freshtv502)
    | MenhirState296 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv505 * Lexing.position * Lexing.position)) * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 7845 "Parser.ml"
        )) * _menhir_state * (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 7849 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv503 * Lexing.position * Lexing.position)) * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 7855 "Parser.ml"
        )) * _menhir_state * (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 7859 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _endpos__1_, _startpos__1_), _, (_3 : (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 7864 "Parser.ml"
        ))), _, (_4 : (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 7868 "Parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_else_whole = 
# 168 "Parser.mly"
                                            ( _3 :: _4 )
# 7875 "Parser.ml"
         in
        _menhir_goto_else_whole _menhir_env _menhir_stack _v) : 'freshtv504)) : 'freshtv506)
    | MenhirState303 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv507 * _menhir_state * 'tv_elif_cond) * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 7883 "Parser.ml"
        )) * _menhir_state * (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 7887 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState304
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_elsif ->
              _menhir_run288 _menhir_env (Obj.magic _menhir_stack) MenhirState304 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_else | T_end ->
              _menhir_reduce17 _menhir_env (Obj.magic _menhir_stack)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState304)) : 'freshtv508)
    | MenhirState312 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv513 * Lexing.position * _menhir_state * Lexing.position) * _menhir_state * (
# 80 "Parser.mly"
      (Ast.header_properties)
# 7907 "Parser.ml"
        ))) * _menhir_state * (
# 81 "Parser.mly"
      (Ast.ast_inside_func_def list)
# 7911 "Parser.ml"
        )) * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 7915 "Parser.ml"
        )) * _menhir_state * (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 7919 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_error313 _menhir_env (Obj.magic _menhir_stack)
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_end ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : ((((('freshtv511 * Lexing.position * _menhir_state * Lexing.position) * _menhir_state * (
# 80 "Parser.mly"
      (Ast.header_properties)
# 7931 "Parser.ml"
              ))) * _menhir_state * (
# 81 "Parser.mly"
      (Ast.ast_inside_func_def list)
# 7935 "Parser.ml"
              )) * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 7939 "Parser.ml"
              )) * _menhir_state * (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 7943 "Parser.ml"
              )) = Obj.magic _menhir_stack in
              ((let _menhir_env = _menhir_discard _menhir_env in
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : ((((('freshtv509 * Lexing.position * _menhir_state * Lexing.position) * _menhir_state * (
# 80 "Parser.mly"
      (Ast.header_properties)
# 7950 "Parser.ml"
              ))) * _menhir_state * (
# 81 "Parser.mly"
      (Ast.ast_inside_func_def list)
# 7954 "Parser.ml"
              )) * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 7958 "Parser.ml"
              )) * _menhir_state * (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 7962 "Parser.ml"
              )) = Obj.magic _menhir_stack in
              ((let (((((_menhir_stack, _endpos__1_, _menhir_s, _startpos__1_), _, (_2 : (
# 80 "Parser.mly"
      (Ast.header_properties)
# 7967 "Parser.ml"
              ))), _, (_4 : (
# 81 "Parser.mly"
      (Ast.ast_inside_func_def list)
# 7971 "Parser.ml"
              ))), _, (_5 : (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 7975 "Parser.ml"
              ))), _, (_6 : (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 7979 "Parser.ml"
              ))) = _menhir_stack in
              let _7 = () in
              let _3 = () in
              let _1 = () in
              let _v : (
# 79 "Parser.mly"
      (Ast.ast_func_def)
# 7987 "Parser.ml"
              ) = 
# 108 "Parser.mly"
            ( Fundef (_2, _4, (_5 :: _6)) )
# 7991 "Parser.ml"
               in
              _menhir_goto_func_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv510)) : 'freshtv512)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_error313 _menhir_env (Obj.magic _menhir_stack))) : 'freshtv514)
    | _ ->
        _menhir_fail ()

and _menhir_goto_maybe_mytype : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_maybe_mytype -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v, _startpos) in
    match _menhir_s with
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv473 * _menhir_state * 'tv_maybe_mytype * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_error21 _menhir_env (Obj.magic _menhir_stack)
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_var _v ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : 'freshtv471 * _menhir_state * 'tv_maybe_mytype * Lexing.position) = Obj.magic _menhir_stack in
              let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
              let (_v : (
# 13 "Parser.mly"
       (string)
# 8020 "Parser.ml"
              )) = _v in
              let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
              ((let _menhir_stack = (_menhir_stack, _endpos, _v, _startpos) in
              let _menhir_env = _menhir_discard _menhir_env in
              let _tok = _menhir_env._menhir_token in
              match _tok with
              | T_lparen ->
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : ('freshtv465 * _menhir_state * 'tv_maybe_mytype * Lexing.position) * Lexing.position * (
# 13 "Parser.mly"
       (string)
# 8032 "Parser.ml"
                  ) * Lexing.position) = Obj.magic _menhir_stack in
                  let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
                  ((let _menhir_stack = (_menhir_stack, _startpos) in
                  let _menhir_env = _menhir_discard _menhir_env in
                  let _tok = _menhir_env._menhir_token in
                  match _tok with
                  | T_bool ->
                      _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                  | T_char ->
                      _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                  | T_int ->
                      _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                  | T_list ->
                      _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                  | T_ref ->
                      _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                  | T_rparen ->
                      _menhir_reduce99 _menhir_env (Obj.magic _menhir_stack) MenhirState25
                  | _ ->
                      assert (not _menhir_env._menhir_error);
                      _menhir_env._menhir_error <- true;
                      _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState25) : 'freshtv466)
              | _ ->
                  assert (not _menhir_env._menhir_error);
                  _menhir_env._menhir_error <- true;
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : ('freshtv469 * _menhir_state * 'tv_maybe_mytype * Lexing.position) * Lexing.position * (
# 13 "Parser.mly"
       (string)
# 8062 "Parser.ml"
                  ) * Lexing.position) = Obj.magic _menhir_stack in
                  ((let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : ('freshtv467 * _menhir_state * 'tv_maybe_mytype * Lexing.position) * Lexing.position * (
# 13 "Parser.mly"
       (string)
# 8068 "Parser.ml"
                  ) * Lexing.position) = Obj.magic _menhir_stack in
                  let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                  ((let _menhir_env = _menhir_discard _menhir_env in
                  _menhir_reduce80 _menhir_env (Obj.magic _menhir_stack) _endpos) : 'freshtv468)) : 'freshtv470)) : 'freshtv472)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_error21 _menhir_env (Obj.magic _menhir_stack))) : 'freshtv474)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv483 * _menhir_state * 'tv_maybe_mytype * Lexing.position) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_error47 _menhir_env (Obj.magic _menhir_stack)
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_var _v ->
              let (_menhir_env : _menhir_env) = _menhir_env in
              let (_menhir_stack : 'freshtv481 * _menhir_state * 'tv_maybe_mytype * Lexing.position) = Obj.magic _menhir_stack in
              let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
              let (_v : (
# 13 "Parser.mly"
       (string)
# 8092 "Parser.ml"
              )) = _v in
              let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
              ((let _menhir_stack = (_menhir_stack, _endpos, _v, _startpos) in
              let _menhir_env = _menhir_discard _menhir_env in
              let _tok = _menhir_env._menhir_token in
              match _tok with
              | T_lparen ->
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : ('freshtv475 * _menhir_state * 'tv_maybe_mytype * Lexing.position) * Lexing.position * (
# 13 "Parser.mly"
       (string)
# 8104 "Parser.ml"
                  ) * Lexing.position) = Obj.magic _menhir_stack in
                  let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
                  ((let _menhir_stack = (_menhir_stack, _startpos) in
                  let _menhir_env = _menhir_discard _menhir_env in
                  let _tok = _menhir_env._menhir_token in
                  match _tok with
                  | T_bool ->
                      _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                  | T_char ->
                      _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                  | T_int ->
                      _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                  | T_list ->
                      _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                  | T_ref ->
                      _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                  | T_rparen ->
                      _menhir_reduce99 _menhir_env (Obj.magic _menhir_stack) MenhirState51
                  | _ ->
                      assert (not _menhir_env._menhir_error);
                      _menhir_env._menhir_error <- true;
                      _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51) : 'freshtv476)
              | _ ->
                  assert (not _menhir_env._menhir_error);
                  _menhir_env._menhir_error <- true;
                  let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : ('freshtv479 * _menhir_state * 'tv_maybe_mytype * Lexing.position) * Lexing.position * (
# 13 "Parser.mly"
       (string)
# 8134 "Parser.ml"
                  ) * Lexing.position) = Obj.magic _menhir_stack in
                  ((let (_menhir_env : _menhir_env) = _menhir_env in
                  let (_menhir_stack : ('freshtv477 * _menhir_state * 'tv_maybe_mytype * Lexing.position) * Lexing.position * (
# 13 "Parser.mly"
       (string)
# 8140 "Parser.ml"
                  ) * Lexing.position) = Obj.magic _menhir_stack in
                  let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                  ((let _menhir_env = _menhir_discard _menhir_env in
                  _menhir_reduce80 _menhir_env (Obj.magic _menhir_stack) _endpos) : 'freshtv478)) : 'freshtv480)) : 'freshtv482)
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_error47 _menhir_env (Obj.magic _menhir_stack))) : 'freshtv484)
    | _ ->
        _menhir_fail ()

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_lbracket ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv461 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_bool ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_char ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_int ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_list ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState5) : 'freshtv462)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv463 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv464)

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce103 _menhir_env (Obj.magic _menhir_stack) _menhir_s _startpos

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce105 _menhir_env (Obj.magic _menhir_stack) _menhir_s _startpos

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce104 _menhir_env (Obj.magic _menhir_stack) _menhir_s _startpos

and _menhir_reduce103 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos__1_ ->
    let _1 = () in
    let _startpos = _startpos__1_ in
    let _v : 'tv_mytype = 
# 200 "Parser.mly"
                                                ( TYPE_int )
# 8206 "Parser.ml"
     in
    _menhir_goto_mytype _menhir_env _menhir_stack _menhir_s _v _startpos

and _menhir_reduce105 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos__1_ ->
    let _1 = () in
    let _startpos = _startpos__1_ in
    let _v : 'tv_mytype = 
# 202 "Parser.mly"
                                                ( TYPE_char )
# 8217 "Parser.ml"
     in
    _menhir_goto_mytype _menhir_env _menhir_stack _menhir_s _v _startpos

and _menhir_reduce104 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos__1_ ->
    let _1 = () in
    let _startpos = _startpos__1_ in
    let _v : 'tv_mytype = 
# 201 "Parser.mly"
                                                ( TYPE_bool )
# 8228 "Parser.ml"
     in
    _menhir_goto_mytype _menhir_env _menhir_stack _menhir_s _v _startpos

and _menhir_reduce102 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_mytype * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (_1 : 'tv_mytype), _startpos__1_) = _menhir_stack in
    let _startpos = _startpos__1_ in
    let _v : 'tv_maybe_mytype = 
# 182 "Parser.mly"
                           ( _1 )
# 8239 "Parser.ml"
     in
    _menhir_goto_maybe_mytype _menhir_env _menhir_stack _menhir_s _v _startpos

and _menhir_goto_same_type_defs : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 84 "Parser.mly"
      (Ast.same_type_defs_properties)
# 8246 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv459 * _menhir_state * (
# 84 "Parser.mly"
      (Ast.same_type_defs_properties)
# 8254 "Parser.ml"
    )) = Obj.magic _menhir_stack in
    ((if _menhir_env._menhir_error then
      _menhir_error34 _menhir_env (Obj.magic _menhir_stack)
    else
      let _tok = _menhir_env._menhir_token in
      match _tok with
      | T_semicolon ->
          let (_menhir_env : _menhir_env) = _menhir_env in
          let (_menhir_stack : 'freshtv457 * _menhir_state * (
# 84 "Parser.mly"
      (Ast.same_type_defs_properties)
# 8266 "Parser.ml"
          )) = Obj.magic _menhir_stack in
          ((let _menhir_env = _menhir_discard _menhir_env in
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_bool ->
              _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_char ->
              _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_int ->
              _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_list ->
              _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_ref ->
              _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | _ ->
              assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState35) : 'freshtv458)
      | T_rparen ->
          _menhir_reduce72 _menhir_env (Obj.magic _menhir_stack)
      | _ ->
          (assert (not _menhir_env._menhir_error);
          _menhir_env._menhir_error <- true;
          _menhir_error34 _menhir_env (Obj.magic _menhir_stack))) : 'freshtv460)

and _menhir_error30 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 8295 "Parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    _menhir_reduce12 _menhir_env (Obj.magic _menhir_stack)

and _menhir_error34 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 84 "Parser.mly"
      (Ast.same_type_defs_properties)
# 8303 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    _menhir_reduce72 _menhir_env (Obj.magic _menhir_stack)

and _menhir_error43 : _menhir_env -> ('ttv_tail * Lexing.position * _menhir_state * Lexing.position) * _menhir_state * (
# 80 "Parser.mly"
      (Ast.header_properties)
# 8311 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv455 * Lexing.position * _menhir_state * Lexing.position) * _menhir_state * (
# 80 "Parser.mly"
      (Ast.header_properties)
# 8318 "Parser.ml"
    )) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv453 * Lexing.position * _menhir_state * Lexing.position) * _menhir_state * (
# 80 "Parser.mly"
      (Ast.header_properties)
# 8326 "Parser.ml"
    )) = Obj.magic _menhir_stack in
    let (_endpos__3_ : Lexing.position) = _endpos in
    ((let ((_menhir_stack, _endpos__1_, _menhir_s, _startpos__1_), _, (_2 : (
# 80 "Parser.mly"
      (Ast.header_properties)
# 8332 "Parser.ml"
    ))) = _menhir_stack in
    let _3 = () in
    let _1 = () in
    let _v : (
# 79 "Parser.mly"
      (Ast.ast_func_def)
# 8339 "Parser.ml"
    ) = let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 109 "Parser.mly"
                               ( missing_colon_error (_startpos, _endpos); raise Terminate )
# 8345 "Parser.ml"
     in
    _menhir_goto_func_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv454)) : 'freshtv456)

and _menhir_reduce81 : _menhir_env -> (('ttv_tail * _menhir_state * 'tv_maybe_mytype * Lexing.position) * Lexing.position * (
# 13 "Parser.mly"
       (string)
# 8352 "Parser.ml"
) * Lexing.position) * Lexing.position -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__4_ _ ->
    let (((_menhir_stack, _menhir_s, (_1 : 'tv_maybe_mytype), _startpos__1_), _endpos__2_, (_2 : (
# 13 "Parser.mly"
       (string)
# 8358 "Parser.ml"
    )), _startpos__2_), _startpos__3_) = _menhir_stack in
    let _4 = () in
    let _3 = () in
    let _v : (
# 80 "Parser.mly"
      (Ast.header_properties)
# 8365 "Parser.ml"
    ) = let _endpos = _endpos__4_ in
    let _startpos = _startpos__1_ in
    
# 117 "Parser.mly"
                                                ( header_definitions_error (_startpos, _endpos); raise Terminate )
# 8371 "Parser.ml"
     in
    _menhir_goto_header _menhir_env _menhir_stack _menhir_s _v

and _menhir_run70 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 8378 "Parser.ml"
) * Lexing.position -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce9 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s

and _menhir_reduce9 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 8387 "Parser.ml"
) * Lexing.position -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__2_ _ ->
    let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 13 "Parser.mly"
       (string)
# 8393 "Parser.ml"
    )), _startpos__1_) = _menhir_stack in
    let _2 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__2_ in
    let _v : 'tv_call = let _endpos = _endpos__2_ in
    let _startpos = _startpos__1_ in
    
# 221 "Parser.mly"
                          ( missing_lparen_call_error (_startpos, _endpos); raise Terminate )
# 8403 "Parser.ml"
     in
    _menhir_goto_call _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce10 : _menhir_env -> ('ttv_tail * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 8410 "Parser.ml"
) * Lexing.position) * _menhir_state * Lexing.position -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__3_ _ ->
    let ((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 13 "Parser.mly"
       (string)
# 8416 "Parser.ml"
    )), _startpos__1_), _, _startpos__2_) = _menhir_stack in
    let _3 = () in
    let _2 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__3_ in
    let _v : 'tv_call = let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 222 "Parser.mly"
                                   ( wrong_function_call (_startpos, _endpos); raise Terminate )
# 8427 "Parser.ml"
     in
    _menhir_goto_call _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce56 : _menhir_env -> ('ttv_tail * _menhir_state * Lexing.position) * _menhir_state * 'tv_mytype * Lexing.position -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__3_ _ ->
    let ((_menhir_stack, _menhir_s, _startpos__1_), _, (_2 : 'tv_mytype), _startpos__2_) = _menhir_stack in
    let _3 = () in
    let _1 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__3_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8441 "Parser.ml"
    ) = let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 289 "Parser.mly"
                                                        ( missing_lbracket_new_error (_startpos, _endpos); raise Terminate )
# 8447 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce28 : _menhir_env -> (('ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8454 "Parser.ml"
) * Lexing.position) * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8458 "Parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8464 "Parser.ml"
    )), _startpos__1_), _, _startpos__10_), _endpos__3_, _, (_3 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8468 "Parser.ml"
    )), _startpos__3_) = _menhir_stack in
    let _10 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__3_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8476 "Parser.ml"
    ) = let _2 =
      let _1 = _10 in
      
# 304 "Parser.mly"
                ( O_plus  )
# 8482 "Parser.ml"
      
    in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 254 "Parser.mly"
                                                        ( { expr_info = E_binary_op (_1, _2, _3); expr_error_pos = (_startpos, _endpos) } )
# 8490 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_error123 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * 'tv_atom * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    _menhir_reduce21 _menhir_env (Obj.magic _menhir_stack)

and _menhir_reduce43 : _menhir_env -> (('ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8501 "Parser.ml"
) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8505 "Parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8511 "Parser.ml"
    )), _startpos__1_), _), _endpos__3_, _, (_3 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8515 "Parser.ml"
    )), _startpos__3_) = _menhir_stack in
    let _10 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__3_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8523 "Parser.ml"
    ) = let _2 =
      let _1 = _10 in
      
# 320 "Parser.mly"
                ( O_or  )
# 8529 "Parser.ml"
      
    in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 280 "Parser.mly"
                                                        ( { expr_info = E_bool_op (_1, _2,  _3); expr_error_pos= (_startpos, _endpos); } )
# 8537 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce34 : _menhir_env -> (('ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8544 "Parser.ml"
) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8548 "Parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8554 "Parser.ml"
    )), _startpos__1_), _), _endpos__3_, _, (_3 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8558 "Parser.ml"
    )), _startpos__3_) = _menhir_stack in
    let _10 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__3_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8566 "Parser.ml"
    ) = let _2 =
      let _1 = _10 in
      
# 312 "Parser.mly"
                  ( O_noteq      )
# 8572 "Parser.ml"
      
    in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 265 "Parser.mly"
                                                        ( { expr_info = E_compare_op (_1, _2, _3); expr_error_pos = (_startpos, _endpos); } )
# 8580 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce29 : _menhir_env -> (('ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8587 "Parser.ml"
) * Lexing.position) * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8591 "Parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8597 "Parser.ml"
    )), _startpos__1_), _, _startpos__10_), _endpos__3_, _, (_3 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8601 "Parser.ml"
    )), _startpos__3_) = _menhir_stack in
    let _10 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__3_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8609 "Parser.ml"
    ) = let _2 =
      let _1 = _10 in
      
# 305 "Parser.mly"
                ( O_minus )
# 8615 "Parser.ml"
      
    in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 254 "Parser.mly"
                                                        ( { expr_info = E_binary_op (_1, _2, _3); expr_error_pos = (_startpos, _endpos) } )
# 8623 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce60 : _menhir_env -> (('ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8630 "Parser.ml"
) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8634 "Parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8640 "Parser.ml"
    )), _startpos__1_), _), _endpos__3_, _, (_3 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8644 "Parser.ml"
    )), _startpos__3_) = _menhir_stack in
    let _2 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__3_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8652 "Parser.ml"
    ) = let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 294 "Parser.mly"
                                                        ( { expr_info = E_hashtag(_1, _3); expr_error_pos = (_startpos, _endpos) } )
# 8658 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce38 : _menhir_env -> (('ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8665 "Parser.ml"
) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8669 "Parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8675 "Parser.ml"
    )), _startpos__1_), _), _endpos__3_, _, (_3 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8679 "Parser.ml"
    )), _startpos__3_) = _menhir_stack in
    let _10 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__3_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8687 "Parser.ml"
    ) = let _2 =
      let _1 = _10 in
      
# 316 "Parser.mly"
                  ( O_lesseq     )
# 8693 "Parser.ml"
      
    in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 265 "Parser.mly"
                                                        ( { expr_info = E_compare_op (_1, _2, _3); expr_error_pos = (_startpos, _endpos); } )
# 8701 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce36 : _menhir_env -> (('ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8708 "Parser.ml"
) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8712 "Parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8718 "Parser.ml"
    )), _startpos__1_), _), _endpos__3_, _, (_3 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8722 "Parser.ml"
    )), _startpos__3_) = _menhir_stack in
    let _10 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__3_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8730 "Parser.ml"
    ) = let _2 =
      let _1 = _10 in
      
# 314 "Parser.mly"
                  ( O_less       )
# 8736 "Parser.ml"
      
    in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 265 "Parser.mly"
                                                        ( { expr_info = E_compare_op (_1, _2, _3); expr_error_pos = (_startpos, _endpos); } )
# 8744 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce37 : _menhir_env -> (('ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8751 "Parser.ml"
) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8755 "Parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8761 "Parser.ml"
    )), _startpos__1_), _), _endpos__3_, _, (_3 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8765 "Parser.ml"
    )), _startpos__3_) = _menhir_stack in
    let _10 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__3_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8773 "Parser.ml"
    ) = let _2 =
      let _1 = _10 in
      
# 315 "Parser.mly"
                  ( O_greatereq  )
# 8779 "Parser.ml"
      
    in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 265 "Parser.mly"
                                                        ( { expr_info = E_compare_op (_1, _2, _3); expr_error_pos = (_startpos, _endpos); } )
# 8787 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce35 : _menhir_env -> (('ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8794 "Parser.ml"
) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8798 "Parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8804 "Parser.ml"
    )), _startpos__1_), _), _endpos__3_, _, (_3 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8808 "Parser.ml"
    )), _startpos__3_) = _menhir_stack in
    let _10 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__3_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8816 "Parser.ml"
    ) = let _2 =
      let _1 = _10 in
      
# 313 "Parser.mly"
                  ( O_greater    )
# 8822 "Parser.ml"
      
    in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 265 "Parser.mly"
                                                        ( { expr_info = E_compare_op (_1, _2, _3); expr_error_pos = (_startpos, _endpos); } )
# 8830 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce33 : _menhir_env -> (('ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8837 "Parser.ml"
) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8841 "Parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8847 "Parser.ml"
    )), _startpos__1_), _), _endpos__3_, _, (_3 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8851 "Parser.ml"
    )), _startpos__3_) = _menhir_stack in
    let _10 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__3_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8859 "Parser.ml"
    ) = let _2 =
      let _1 = _10 in
      
# 311 "Parser.mly"
                  ( O_eq         )
# 8865 "Parser.ml"
      
    in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 265 "Parser.mly"
                                                        ( { expr_info = E_compare_op (_1, _2, _3); expr_error_pos = (_startpos, _endpos); } )
# 8873 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce42 : _menhir_env -> (('ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8880 "Parser.ml"
) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8884 "Parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8890 "Parser.ml"
    )), _startpos__1_), _), _endpos__3_, _, (_3 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8894 "Parser.ml"
    )), _startpos__3_) = _menhir_stack in
    let _10 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__3_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8902 "Parser.ml"
    ) = let _2 =
      let _1 = _10 in
      
# 319 "Parser.mly"
                ( O_and )
# 8908 "Parser.ml"
      
    in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 280 "Parser.mly"
                                                        ( { expr_info = E_bool_op (_1, _2,  _3); expr_error_pos= (_startpos, _endpos); } )
# 8916 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce44 : _menhir_env -> ('ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8923 "Parser.ml"
) * Lexing.position) * _menhir_state * Lexing.position -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__3_ _ ->
    let ((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8929 "Parser.ml"
    )), _startpos__1_), _, _startpos__10_) = _menhir_stack in
    let _3 = () in
    let _10 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__3_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8938 "Parser.ml"
    ) = let _2 =
      let _1 = _10 in
      
# 304 "Parser.mly"
                ( O_plus  )
# 8944 "Parser.ml"
      
    in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 285 "Parser.mly"
                                                        ( invalid_binary_expr_error(_startpos, _endpos); raise Terminate )
# 8952 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce46 : _menhir_env -> ('ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8959 "Parser.ml"
) * Lexing.position) * _menhir_state -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__3_ _ ->
    let ((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8965 "Parser.ml"
    )), _startpos__1_), _) = _menhir_stack in
    let _3 = () in
    let _10 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__3_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8974 "Parser.ml"
    ) = let _2 =
      let _1 = _10 in
      
# 306 "Parser.mly"
                ( O_mul   )
# 8980 "Parser.ml"
      
    in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 285 "Parser.mly"
                                                        ( invalid_binary_expr_error(_startpos, _endpos); raise Terminate )
# 8988 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce6 : _menhir_env -> (('ttv_tail * Lexing.position * _menhir_state * 'tv_atom * Lexing.position)) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 8995 "Parser.ml"
) * Lexing.position -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__4_ _ ->
    let ((_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_atom), _startpos__1_), _endpos__3_, _, (_3 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9001 "Parser.ml"
    )), _startpos__3_) = _menhir_stack in
    let _4 = () in
    let _2 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__4_ in
    let _v : 'tv_atom = let _endpos = _endpos__4_ in
    let _startpos = _startpos__1_ in
    
# 240 "Parser.mly"
                                                        ( missing_rbracket_error (_startpos, _endpos); raise Terminate )
# 9012 "Parser.ml"
     in
    _menhir_goto_atom _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce48 : _menhir_env -> ('ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9019 "Parser.ml"
) * Lexing.position) * _menhir_state -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__3_ _ ->
    let ((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9025 "Parser.ml"
    )), _startpos__1_), _) = _menhir_stack in
    let _3 = () in
    let _10 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__3_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9034 "Parser.ml"
    ) = let _2 =
      let _1 = _10 in
      
# 308 "Parser.mly"
                ( O_mod   )
# 9040 "Parser.ml"
      
    in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 285 "Parser.mly"
                                                        ( invalid_binary_expr_error(_startpos, _endpos); raise Terminate )
# 9048 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce47 : _menhir_env -> ('ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9055 "Parser.ml"
) * Lexing.position) * _menhir_state -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__3_ _ ->
    let ((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9061 "Parser.ml"
    )), _startpos__1_), _) = _menhir_stack in
    let _3 = () in
    let _10 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__3_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9070 "Parser.ml"
    ) = let _2 =
      let _1 = _10 in
      
# 307 "Parser.mly"
                ( O_div   )
# 9076 "Parser.ml"
      
    in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 285 "Parser.mly"
                                                        ( invalid_binary_expr_error(_startpos, _endpos); raise Terminate )
# 9084 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce50 : _menhir_env -> ('ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9091 "Parser.ml"
) * Lexing.position) * _menhir_state -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__3_ _ ->
    let ((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9097 "Parser.ml"
    )), _startpos__1_), _) = _menhir_stack in
    let _3 = () in
    let _10 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__3_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9106 "Parser.ml"
    ) = let _2 =
      let _1 = _10 in
      
# 312 "Parser.mly"
                  ( O_noteq      )
# 9112 "Parser.ml"
      
    in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 286 "Parser.mly"
                                                        ( invalid_cmp_expr_error(_startpos, _endpos); raise Terminate )
# 9120 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce45 : _menhir_env -> ('ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9127 "Parser.ml"
) * Lexing.position) * _menhir_state * Lexing.position -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__3_ _ ->
    let ((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9133 "Parser.ml"
    )), _startpos__1_), _, _startpos__10_) = _menhir_stack in
    let _3 = () in
    let _10 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__3_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9142 "Parser.ml"
    ) = let _2 =
      let _1 = _10 in
      
# 305 "Parser.mly"
                ( O_minus )
# 9148 "Parser.ml"
      
    in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 285 "Parser.mly"
                                                        ( invalid_binary_expr_error(_startpos, _endpos); raise Terminate )
# 9156 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce54 : _menhir_env -> ('ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9163 "Parser.ml"
) * Lexing.position) * _menhir_state -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__3_ _ ->
    let ((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9169 "Parser.ml"
    )), _startpos__1_), _) = _menhir_stack in
    let _3 = () in
    let _10 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__3_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9178 "Parser.ml"
    ) = let _2 =
      let _1 = _10 in
      
# 316 "Parser.mly"
                  ( O_lesseq     )
# 9184 "Parser.ml"
      
    in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 286 "Parser.mly"
                                                        ( invalid_cmp_expr_error(_startpos, _endpos); raise Terminate )
# 9192 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce52 : _menhir_env -> ('ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9199 "Parser.ml"
) * Lexing.position) * _menhir_state -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__3_ _ ->
    let ((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9205 "Parser.ml"
    )), _startpos__1_), _) = _menhir_stack in
    let _3 = () in
    let _10 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__3_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9214 "Parser.ml"
    ) = let _2 =
      let _1 = _10 in
      
# 314 "Parser.mly"
                  ( O_less       )
# 9220 "Parser.ml"
      
    in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 286 "Parser.mly"
                                                        ( invalid_cmp_expr_error(_startpos, _endpos); raise Terminate )
# 9228 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce53 : _menhir_env -> ('ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9235 "Parser.ml"
) * Lexing.position) * _menhir_state -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__3_ _ ->
    let ((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9241 "Parser.ml"
    )), _startpos__1_), _) = _menhir_stack in
    let _3 = () in
    let _10 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__3_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9250 "Parser.ml"
    ) = let _2 =
      let _1 = _10 in
      
# 315 "Parser.mly"
                  ( O_greatereq  )
# 9256 "Parser.ml"
      
    in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 286 "Parser.mly"
                                                        ( invalid_cmp_expr_error(_startpos, _endpos); raise Terminate )
# 9264 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce51 : _menhir_env -> ('ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9271 "Parser.ml"
) * Lexing.position) * _menhir_state -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__3_ _ ->
    let ((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9277 "Parser.ml"
    )), _startpos__1_), _) = _menhir_stack in
    let _3 = () in
    let _10 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__3_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9286 "Parser.ml"
    ) = let _2 =
      let _1 = _10 in
      
# 313 "Parser.mly"
                  ( O_greater    )
# 9292 "Parser.ml"
      
    in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 286 "Parser.mly"
                                                        ( invalid_cmp_expr_error(_startpos, _endpos); raise Terminate )
# 9300 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce49 : _menhir_env -> ('ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9307 "Parser.ml"
) * Lexing.position) * _menhir_state -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__3_ _ ->
    let ((_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9313 "Parser.ml"
    )), _startpos__1_), _) = _menhir_stack in
    let _3 = () in
    let _10 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__3_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9322 "Parser.ml"
    ) = let _2 =
      let _1 = _10 in
      
# 311 "Parser.mly"
                  ( O_eq         )
# 9328 "Parser.ml"
      
    in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 286 "Parser.mly"
                                                        ( invalid_cmp_expr_error(_startpos, _endpos); raise Terminate )
# 9336 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce25 : _menhir_env -> ('ttv_tail * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9343 "Parser.ml"
) * Lexing.position -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__3_ _ ->
    let ((_menhir_stack, _menhir_s, _startpos__1_), _endpos__2_, _, (_2 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9349 "Parser.ml"
    )), _startpos__2_) = _menhir_stack in
    let _3 = () in
    let _1 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__3_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9358 "Parser.ml"
    ) = let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 248 "Parser.mly"
                                                        ( missing_rparen_expr_error (_startpos, _endpos); raise Terminate )
# 9364 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce27 : _menhir_env -> ('ttv_tail * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9371 "Parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let ((_menhir_stack, _menhir_s, _startpos__1_), _endpos__2_, _, (_2 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9377 "Parser.ml"
    )), _startpos__2_) = _menhir_stack in
    let _1 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__2_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9385 "Parser.ml"
    ) = let _endpos = _endpos__2_ in
    let _startpos = _startpos__1_ in
    
# 252 "Parser.mly"
                                                        ( { expr_info = E_unary_op (O_minus, _2); expr_error_pos = (_startpos, _endpos) } )
# 9391 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce57 : _menhir_env -> ((('ttv_tail * _menhir_state * Lexing.position) * _menhir_state * 'tv_mytype * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9398 "Parser.ml"
) * Lexing.position -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos__5_ _ ->
    let ((((_menhir_stack, _menhir_s, _startpos__1_), _, (_2 : 'tv_mytype), _startpos__2_), _), _endpos__4_, _, (_4 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9404 "Parser.ml"
    )), _startpos__4_) = _menhir_stack in
    let _5 = () in
    let _3 = () in
    let _1 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__5_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9414 "Parser.ml"
    ) = let _endpos = _endpos__5_ in
    let _startpos = _startpos__1_ in
    
# 290 "Parser.mly"
                                                        ( missing_rbracket_new_error (_startpos, _endpos); raise Terminate )
# 9420 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce41 : _menhir_env -> ('ttv_tail * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9427 "Parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let ((_menhir_stack, _menhir_s, _startpos__1_), _endpos__2_, _, (_2 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9433 "Parser.ml"
    )), _startpos__2_) = _menhir_stack in
    let _1 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__2_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9441 "Parser.ml"
    ) = let _endpos = _endpos__2_ in
    let _startpos = _startpos__1_ in
    
# 278 "Parser.mly"
                                                        ( { expr_info = E_unary_op (O_not, _2); expr_error_pos = (_startpos, _endpos); } )
# 9447 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce26 : _menhir_env -> ('ttv_tail * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9454 "Parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let ((_menhir_stack, _menhir_s, _startpos__1_), _endpos__2_, _, (_2 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9460 "Parser.ml"
    )), _startpos__2_) = _menhir_stack in
    let _1 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__2_ in
    let _v : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9468 "Parser.ml"
    ) = let _endpos = _endpos__2_ in
    let _startpos = _startpos__1_ in
    
# 251 "Parser.mly"
                                                        ( { expr_info = E_unary_op (O_plus, _2); expr_error_pos = (_startpos, _endpos) }  )
# 9474 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_reduce1 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9481 "Parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9487 "Parser.ml"
    )), _startpos__1_) = _menhir_stack in
    let _v : (
# 98 "Parser.mly"
      (Ast.expr_properties list)
# 9492 "Parser.ml"
    ) = 
# 231 "Parser.mly"
                                                       ( [_1] )
# 9496 "Parser.ml"
     in
    _menhir_goto_actual_params _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_stmt : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 9503 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState277 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv441 * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 9513 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState279
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_exit ->
              _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState279
          | T_for ->
              _menhir_run257 _menhir_env (Obj.magic _menhir_stack) MenhirState279 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_if ->
              _menhir_run252 _menhir_env (Obj.magic _menhir_stack) MenhirState279 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_return ->
              _menhir_run249 _menhir_env (Obj.magic _menhir_stack) MenhirState279 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_skip ->
              _menhir_run248 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState279 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_string _v ->
              _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState279 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_var _v ->
              _menhir_run69 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState279 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_end ->
              _menhir_reduce124 _menhir_env (Obj.magic _menhir_stack) MenhirState279
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState279)) : 'freshtv442)
    | MenhirState312 | MenhirState286 | MenhirState303 | MenhirState296 | MenhirState281 | MenhirState279 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv443 * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 9545 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState281
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_exit ->
              _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState281
          | T_for ->
              _menhir_run257 _menhir_env (Obj.magic _menhir_stack) MenhirState281 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_if ->
              _menhir_run252 _menhir_env (Obj.magic _menhir_stack) MenhirState281 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_return ->
              _menhir_run249 _menhir_env (Obj.magic _menhir_stack) MenhirState281 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_skip ->
              _menhir_run248 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState281 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_string _v ->
              _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState281 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_var _v ->
              _menhir_run69 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState281 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_else | T_elsif | T_end ->
              _menhir_reduce124 _menhir_env (Obj.magic _menhir_stack) MenhirState281
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState281)) : 'freshtv444)
    | MenhirState285 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv445 * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 9577 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState286
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_exit ->
              _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState286
          | T_for ->
              _menhir_run257 _menhir_env (Obj.magic _menhir_stack) MenhirState286 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_if ->
              _menhir_run252 _menhir_env (Obj.magic _menhir_stack) MenhirState286 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_return ->
              _menhir_run249 _menhir_env (Obj.magic _menhir_stack) MenhirState286 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_skip ->
              _menhir_run248 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState286 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_string _v ->
              _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState286 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_var _v ->
              _menhir_run69 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState286 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_else | T_elsif | T_end ->
              _menhir_reduce124 _menhir_env (Obj.magic _menhir_stack) MenhirState286
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState286)) : 'freshtv446)
    | MenhirState295 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv447 * Lexing.position * Lexing.position)) * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 9609 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState296
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_exit ->
              _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState296
          | T_for ->
              _menhir_run257 _menhir_env (Obj.magic _menhir_stack) MenhirState296 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_if ->
              _menhir_run252 _menhir_env (Obj.magic _menhir_stack) MenhirState296 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_return ->
              _menhir_run249 _menhir_env (Obj.magic _menhir_stack) MenhirState296 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_skip ->
              _menhir_run248 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState296 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_string _v ->
              _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState296 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_var _v ->
              _menhir_run69 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState296 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_end ->
              _menhir_reduce124 _menhir_env (Obj.magic _menhir_stack) MenhirState296
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState296)) : 'freshtv448)
    | MenhirState302 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv449 * _menhir_state * 'tv_elif_cond) * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 9641 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState303
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_exit ->
              _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState303
          | T_for ->
              _menhir_run257 _menhir_env (Obj.magic _menhir_stack) MenhirState303 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_if ->
              _menhir_run252 _menhir_env (Obj.magic _menhir_stack) MenhirState303 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_return ->
              _menhir_run249 _menhir_env (Obj.magic _menhir_stack) MenhirState303 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_skip ->
              _menhir_run248 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState303 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_string _v ->
              _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState303 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_var _v ->
              _menhir_run69 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState303 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_else | T_elsif | T_end ->
              _menhir_reduce124 _menhir_env (Obj.magic _menhir_stack) MenhirState303
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState303)) : 'freshtv450)
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv451 * Lexing.position * _menhir_state * Lexing.position) * _menhir_state * (
# 80 "Parser.mly"
      (Ast.header_properties)
# 9673 "Parser.ml"
        ))) * _menhir_state * (
# 81 "Parser.mly"
      (Ast.ast_inside_func_def list)
# 9677 "Parser.ml"
        )) * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 9681 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((if _menhir_env._menhir_error then
          _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState312
        else
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_exit ->
              _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState312
          | T_for ->
              _menhir_run257 _menhir_env (Obj.magic _menhir_stack) MenhirState312 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_if ->
              _menhir_run252 _menhir_env (Obj.magic _menhir_stack) MenhirState312 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_return ->
              _menhir_run249 _menhir_env (Obj.magic _menhir_stack) MenhirState312 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_skip ->
              _menhir_run248 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState312 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_string _v ->
              _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState312 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_var _v ->
              _menhir_run69 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState312 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_end ->
              _menhir_reduce124 _menhir_env (Obj.magic _menhir_stack) MenhirState312
          | _ ->
              (assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState312)) : 'freshtv452)
    | _ ->
        _menhir_fail ()

and _menhir_reduce120 : _menhir_env -> ('ttv_tail * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9714 "Parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let ((_menhir_stack, _menhir_s, _startpos__1_), _endpos__2_, _, (_2 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9720 "Parser.ml"
    )), _startpos__2_) = _menhir_stack in
    let _1 = () in
    let _v : (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 9726 "Parser.ml"
    ) = 
# 132 "Parser.mly"
                              ( S_return (_2) )
# 9730 "Parser.ml"
     in
    _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_if_cond : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_if_cond -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v, _startpos) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv439 * _menhir_state * 'tv_if_cond * Lexing.position) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_exit ->
        _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState285
    | T_for ->
        _menhir_run257 _menhir_env (Obj.magic _menhir_stack) MenhirState285 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_if ->
        _menhir_run252 _menhir_env (Obj.magic _menhir_stack) MenhirState285 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_return ->
        _menhir_run249 _menhir_env (Obj.magic _menhir_stack) MenhirState285 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_skip ->
        _menhir_run248 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState285 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState285 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState285 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState285) : 'freshtv440)

and _menhir_goto_for_head : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_for_head -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv437 * _menhir_state * Lexing.position) * _menhir_state * 'tv_for_head) = Obj.magic _menhir_stack in
    ((if _menhir_env._menhir_error then
      _menhir_error275 _menhir_env (Obj.magic _menhir_stack)
    else
      let _tok = _menhir_env._menhir_token in
      match _tok with
      | T_colon ->
          let (_menhir_env : _menhir_env) = _menhir_env in
          let (_menhir_stack : ('freshtv435 * _menhir_state * Lexing.position) * _menhir_state * 'tv_for_head) = Obj.magic _menhir_stack in
          ((let _menhir_env = _menhir_discard _menhir_env in
          let _tok = _menhir_env._menhir_token in
          match _tok with
          | T_exit ->
              _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState277
          | T_for ->
              _menhir_run257 _menhir_env (Obj.magic _menhir_stack) MenhirState277 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_if ->
              _menhir_run252 _menhir_env (Obj.magic _menhir_stack) MenhirState277 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_return ->
              _menhir_run249 _menhir_env (Obj.magic _menhir_stack) MenhirState277 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_skip ->
              _menhir_run248 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState277 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_string _v ->
              _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState277 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | T_var _v ->
              _menhir_run69 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState277 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
          | _ ->
              assert (not _menhir_env._menhir_error);
              _menhir_env._menhir_error <- true;
              _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState277) : 'freshtv436)
      | _ ->
          (assert (not _menhir_env._menhir_error);
          _menhir_env._menhir_error <- true;
          _menhir_error275 _menhir_env (Obj.magic _menhir_stack))) : 'freshtv438)

and _menhir_reduce64 : _menhir_env -> (((('ttv_tail * _menhir_state * (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 9803 "Parser.ml"
) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9807 "Parser.ml"
) * Lexing.position) * _menhir_state) * _menhir_state * (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 9811 "Parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((((_menhir_stack, _menhir_s, (_1 : (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 9817 "Parser.ml"
    )), _startpos__1_), _), _endpos__3_, _, (_3 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9821 "Parser.ml"
    )), _startpos__3_), _), _, (_5 : (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 9825 "Parser.ml"
    )), _startpos__5_) = _menhir_stack in
    let _4 = () in
    let _2 = () in
    let _v : 'tv_for_head = 
# 142 "Parser.mly"
                                                                 ( (_1, _3, _5) )
# 9832 "Parser.ml"
     in
    _menhir_goto_for_head _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_simple : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 94 "Parser.mly"
      (Ast.simple_properties)
# 9839 "Parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v _startpos ->
    match _menhir_s with
    | MenhirState267 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv425 * _menhir_state * (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 9848 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 94 "Parser.mly"
      (Ast.simple_properties)
# 9854 "Parser.ml"
        )) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv423 * _menhir_state * (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 9861 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : (
# 94 "Parser.mly"
      (Ast.simple_properties)
# 9867 "Parser.ml"
        )) : (
# 94 "Parser.mly"
      (Ast.simple_properties)
# 9871 "Parser.ml"
        )) = _v in
        let (_startpos__3_ : Lexing.position) = _startpos in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 9877 "Parser.ml"
        )), _startpos__1_), _) = _menhir_stack in
        let _2 = () in
        let _startpos = _startpos__1_ in
        let _v : (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 9884 "Parser.ml"
        ) = 
# 217 "Parser.mly"
                                                        ( _3 :: _1 )
# 9888 "Parser.ml"
         in
        _menhir_goto_simple_list _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv424)) : 'freshtv426)
    | MenhirState257 | MenhirState264 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv429) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 94 "Parser.mly"
      (Ast.simple_properties)
# 9898 "Parser.ml"
        )) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv427) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 94 "Parser.mly"
      (Ast.simple_properties)
# 9907 "Parser.ml"
        )) : (
# 94 "Parser.mly"
      (Ast.simple_properties)
# 9911 "Parser.ml"
        )) = _v in
        let (_startpos__1_ : Lexing.position) = _startpos in
        ((let _startpos = _startpos__1_ in
        let _v : (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 9918 "Parser.ml"
        ) = 
# 216 "Parser.mly"
                                                        ( [_1] )
# 9922 "Parser.ml"
         in
        _menhir_goto_simple_list _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv428)) : 'freshtv430)
    | MenhirState68 | MenhirState312 | MenhirState277 | MenhirState279 | MenhirState285 | MenhirState286 | MenhirState302 | MenhirState303 | MenhirState295 | MenhirState296 | MenhirState281 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv433) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 94 "Parser.mly"
      (Ast.simple_properties)
# 9932 "Parser.ml"
        )) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv431) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 94 "Parser.mly"
      (Ast.simple_properties)
# 9941 "Parser.ml"
        )) : (
# 94 "Parser.mly"
      (Ast.simple_properties)
# 9945 "Parser.ml"
        )) = _v in
        let (_startpos__1_ : Lexing.position) = _startpos in
        ((let _v : (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 9951 "Parser.ml"
        ) = 
# 130 "Parser.mly"
                              ( S_simple (_1) )
# 9955 "Parser.ml"
         in
        _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv432)) : 'freshtv434)
    | _ ->
        _menhir_fail ()

and _menhir_reduce113 : _menhir_env -> (('ttv_tail * Lexing.position * _menhir_state * 'tv_atom * Lexing.position)) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9964 "Parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let ((_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_atom), _startpos__1_), _endpos__3_, _, (_3 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 9970 "Parser.ml"
    )), _startpos__3_) = _menhir_stack in
    let _2 = () in
    let _startpos = _startpos__1_ in
    let _v : (
# 94 "Parser.mly"
      (Ast.simple_properties)
# 9977 "Parser.ml"
    ) = let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 212 "Parser.mly"
                                      ( { simple_info = Simple_assignment(_1, _3); simple_error_pos = (_startpos, _endpos) } )
# 9983 "Parser.ml"
     in
    _menhir_goto_simple _menhir_env _menhir_stack _menhir_s _v _startpos

and _menhir_error275 : _menhir_env -> ('ttv_tail * _menhir_state * Lexing.position) * _menhir_state * 'tv_for_head -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv421 * _menhir_state * Lexing.position) * _menhir_state * 'tv_for_head) = Obj.magic _menhir_stack in
    let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv419 * _menhir_state * Lexing.position) * _menhir_state * 'tv_for_head) = Obj.magic _menhir_stack in
    let (_endpos__3_ : Lexing.position) = _endpos in
    ((let ((_menhir_stack, _menhir_s, _startpos__1_), _, (_2 : 'tv_for_head)) = _menhir_stack in
    let _3 = () in
    let _1 = () in
    let _v : 'tv_for_whole = let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    
# 138 "Parser.mly"
                                                    ( missing_colon_after_for_error (_startpos, _endpos); raise Terminate )
# 10004 "Parser.ml"
     in
    _menhir_goto_for_whole _menhir_env _menhir_stack _menhir_s _v) : 'freshtv420)) : 'freshtv422)

and _menhir_reduce95 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_maybe_elif = 
# 162 "Parser.mly"
                         ( None )
# 10013 "Parser.ml"
     in
    _menhir_goto_maybe_elif _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_elif_cond : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_elif_cond -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv417 * _menhir_state * 'tv_elif_cond) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_exit ->
        _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState302
    | T_for ->
        _menhir_run257 _menhir_env (Obj.magic _menhir_stack) MenhirState302 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_if ->
        _menhir_run252 _menhir_env (Obj.magic _menhir_stack) MenhirState302 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_return ->
        _menhir_run249 _menhir_env (Obj.magic _menhir_stack) MenhirState302 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_skip ->
        _menhir_run248 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState302 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_string _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState302 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _v ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState302 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState302) : 'freshtv418)

and _menhir_error294 : _menhir_env -> 'ttv_tail * Lexing.position * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    _menhir_reduce20 _menhir_env (Obj.magic _menhir_stack)

and _menhir_reduce17 : _menhir_env -> (('ttv_tail * _menhir_state * 'tv_elif_cond) * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 10051 "Parser.ml"
)) * _menhir_state * (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 10055 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((_menhir_stack, _menhir_s, (_1 : 'tv_elif_cond)), _, (_2 : (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 10061 "Parser.ml"
    ))), _, (_3 : (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 10065 "Parser.ml"
    ))) = _menhir_stack in
    let _v : 'tv_elif_whole = 
# 172 "Parser.mly"
                                       ( [(_1, _2 :: _3)]  )
# 10070 "Parser.ml"
     in
    _menhir_goto_elif_whole _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce124 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 10079 "Parser.ml"
    ) = 
# 127 "Parser.mly"
                              ( [] )
# 10083 "Parser.ml"
     in
    _menhir_goto_stmt_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce101 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let (_, _startpos) = Obj.magic _menhir_stack in
    let _v : 'tv_maybe_mytype = 
# 181 "Parser.mly"
                           ( TYPE_none )
# 10093 "Parser.ml"
     in
    _menhir_goto_maybe_mytype _menhir_env _menhir_stack _menhir_s _v _startpos

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_lbracket ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv413 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_bool ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_char ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_int ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | T_list ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3) : 'freshtv414)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv415 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv416)

and _menhir_run15 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce103 _menhir_env (Obj.magic _menhir_stack) _menhir_s _startpos

and _menhir_run16 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce105 _menhir_env (Obj.magic _menhir_stack) _menhir_s _startpos

and _menhir_run17 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce104 _menhir_env (Obj.magic _menhir_stack) _menhir_s _startpos

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState312 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv3 * Lexing.position * _menhir_state * Lexing.position) * _menhir_state * (
# 80 "Parser.mly"
      (Ast.header_properties)
# 10152 "Parser.ml"
        ))) * _menhir_state * (
# 81 "Parser.mly"
      (Ast.ast_inside_func_def list)
# 10156 "Parser.ml"
        )) * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 10160 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        (_menhir_reduce124 _menhir_env (Obj.magic _menhir_stack) MenhirState312 : 'freshtv4)
    | MenhirState304 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv5 * _menhir_state * 'tv_elif_cond) * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 10168 "Parser.ml"
        )) * _menhir_state * (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 10172 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        (_menhir_reduce17 _menhir_env (Obj.magic _menhir_stack) : 'freshtv6)
    | MenhirState303 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv7 * _menhir_state * 'tv_elif_cond) * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 10180 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        (_menhir_reduce124 _menhir_env (Obj.magic _menhir_stack) MenhirState303 : 'freshtv8)
    | MenhirState302 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv9 * _menhir_state * 'tv_elif_cond) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv10)
    | MenhirState296 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv11 * Lexing.position * Lexing.position)) * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 10193 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        (_menhir_reduce124 _menhir_env (Obj.magic _menhir_stack) MenhirState296 : 'freshtv12)
    | MenhirState295 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv13 * Lexing.position * Lexing.position)) = Obj.magic _menhir_stack in
        (_menhir_error294 _menhir_env (Obj.magic _menhir_stack) : 'freshtv14)
    | MenhirState290 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv19 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10205 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv17 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10211 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState290 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv15 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10220 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos__3_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        ((let ((_menhir_stack, _menhir_s, _startpos__1_), _endpos__2_, _, (_2 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10227 "Parser.ml"
        )), _startpos__2_) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_elif_cond = let _endpos = _endpos__3_ in
        let _startpos = _startpos__1_ in
        
# 177 "Parser.mly"
                                   ( missing_colon_after_elsif_error (_startpos, _endpos); raise Terminate )
# 10236 "Parser.ml"
         in
        _menhir_goto_elif_cond _menhir_env _menhir_stack _menhir_s _v) : 'freshtv16)) : 'freshtv18)) : 'freshtv20)
    | MenhirState288 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv25 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv23 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState288 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv21 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos__2_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_elif_cond = let _endpos = _endpos__2_ in
        let _startpos = _startpos__1_ in
        
# 176 "Parser.mly"
                                   ( expr_after_elsif_error (_startpos, _endpos); raise Terminate )
# 10259 "Parser.ml"
         in
        _menhir_goto_elif_cond _menhir_env _menhir_stack _menhir_s _v) : 'freshtv22)) : 'freshtv24)) : 'freshtv26)
    | MenhirState287 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv27 * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 10267 "Parser.ml"
        )) * _menhir_state * (
# 91 "Parser.mly"
      (Ast.ast_stmt list)
# 10271 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        (_menhir_reduce95 _menhir_env (Obj.magic _menhir_stack) MenhirState287 : 'freshtv28)
    | MenhirState286 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv29 * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 10279 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        (_menhir_reduce124 _menhir_env (Obj.magic _menhir_stack) MenhirState286 : 'freshtv30)
    | MenhirState285 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv31 * _menhir_state * 'tv_if_cond * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState281 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv33 * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 10292 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        (_menhir_reduce124 _menhir_env (Obj.magic _menhir_stack) MenhirState281 : 'freshtv34)
    | MenhirState279 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv35 * _menhir_state * (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 10300 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        (_menhir_reduce124 _menhir_env (Obj.magic _menhir_stack) MenhirState279 : 'freshtv36)
    | MenhirState277 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv37 * _menhir_state * Lexing.position) * _menhir_state * 'tv_for_head)) = Obj.magic _menhir_stack in
        (_menhir_error275 _menhir_env (Obj.magic _menhir_stack) : 'freshtv38)
    | MenhirState273 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv39 * Lexing.position * _menhir_state * 'tv_atom * Lexing.position)) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10312 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce113 _menhir_env (Obj.magic _menhir_stack) : 'freshtv40)
    | MenhirState271 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv45 * Lexing.position * _menhir_state * 'tv_atom * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv43 * Lexing.position * _menhir_state * 'tv_atom * Lexing.position)) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState271 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv41 * Lexing.position * _menhir_state * 'tv_atom * Lexing.position)) = Obj.magic _menhir_stack in
        let (_endpos__3_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _endpos__1_, _menhir_s, (_1 : 'tv_atom), _startpos__1_) = _menhir_stack in
        let _3 = () in
        let _2 = () in
        let _startpos = _startpos__1_ in
        let _v : (
# 94 "Parser.mly"
      (Ast.simple_properties)
# 10334 "Parser.ml"
        ) = let _endpos = _endpos__3_ in
        let _startpos = _startpos__1_ in
        
# 213 "Parser.mly"
                                      (  syntax_assignment_error (_startpos, _endpos); raise Terminate )
# 10340 "Parser.ml"
         in
        _menhir_goto_simple _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv42)) : 'freshtv44)) : 'freshtv46)
    | MenhirState267 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv47 * _menhir_state * (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 10348 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState266 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv49 * _menhir_state * (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 10357 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10361 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * _menhir_state * (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 10365 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce64 _menhir_env (Obj.magic _menhir_stack) : 'freshtv50)
    | MenhirState264 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv55 * _menhir_state * (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 10373 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10377 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv53 * _menhir_state * (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 10383 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10387 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState264 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv51 * _menhir_state * (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 10396 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10400 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        let (_endpos__5_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        ((let ((((_menhir_stack, _menhir_s, (_1 : (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 10407 "Parser.ml"
        )), _startpos__1_), _), _endpos__3_, _, (_3 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10411 "Parser.ml"
        )), _startpos__3_), _) = _menhir_stack in
        let _5 = () in
        let _4 = () in
        let _2 = () in
        let _v : 'tv_for_head = let _endpos = _endpos__5_ in
        let _startpos = _startpos__1_ in
        
# 146 "Parser.mly"
                                                           ( simple_after_for_cond_error (_startpos, _endpos); raise Terminate )
# 10421 "Parser.ml"
         in
        _menhir_goto_for_head _menhir_env _menhir_stack _menhir_s _v) : 'freshtv52)) : 'freshtv54)) : 'freshtv56)
    | MenhirState262 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv61 * _menhir_state * (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 10429 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10433 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv59 * _menhir_state * (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 10439 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10443 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState262 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv57 * _menhir_state * (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 10452 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10456 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos__4_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 10463 "Parser.ml"
        )), _startpos__1_), _), _endpos__3_, _, (_3 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10467 "Parser.ml"
        )), _startpos__3_) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _v : 'tv_for_head = let _endpos = _endpos__4_ in
        let _startpos = _startpos__1_ in
        
# 145 "Parser.mly"
                                               ( missing_semic_after_for_cond_error (_startpos, _endpos); raise Terminate )
# 10476 "Parser.ml"
         in
        _menhir_goto_for_head _menhir_env _menhir_stack _menhir_s _v) : 'freshtv58)) : 'freshtv60)) : 'freshtv62)
    | MenhirState260 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv67 * _menhir_state * (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 10484 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv65 * _menhir_state * (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 10490 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState260 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv63 * _menhir_state * (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 10499 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        let (_endpos__3_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 10506 "Parser.ml"
        )), _startpos__1_), _) = _menhir_stack in
        let _3 = () in
        let _2 = () in
        let _v : 'tv_for_head = let _endpos = _endpos__3_ in
        let _startpos = _startpos__1_ in
        
# 144 "Parser.mly"
                                          ( expr_after_for_error (_startpos, _endpos); raise Terminate )
# 10515 "Parser.ml"
         in
        _menhir_goto_for_head _menhir_env _menhir_stack _menhir_s _v) : 'freshtv64)) : 'freshtv66)) : 'freshtv68)
    | MenhirState258 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv73 * _menhir_state * (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 10523 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv71 * _menhir_state * (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 10529 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState258 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv69 * _menhir_state * (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 10538 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos__2_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 95 "Parser.mly"
      (Ast.simple_properties list)
# 10545 "Parser.ml"
        )), _startpos__1_) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_for_head = let _endpos = _endpos__2_ in
        let _startpos = _startpos__1_ in
        
# 143 "Parser.mly"
                              ( missing_semic_after_for_error (_startpos, _endpos); raise Terminate )
# 10553 "Parser.ml"
         in
        _menhir_goto_for_head _menhir_env _menhir_stack _menhir_s _v) : 'freshtv70)) : 'freshtv72)) : 'freshtv74)
    | MenhirState257 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv75 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState254 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv81 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10566 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv79 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10572 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState254 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv77 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10581 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos__3_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        ((let ((_menhir_stack, _menhir_s, _startpos__1_), _endpos__2_, _, (_2 : (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10588 "Parser.ml"
        )), _startpos__2_) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _startpos = _startpos__1_ in
        let _v : 'tv_if_cond = let _endpos = _endpos__3_ in
        let _startpos = _startpos__1_ in
        
# 157 "Parser.mly"
                                 ( missing_colon_after_if_expr_error (_startpos, _endpos); raise Terminate )
# 10598 "Parser.ml"
         in
        _menhir_goto_if_cond _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv78)) : 'freshtv80)) : 'freshtv82)
    | MenhirState252 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv87 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv85 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState252 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv83 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos__2_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _startpos = _startpos__1_ in
        let _v : 'tv_if_cond = let _endpos = _endpos__2_ in
        let _startpos = _startpos__1_ in
        
# 156 "Parser.mly"
                                 ( expr_after_if_error (_startpos, _endpos); raise Terminate )
# 10622 "Parser.ml"
         in
        _menhir_goto_if_cond _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv84)) : 'freshtv86)) : 'freshtv88)
    | MenhirState251 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv89 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10630 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce120 _menhir_env (Obj.magic _menhir_stack) : 'freshtv90)
    | MenhirState249 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv95 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv93 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState249 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv91 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos__2_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : (
# 92 "Parser.mly"
      (Ast.ast_stmt)
# 10651 "Parser.ml"
        ) = let _endpos = _endpos__2_ in
        let _startpos = _startpos__1_ in
        
# 133 "Parser.mly"
                              ( missing_return_expr (_startpos, _endpos); raise Terminate )
# 10657 "Parser.ml"
         in
        _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv92)) : 'freshtv94)) : 'freshtv96)
    | MenhirState243 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv97 * _menhir_state * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10665 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)
    | MenhirState240 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv99 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10674 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)
    | MenhirState239 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv101 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10683 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce1 _menhir_env (Obj.magic _menhir_stack) : 'freshtv102)
    | MenhirState235 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv103 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10691 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce26 _menhir_env (Obj.magic _menhir_stack) : 'freshtv104)
    | MenhirState234 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv105 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10699 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce41 _menhir_env (Obj.magic _menhir_stack) : 'freshtv106)
    | MenhirState232 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv107 * _menhir_state * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10707 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)
    | MenhirState230 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv109 * _menhir_state * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10716 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)
    | MenhirState229 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv111 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10725 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv112)
    | MenhirState228 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv113 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10734 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)
    | MenhirState226 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv115 * _menhir_state * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10743 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)
    | MenhirState223 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv119 * _menhir_state * Lexing.position) * _menhir_state * 'tv_mytype * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10752 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv117 * _menhir_state * Lexing.position) * _menhir_state * 'tv_mytype * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10758 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState223 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce57 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv118)) : 'freshtv120)
    | MenhirState220 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv123 * _menhir_state * Lexing.position) * _menhir_state * 'tv_mytype * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10769 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv121 * _menhir_state * Lexing.position) * _menhir_state * 'tv_mytype * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10775 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState220 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce57 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv122)) : 'freshtv124)
    | MenhirState219 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv125 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10786 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce27 _menhir_env (Obj.magic _menhir_stack) : 'freshtv126)
    | MenhirState216 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv129 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10794 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv127 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10800 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState216 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce25 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv128)) : 'freshtv130)
    | MenhirState214 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv131 * _menhir_state * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10811 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)
    | MenhirState213 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv133 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10820 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)
    | MenhirState212 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv135 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10829 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10833 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv136)
    | MenhirState211 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv137 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10842 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)
    | MenhirState210 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv139 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10851 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10855 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv140)
    | MenhirState208 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv143 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10864 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv141 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10870 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState208 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce49 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv142)) : 'freshtv144)
    | MenhirState207 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv145 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10881 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10885 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)
    | MenhirState205 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv149 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10894 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv147 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10900 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState205 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce51 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv148)) : 'freshtv150)
    | MenhirState204 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv151 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10911 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10915 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv152)
    | MenhirState202 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv155 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10924 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv153 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10930 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState202 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce53 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv154)) : 'freshtv156)
    | MenhirState201 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv157 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10941 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10945 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv158)
    | MenhirState199 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv161 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10954 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv159 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10960 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState199 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce52 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv160)) : 'freshtv162)
    | MenhirState198 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv163 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10971 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10975 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)
    | MenhirState196 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv167 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10984 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv165 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 10990 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState196 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce54 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv166)) : 'freshtv168)
    | MenhirState195 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv169 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11001 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11005 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv170)
    | MenhirState194 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv171 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11014 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv172)
    | MenhirState193 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv173 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11023 "Parser.ml"
        ) * Lexing.position) * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11027 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv174)
    | MenhirState191 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv177 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11036 "Parser.ml"
        ) * Lexing.position) * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv175 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11042 "Parser.ml"
        ) * Lexing.position) * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState191 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce45 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv176)) : 'freshtv178)
    | MenhirState190 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv179 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11053 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11057 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv180)
    | MenhirState188 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv183 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11066 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv181 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11072 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState188 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce50 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv182)) : 'freshtv184)
    | MenhirState187 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv185 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11083 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11087 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv186)
    | MenhirState186 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv187 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11096 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv188)
    | MenhirState183 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv191 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11105 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv189 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11111 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState183 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce47 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv190)) : 'freshtv192)
    | MenhirState180 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv195 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11122 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv193 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11128 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState180 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce48 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv194)) : 'freshtv196)
    | MenhirState177 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv199 * Lexing.position * _menhir_state * 'tv_atom * Lexing.position)) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11139 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv197 * Lexing.position * _menhir_state * 'tv_atom * Lexing.position)) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11145 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState177 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce6 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv198)) : 'freshtv200)
    | MenhirState176 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv201 * Lexing.position * _menhir_state * 'tv_atom * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv202)
    | MenhirState171 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv205 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11161 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv203 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11167 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState171 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce46 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv204)) : 'freshtv206)
    | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv207 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11178 "Parser.ml"
        ) * Lexing.position) * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11182 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv208)
    | MenhirState168 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv211 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11191 "Parser.ml"
        ) * Lexing.position) * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv209 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11197 "Parser.ml"
        ) * Lexing.position) * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState168 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce44 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv210)) : 'freshtv212)
    | MenhirState166 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv213 * _menhir_state * Lexing.position) * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11208 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv214)
    | MenhirState162 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv215 * _menhir_state * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv216)
    | MenhirState160 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv217 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11222 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11226 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce42 _menhir_env (Obj.magic _menhir_stack) : 'freshtv218)
    | MenhirState159 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv219 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11234 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv220)
    | MenhirState158 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv221 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11243 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11247 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce33 _menhir_env (Obj.magic _menhir_stack) : 'freshtv222)
    | MenhirState156 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv225 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11255 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv223 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11261 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState156 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce49 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv224)) : 'freshtv226)
    | MenhirState155 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv227 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11272 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11276 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce35 _menhir_env (Obj.magic _menhir_stack) : 'freshtv228)
    | MenhirState153 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv231 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11284 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv229 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11290 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState153 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce51 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv230)) : 'freshtv232)
    | MenhirState152 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv233 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11301 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11305 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce37 _menhir_env (Obj.magic _menhir_stack) : 'freshtv234)
    | MenhirState150 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv237 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11313 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv235 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11319 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState150 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce53 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv236)) : 'freshtv238)
    | MenhirState149 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv239 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11330 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11334 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce36 _menhir_env (Obj.magic _menhir_stack) : 'freshtv240)
    | MenhirState147 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv243 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11342 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv241 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11348 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState147 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce52 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv242)) : 'freshtv244)
    | MenhirState146 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv245 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11359 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11363 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce38 _menhir_env (Obj.magic _menhir_stack) : 'freshtv246)
    | MenhirState144 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv249 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11371 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv247 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11377 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState144 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce54 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv248)) : 'freshtv250)
    | MenhirState143 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv251 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11388 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11392 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce60 _menhir_env (Obj.magic _menhir_stack) : 'freshtv252)
    | MenhirState142 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv253 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11400 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv254)
    | MenhirState139 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv257 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11409 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv255 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11415 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState139 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce47 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv256)) : 'freshtv258)
    | MenhirState138 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv259 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11426 "Parser.ml"
        ) * Lexing.position) * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11430 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce29 _menhir_env (Obj.magic _menhir_stack) : 'freshtv260)
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv263 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11438 "Parser.ml"
        ) * Lexing.position) * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv261 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11444 "Parser.ml"
        ) * Lexing.position) * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState136 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce45 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv262)) : 'freshtv264)
    | MenhirState133 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv267 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11455 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv265 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11461 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState133 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce48 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv266)) : 'freshtv268)
    | MenhirState132 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv269 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11472 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11476 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce34 _menhir_env (Obj.magic _menhir_stack) : 'freshtv270)
    | MenhirState130 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv273 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11484 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv271 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11490 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState130 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce50 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv272)) : 'freshtv274)
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv275 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11501 "Parser.ml"
        ) * Lexing.position) * _menhir_state) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11505 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce43 _menhir_env (Obj.magic _menhir_stack) : 'freshtv276)
    | MenhirState128 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv277 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11513 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv278)
    | MenhirState125 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv281 * Lexing.position * _menhir_state * 'tv_atom * Lexing.position)) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11522 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv279 * Lexing.position * _menhir_state * 'tv_atom * Lexing.position)) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11528 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState125 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce6 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv280)) : 'freshtv282)
    | MenhirState124 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv283 * Lexing.position * _menhir_state * 'tv_atom * Lexing.position)) = Obj.magic _menhir_stack in
        (_menhir_error123 _menhir_env (Obj.magic _menhir_stack) : 'freshtv284)
    | MenhirState119 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv287 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11543 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv285 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11549 "Parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState119 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce46 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv286)) : 'freshtv288)
    | MenhirState118 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv289 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11560 "Parser.ml"
        ) * Lexing.position) * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11564 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce28 _menhir_env (Obj.magic _menhir_stack) : 'freshtv290)
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv293 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11572 "Parser.ml"
        ) * Lexing.position) * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv291 * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11578 "Parser.ml"
        ) * Lexing.position) * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState116 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce44 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv292)) : 'freshtv294)
    | MenhirState113 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv297 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11589 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv295 * _menhir_state * Lexing.position) * Lexing.position * _menhir_state * (
# 96 "Parser.mly"
      (Ast.expr_properties)
# 11595 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState113 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce25 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv296)) : 'freshtv298)
    | MenhirState109 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv299 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv300)
    | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv301 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv302)
    | MenhirState107 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv303 * _menhir_state * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv304)
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv305 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv306)
    | MenhirState104 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv307 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv308)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv309 * _menhir_state * Lexing.position) * _menhir_state * 'tv_mytype * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv310)
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv313 * _menhir_state * Lexing.position) * _menhir_state * 'tv_mytype * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv311 * _menhir_state * Lexing.position) * _menhir_state * 'tv_mytype * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState101 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce56 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv312)) : 'freshtv314)
    | MenhirState100 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv315 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv316)
    | MenhirState98 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv317 * _menhir_state * Lexing.position) * _menhir_state * 'tv_mytype * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv318)
    | MenhirState96 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv321 * _menhir_state * Lexing.position) * _menhir_state * 'tv_mytype * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv319 * _menhir_state * Lexing.position) * _menhir_state * 'tv_mytype * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState96 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce56 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv320)) : 'freshtv322)
    | MenhirState95 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv323 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv324)
    | MenhirState93 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv325 * _menhir_state * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv326)
    | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv327 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv328)
    | MenhirState90 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv329 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv330)
    | MenhirState88 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv331 * _menhir_state * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv332)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv333 * _menhir_state * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv334)
    | MenhirState83 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv335 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv336)
    | MenhirState82 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv337 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv338)
    | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv341 * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 11704 "Parser.ml"
        ) * Lexing.position) * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv339 * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 11710 "Parser.ml"
        ) * Lexing.position) * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState79 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce10 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv340)) : 'freshtv342)
    | MenhirState77 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv345 * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 11721 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv343 * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 11727 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState77 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce9 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv344)) : 'freshtv346)
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv347 * _menhir_state * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv348)
    | MenhirState73 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv349 * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 11743 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState73 : 'freshtv350)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv353 * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 11751 "Parser.ml"
        ) * Lexing.position) * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv351 * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 11757 "Parser.ml"
        ) * Lexing.position) * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState71 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce10 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv352)) : 'freshtv354)
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv355 * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 11768 "Parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_run70 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState69 : 'freshtv356)
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv357 * Lexing.position * _menhir_state * Lexing.position) * _menhir_state * (
# 80 "Parser.mly"
      (Ast.header_properties)
# 11776 "Parser.ml"
        ))) * _menhir_state * (
# 81 "Parser.mly"
      (Ast.ast_inside_func_def list)
# 11780 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv358)
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv359 * _menhir_state * (
# 87 "Parser.mly"
      (Ast.ast_func_decl)
# 11789 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv360)
    | MenhirState64 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv361 * _menhir_state * (
# 79 "Parser.mly"
      (Ast.ast_func_def)
# 11798 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv362)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv363 * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 11807 "Parser.ml"
        ) * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv364)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv365 * _menhir_state * 'tv_mytype * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv366)
    | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv367 * _menhir_state * (
# 89 "Parser.mly"
      (Ast.var_decl_properties)
# 11821 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv368)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv371 * _menhir_state * 'tv_maybe_mytype * Lexing.position) * Lexing.position * (
# 13 "Parser.mly"
       (string)
# 11830 "Parser.ml"
        ) * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv369 * _menhir_state * 'tv_maybe_mytype * Lexing.position) * Lexing.position * (
# 13 "Parser.mly"
       (string)
# 11836 "Parser.ml"
        ) * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState51 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce81 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv370)) : 'freshtv372)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv373 * Lexing.position * _menhir_state) = Obj.magic _menhir_stack in
        (_menhir_reduce101 _menhir_env (Obj.magic _menhir_stack) MenhirState46 : 'freshtv374)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv375 * Lexing.position * _menhir_state * Lexing.position) * _menhir_state * (
# 80 "Parser.mly"
      (Ast.header_properties)
# 11851 "Parser.ml"
        ))) = Obj.magic _menhir_stack in
        (_menhir_error43 _menhir_env (Obj.magic _menhir_stack) : 'freshtv376)
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv377 * _menhir_state * 'tv_mytype * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv378)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv379 * _menhir_state * (
# 84 "Parser.mly"
      (Ast.same_type_defs_properties)
# 11864 "Parser.ml"
        ))) = Obj.magic _menhir_stack in
        (_menhir_error34 _menhir_env (Obj.magic _menhir_stack) : 'freshtv380)
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv381 * Lexing.position * _menhir_state * (
# 13 "Parser.mly"
       (string)
# 11872 "Parser.ml"
        ) * Lexing.position)) = Obj.magic _menhir_stack in
        (_menhir_error30 _menhir_env (Obj.magic _menhir_stack) : 'freshtv382)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv383 * _menhir_state * Lexing.position) * _menhir_state * 'tv_mytype * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv384)
    | MenhirState27 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv389 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv387 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState27 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv385 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos__2_ : Lexing.position) = _endpos in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : (
# 84 "Parser.mly"
      (Ast.same_type_defs_properties)
# 11898 "Parser.ml"
        ) = let _endpos = _endpos__2_ in
        let _startpos = _startpos__1_ in
        
# 192 "Parser.mly"
                                     ( missing_type_error (_startpos, _endpos); raise Terminate )
# 11904 "Parser.ml"
         in
        _menhir_goto_same_type_defs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv386)) : 'freshtv388)) : 'freshtv390)
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv393 * _menhir_state * 'tv_maybe_mytype * Lexing.position) * Lexing.position * (
# 13 "Parser.mly"
       (string)
# 11912 "Parser.ml"
        ) * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv391 * _menhir_state * 'tv_maybe_mytype * Lexing.position) * Lexing.position * (
# 13 "Parser.mly"
       (string)
# 11918 "Parser.ml"
        ) * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
        let (_endpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let (_menhir_s : _menhir_state) = MenhirState25 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce81 _menhir_env (Obj.magic _menhir_stack) _endpos _menhir_s) : 'freshtv392)) : 'freshtv394)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv395 * _menhir_state * 'tv_mytype * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv396)
    | MenhirState18 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv397 * _menhir_state * 'tv_mytype * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce102 _menhir_env (Obj.magic _menhir_stack) : 'freshtv398)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv399 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_mytype * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv400)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv401 * _menhir_state * 'tv_mytype * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv402)
    | MenhirState9 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv403 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_mytype * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv404)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv405 * _menhir_state * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv406)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv407 * _menhir_state * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv408)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv409 * Lexing.position * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        (_menhir_reduce101 _menhir_env (Obj.magic _menhir_stack) MenhirState1 : 'freshtv410)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv411) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv412)

and _menhir_run1 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_bool ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_char ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_int ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_list ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | T_var _ ->
        _menhir_reduce101 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState1

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and program : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 78 "Parser.mly"
      (Ast.ast_program)
# 12003 "Parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env =
      let (lexer : Lexing.lexbuf -> token) = lexer in
      let (lexbuf : Lexing.lexbuf) = lexbuf in
      ((let _tok = Obj.magic () in
      {
        _menhir_lexer = lexer;
        _menhir_lexbuf = lexbuf;
        _menhir_token = _tok;
        _menhir_error = false;
      }) : _menhir_env)
    in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_def ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState0 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv2))

# 322 "Parser.mly"
  

# 12032 "Parser.ml"

# 219 "/usr/share/menhir/standard.mly"
  


# 12038 "Parser.ml"
