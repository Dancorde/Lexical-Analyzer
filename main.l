digit [0-9]*
letter [a-zA-Z]

%%
" " {printf("");}
{digit} {printf("%s - num\n", yytext);}
"program" {printf("%s - program\n", yytext);}
"var" {printf("%s - var\n", yytext);}
"integer" {printf("%s - integer\n", yytext);}
"begin" {printf("%s - begin\n", yytext);}
"read" {printf("%s - read\n", yytext);}
"end" {printf("%s - end\n", yytext);} 
"(" {printf("%s - (\n", yytext);}
")" {printf("%s - )\n", yytext);}
"." {printf("%s - .\n", yytext);}
"<" {printf("%s - <\n", yytext);}
">" {printf("%s - >\n", yytext);}
"+" {printf("%s - +\n", yytext);}
"-" {printf("%s - -\n", yytext);}
"*" {printf("%s - *\n", yytext);}
"/" {printf("%s - /\n", yytext);}
"," {printf("%s - ,\n", yytext);}
":" {printf("%s - :\n", yytext);}
";" {printf("%s - ;\n", yytext);}
{letter}({letter}{digit})* {printf("%s - id\n", yytext);}
%%

int main(){
  yylex();
  return 0;
}