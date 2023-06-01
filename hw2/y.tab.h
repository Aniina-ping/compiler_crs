#ifndef _yy_defines_h_
#define _yy_defines_h_

#define INTVAL 257
#define DBVAL 258
#define CHR 259
#define STR 260
#define ID 261
#define MACROS 262
#define LSHIFT 263
#define RSHIFT 264
#define AA 265
#define MM 266
#define LEQ 267
#define GEQ 268
#define EQEQ 269
#define NEQ 270
#define ANDAND 271
#define OROR 272
#define COMMAS 273
#define SMCOL 274
#define FOR 275
#define DO 276
#define WHILE 277
#define BREAK 278
#define CONTINUE 279
#define IF 280
#define ELSE 281
#define RETURN 282
#define STRUCT 283
#define CASE 284
#define SWITCH 285
#define DEFAULT 286
#define VOID 287
#define TYPE 288
#define FunDec 289
#define FuncDef 290
#define FuncDec 291
#ifdef YYSTYPE
#undef  YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
#endif
#ifndef YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
typedef union YYSTYPE{
    int intVal; /* define integer*/
    char* chVal; /* define char*/
    double dbVal; /* define double*/
} YYSTYPE;
#endif /* !YYSTYPE_IS_DECLARED */
extern YYSTYPE yylval;

#endif /* _yy_defines_h_ */
