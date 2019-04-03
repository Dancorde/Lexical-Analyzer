%%
"+" {printf("PLUS ");}
"-" {printf("MINUS ");}
[0-9]* {printf("NUMBER ");}
%%
int main(){
  yylex();
  return 0;
}