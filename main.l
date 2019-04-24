%{
  #include <stdio.h>
  #include <stdlib.h>
%}

digit [0-9]*
letter [a-zA-Z]

%%

"program" {printf("%s - program\n", yytext);}
"var" {printf("%s - var\n", yytext);}
"const" {printf("%s - const\n", yytext);}
":" {printf("%s - :\n", yytext);}
"," {printf("%s - ,\n", yytext);}
"integer" {printf("%s - tipo_var\n", yytext);}
"real" {printf("%s - tipo_var\n", yytext);}
"begin" {printf("%s - begin\n", yytext);}
"end" {printf("%s - end\n", yytext);}
"." {printf("%s - .\n", yytext);}
";" {printf("%s - ;\n", yytext);}

"read" {printf("%s - read\n", yytext);}
"write" {printf("%s - write\n", yytext);}

"procedure" {printf("%s - procedure\n", yytext);}
"if" {printf("%s - if\n", yytext);}
"then" {printf("%s - then\n", yytext);}
"else" {printf("%s - else\n", yytext);}
"do" {printf("%s - do\n", yytext);}
"while" {printf("%s - while\n", yytext);}
"for" {printf("%s - for\n", yytext);}
"to" {printf("%s - to\n", yytext);}

":=" {printf("%s - :=\n", yytext);}
"=" {printf("%s - =\n", yytext);}
"(" {printf("%s - (\n", yytext);}
")" {printf("%s - )\n", yytext);}

"<" {printf("%s - <\n", yytext);}
"<=" {printf("%s - <=\n", yytext);}
">" {printf("%s - >\n", yytext);}
">=" {printf("%s - >=\n", yytext);}
"<>" {printf("%s - <>\n", yytext);}

"+" {printf("%s - +\n", yytext);}
"-" {printf("%s - -\n", yytext);}
"*" {printf("%s - *\n", yytext);}
"/" {printf("%s - /\n", yytext);}

{letter}({letter}{digit})* {printf("%s - id\n", yytext);}
{digit}+"."{digit}+ {printf("%s - numero_real\n", yytext);}
{digit} {printf("%s - numero_int\n", yytext);}
[ \t\n] {}
"\{"[^\}]*"\}" {printf("%s - comentario\n", yytext);}

%%

int main(){
  int numbOfWords = 19;
  int sizeOfBiggWord = 9;
  FILE * fp;
  char reservWords[numbOfWords][sizeOfBiggWord];
  int i = 0;

  fp = fopen ("reservWords.txt", "r");
  while (!feof(fp)){
    fscanf(fp, "%s ", reservWords[i]);
    i++;
  }

  fclose(fp);

  yylex();

  return 0;
}
