all: scanner

scanner:
	flex scanner.l
	gcc -o scanner lex.yy.c -lfl
# test:
# 	./scanner < t.txt > output.rpt
# 	golden_scanner < t.txt > output_golden.rpt
# 	diff output.rpt output_golden.rpt
clean:
	rm scanner lex.yy.c 