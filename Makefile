all:
	lex scanner.l
	gcc scanner.c lex.yy.c hash.c -o scanner
	# ./scanner < config.in

run:
	./scanner < ./tests/test1.in > ./tests/test1.out
	./scanner < ./tests/test2.in > ./tests/test2.out
	./scanner < ./tests/test3.in > ./tests/test3.out
	./scanner < ./tests/test4.in > ./tests/test4.out