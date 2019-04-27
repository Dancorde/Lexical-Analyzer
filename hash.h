#ifndef FILE_H
#define FILE_H

#include <stdio.h>

#define tam_word 11
#define tam_hash 137

int hash(char *word);
void insere(char a[][tam_word], char *word);
int busca_hash(char a[][tam_word], char *word);
void imprime_hash(char a[][tam_word]);

#endif