all: toesd.out popp_over.out fset.out pace_ace.out ffd.out faces.out foesd_conn.out foesd_hole.out
	@ echo "done !"

aux.o: aux.s 
	as -o $@ -gstabs $^ 
shuffle.o: shuffle.s 
	as -o $@ -gstabs $^ 
main.o: main.s 
	as -o $@ -gstabs $^ 

ffd.o: ffd.s 
	as -o $@ -gstabs $^ 
ffd.out: aux.o shuffle.o ffd.o main.o
	ld -o $@ $^ 

faces.o: faces.s 
	as -o $@ -gstabs $^
faces.out: aux.o shuffle.o faces.o main.o
	ld -o $@ $^ 

toesd.o: toesd.s  
	as -o $@ -gstabs $^
toesd.out: aux.o shuffle.o aux.o toesd.o main.o
	ld -o $@ $^ 

foesd_conn.o: foesd_conn.s  
	as -o $@ -gstabs $^
foesd_conn.out: aux.o shuffle.o foesd_conn.o main.o
	ld -o $@ $^ 

foesd_hole.o: foesd_hole.s 
	as -o $@ -gstabs $^
foesd_hole.out: aux.o shuffle.o foesd_hole.o main.o
	ld -o $@ $^ 

fset.o: fset.s 
	as -o $@ -gstabs $^
fset.out: aux.o shuffle.o fset.o main.o
	ld -o $@ $^ 

pace_ace.o: pace_ace.s 
	as -o $@ -gstabs $^
pace_ace.out: aux.o shuffle.o pace_ace.o main.o
	ld -o $@ $^ 

popp_over.o: popp_over.s 
	as -o $@ -gstabs $^
popp_over.out: aux.o shuffle.o popp_over.o main.o
	ld -o $@ $^ 

clean:
	@rm -f *.o *.out
