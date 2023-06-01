all: parser test

parser:
	flex scanner.l
	gcc -o scanner lex.yy.c y.tab.c -lfl
	byacc -d parser.y
	gcc -o parser lex.yy.c y.tab.c -lfl

scanner:
	flex scanner.l
	gcc -o scanner lex.yy.c y.tab.c -lfl
test:
	./parser < t.txt > output_parser.xml
	golden_parser < t.txt > output_golden.xml
# test:
# 	./scanner < t.txt > output.rpt
# 	golden_parser < t.txt > output_golden.rpt
# 	diff output.rpt output_golden.rpt

clean:
	rm scanner lex.yy.c  parser