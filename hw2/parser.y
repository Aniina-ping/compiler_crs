%{
    #include<stdio.h>   
    #include<stdlib.h>
    #include<string.h>
    int yylex();
    int yyerror(char *s);
    char decl_head[1005] = {'\0'};

%}

// %union
%union{
    int intVal; // define integer
    char* chVal; // define char
    double dbVal; // define double
}
// %token return back
%token <intVal> INTVAL
%token <dbVal> DBVAL
%token <chVal> CHR STR ID MACROS
// operators
%token <chVal> '+' '-' '*' '/' '%' '!' '&' '|' '<' '>' '='
%token <chVal> LSHIFT RSHIFT AA MM 
%token <chVal> LEQ GEQ EQEQ NEQ ANDAND OROR 
%token <chVal> COMMAS SMCOL
// keywords
%token <chVal> FOR DO WHILE BREAK CONTINUE IF ELSE RETURN STRUCT CASE SWITCH DEFAULT
%token <chVal> VOID 
// 
%token <chVal> TYPE
// %type grammar
%type <chVal> VarDec FunDec FuncDef root
%type <chVal> Idents

%%
root: VarDec {printf("<scalr_decl>%s<scalr_decl>",decl_head);}
    | FuncDec
    | FuncDef

VarDec: TYPE
    | Idents 

Idents: TYPE ID SMCOL {printf("%s | %s | %s",$1,$2,$3);strcat($$,$1);strcat($$,$2);strcat($$,$3);}



%%

int main(void)
{
    yyparse();
    return 0;
}

int yyerror(char *s)
{
    fprintf(stderr, "%s\n",s);
    return 0;
}
