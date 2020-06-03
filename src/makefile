run:
	./dispatch.sh

shuffle.o: shuffle.s 
	as -o $@ -gstabs $^ 
aux.o: aux.s 
	as -o $@ -gstabs $^ 
main.o: main.s 
	as -o $@ -gstabs $^ 

flush.o: flush.s 
	as -o $@ -gstabs $^ 
flush.out: shuffle.o flush.o main.o
	ld -o $@ $^ 
flush: flush.out runit.sh
	@./runit.sh $@ 

aces.o: aces.s 
	as -o $@ -gstabs $^
aces.out: shuffle.o aces.o main.o
	ld -o $@ $^ 
aces: aces.out runit.sh
	@./runit.sh $@ 

conn.o: conn.s  
	as -o $@ -gstabs $^
conn.out: shuffle.o aux.o conn.o main.o
	ld -o $@ $^ 
conn: conn.out aux.o runit.sh
	@./runit.sh $@ 

hole.o: hole.s 
	as -o $@ -gstabs $^
hole.out: shuffle.o hole.o main.o
	ld -o $@ $^ 
hole: hole.out runit.sh
	@./runit.sh $@ 

set.o: set.s 
	as -o $@ -gstabs $^
set.out: shuffle.o set.o main.o
	ld -o $@ $^ 
set: set.out runit.sh
	@./runit.sh $@ 

ace_ace.o: ace_ace.s 
	as -o $@ -gstabs $^
ace_ace.out: shuffle.o ace_ace.o main.o
	ld -o $@ $^ 
ace_ace: ace_ace.out runit.sh
	@./runit.sh $@ 

opp_over.o: opp_over.s 
	as -o $@ -gstabs $^
opp_over.out: shuffle.o opp_over.o main.o
	ld -o $@ $^ 
opp_over: opp_over.out runit.sh
	@./runit.sh $@ 


cls:
	@rm -f *.o *.out
