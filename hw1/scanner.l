%{
	#include<string.h>
	#include<stdio.h>
	int line = 1;
	int prag_src = 1;
	int prag_token = 1;
	char Estring[299] = "";
	int flag = 0;
	// init = True;
	void combin_text(const char *text)
	{
		strcat(Estring,text);
	}
%}

Pragma_Src_On    #pragma[ \t]*source[ \t]*on[ \t]* 
Pragma_Src_Off   #pragma[ \t]*source[ \t]*off[ \t]*
Pragma_token_On  #pragma[ \t]*token[ \t]*on[ \t]*
Pragma_token_Off #pragma[ \t]*token[ \t]*off[ \t]* 

Keywords "for"|"do"|"while"|"break"|"continue"|"if"|"else"|"return"|"struct"|"case"|"switch"|"default"|"void"|"int"|"double"|"float"|"char"|"const"|"signed"|"unsigned"|"short"|"long"

Macros "NULL"|"__COUNTER__"|"__LINE__"|"INT_MAX"|"INT_MIN"|"CHAR_MAX"|"CHAR_MIN"|"MAX"|"MIN"

Operators "+"|"-"|"*"|"/"|"%"|"++"|"--"|"<"|"<="|">"|">="|"=="|"!="|"="|"&&"|"||"|"!"|"&"|"|"

Punctuation ":"|";"|","|"."|"["|"]"|"("|")"|"{"|"}"

Identifier [a-zA-Z_][a-zA-Z0-9_]*

Integer [+-]?(0|[1-9][0-9]*) 

Float [+-]?("."[0-9]+|[0-9]+"."+[0-9]*)

Space [ \t]

Char '(\\([0abertfnv"'?\\])|.|\\([0-7]{1,3})|\\u([0-9a-fA-F]{1,4})|\\U([0-9a-fA-F]+)|\\x([0-9a-fA-F]+))'

String \".*\"



%x COMMENT
%x COMMENT_line

%%

"/*"           {BEGIN COMMENT;combin_text(yytext);}
<COMMENT>"*/"  {BEGIN(0);combin_text(yytext);}
<COMMENT>\n    {if(prag_src){printf("%d:%s\n",line,Estring);} Estring[0]='\0';line++;}
<COMMENT>.     {combin_text(yytext);}
"//"           {BEGIN COMMENT_line;combin_text(yytext);}
<COMMENT_line>[^\n]*\\ {flag=1;combin_text(yytext);if(prag_src){printf("%d:%s\n",line,Estring);} Estring[0]='\0';line++;}
<COMMENT_line>[^\n]*   {flag=0;combin_text(yytext);}
<COMMENT_line>\n       {if(!flag){BEGIN(0);if(prag_src){printf("%d:%s\n",line,Estring);} Estring[0]='\0';line++;}} 

{Pragma_Src_On}    {prag_src = 1;combin_text(yytext);}
{Pragma_Src_Off}   {prag_src = 0;combin_text(yytext);}
{Pragma_token_On}  {prag_token = 1;combin_text(yytext);}
{Pragma_token_Off} {prag_token = 0;combin_text(yytext);}

{Keywords}    {if(prag_token){printf("#key:%s\n",yytext);}combin_text(yytext);}
{Macros}      {if(prag_token){printf("#macro:%s\n",yytext);}combin_text(yytext);}
{Identifier}  {if(prag_token){printf("#id:%s\n",yytext);}combin_text(yytext);}
{Operators}   {if(prag_token){printf("#op:%s\n",yytext);}combin_text(yytext);}
{Punctuation} {if(prag_token){printf("#punc:%s\n",yytext);}combin_text(yytext);}
{Integer}     {if(prag_token){printf("#integer:%s\n",yytext);}combin_text(yytext);}
{Float}       {if(prag_token){printf("#float:%s\n",yytext);}combin_text(yytext);}
{Space}       {combin_text(yytext);}
{Char}        {if(prag_token){printf("#char:%s\n",yytext);combin_text(yytext);}}
{String}      {if(prag_token){printf("#string:%s\n",yytext);combin_text(yytext);}}

\n {if(prag_src){printf("%d:%s\n",line,Estring);} Estring[0]='\0';line++;}

 

%%

int main(void)
{
	yylex();
	return 0;
}