#include <stdio.h>
#include <string.h>
#include "hash.h"

extern int yylex();
extern int yylineno;
extern char *yytext;

int main(void){
  int ntoken;
  char wordsHash[tam_hash][tam_word];
  char *word;

  int achou;

  FILE *fp;

  //inicia a hash vazia
  for (int i = 0; i < tam_hash; i++){
    strcpy(wordsHash[i], "");
  }

  // Insere as palavras reservadas na hash
  fp = fopen ("reservedWords.txt", "r");
  while (!feof(fp)){
    fscanf(fp, "%s\n", word);
    strcpy(wordsHash[hash(word)], word);
  }
  fclose(fp);

  // imprime_hash(wordsHash);

  ntoken = yylex();

  while(ntoken){
    strcpy(word, yytext);
    achou = busca_hash(wordsHash ,word);
    if (achou != -1){
      printf("%s - %s\n", word, wordsHash[achou]);
    } else {
      printf("%s - id\n", word);
    }

    ntoken = yylex();
  }
  return 0;
}