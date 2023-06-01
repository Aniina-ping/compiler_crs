%{
	#include<string.h>
	#include<stdio.h>
	#include<stdlib.h>
	#include "y.tab.h"
	// int line = 1;
	// int prag_src = 1;
	// int prag_token = 1;
	// char Estring[299] = "";
	// int flag = 0;
	// init = True;

	// "int"         {yylval.chVal = yytext; return INT;}
	// "double"      {yylval.chVal = yytext; return DOUBLE;}
	// "float"       {yylval.chVal = yytext; return FLOAT;}
	// "char"        {yylval.chVal = yytext; return CHAR;}
	// "const"       {yylval.chVal = yytext; return CONST;}
	// "signed"      {yylval.chVal = yytext; return SIGNED;}
	// "unsigned"    {yylval.chVal = yytext; return UNSIGNED;}
	// "short"       {yylval.chVal = yytext; return SHORT;}
	// "long"        {yylval.chVal = yytext; return LONG;}
%}



Macros "NULL"|"__COUNTER__"|"__LINE__"|"INT_MAX"|"INT_MIN"|"CHAR_MAX"|"CHAR_MIN"|"MAX"|"MIN"

Op_Single "+"|"-"|"*"|"/"|"%"|"!"|"&"|"|"|"<"|">"|"="

Punctuation ":"|";"|","|"."|"["|"]"|"("|")"|"{"|"}"

Identifier [a-zA-Z_][a-zA-Z0-9_]*

Integer [+-]?(0|[1-9][0-9]*) 

Float [+-]?("."[0-9]+|[0-9]+"."+[0-9]*)

Space [ \t]

Char '(\\([0abertfnv"'?\\])|.|\\([0-7]{1,3})|\\u([0-9a-fA-F]{1,4})|\\U([0-9a-fA-F]+)|\\x([0-9a-fA-F]+))'

String \".*\"

Type (("const")?[ ]*("signed"|"unsigned")?[ ]*("long long"|"long"|"short")?[ ]*"int")|(("const")?[ ]*("signed"|"unsigned")?[ ]*("long long"|"long"|"short"|"char"))|(("const")?[ ]*("signed"|"unsigned"|"float"|"double"|"void"))|("const")




%x COMMENT
%x COMMENT_line

%%

{Type}        {printf("#Type:%s\n",yytext);yylval.chVal = yytext;return TYPE;}
"for"         {yylval.chVal = yytext; return FOR;}
"do"          {yylval.chVal = yytext; return DO;}
"while"       {yylval.chVal = yytext; return WHILE;}
"break"       {yylval.chVal = yytext; return BREAK;}
"continue"    {yylval.chVal = yytext; return CONTINUE;}
"if"          {yylval.chVal = yytext; return IF;}
"else"        {yylval.chVal = yytext; return ELSE;}
"return"      {yylval.chVal = yytext; return RETURN;}
"struct"      {yylval.chVal = yytext; return STRUCT;}
"case"        {yylval.chVal = yytext; return CASE;}
"switch"      {yylval.chVal = yytext; return SWITCH;}
"default"     {yylval.chVal = yytext; return DEFAULT;}
"void"        {yylval.chVal = yytext; return VOID;}
{Macros}      {yylval.chVal = yytext; return MACROS;}
{Identifier}  {printf("#ID:%s\n",yytext);yylval.chVal = yytext; return ID;}
{Op_Single}   {return *yytext;}
"<<"          {return LSHIFT; }
">>"          {return RSHIFT; }
"++"      	  {return AA;}
"--"    	  {return MM;}
"<="    	  {return LEQ;}
">="      	  {return GEQ;}
"=="          {return EQEQ;}
"!="          {return NEQ;}
"&&"       	  {return ANDAND;}
"||"      	  {return OROR;}
","			  {return COMMAS;}
";"			  {printf("#;:%s\n",yytext);yylval.chVal = yytext;return SMCOL;}
{Integer}     {yylval.intVal = atoi(yytext);return INTVAL;}
{Float}       {yylval.dbVal = atof(yytext);return DBVAL;}
{Space}       {}
{Char}        {yylval.chVal = yytext;return CHR;}
{String}      {yylval.chVal = yytext;return STR;}




\n {}


%%

