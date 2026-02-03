# You MUST modify this file

GCC = gcc $(CFLAGS)
CFLAGS = -std=c99 -g -Wall -Wshadow --pedantic -Wvla -Werror
LIBS = -lm
EXEC = hw4

hw4.o : hw4.c hw4.h
	$(GCC) -c hw4.c

func1.o : func1.c
	$(GCC) -c func1.c

func2.o : func2.c
	$(GCC) -c func2.c

func3.o : func3.c
	$(GCC) -c func3.c

func4.o : func4.c
	$(GCC) -c func4.c

func5.o : func5.c
	$(GCC) -c func5.c

integrator-hw4-t.o : integrator-hw4.c hw4.h
	$(GCC) -c -DTEST_INTEGRATE -DRUN_INTEGRATE integrator-hw4.c -o integrator-hw4-t.o

hw4-func1-t : hw4.o func1.o func2.o func3.o func4.o func5.o integrator-hw4-t.o hw4.h
	$(GCC) hw4.o func1.o func2.o func3.o func4.o func5.o integrator-hw4-t.o -o hw4-func1-t -lm

testall : hw4-func1-t
	mkdir -p outputs
	./hw4-func1-t "testcases/test1" "outputs/hw4-func1-t"

clean:
	rm -f *.o
	rm -f testgen 
	rm -f *.gcda *.gcno gmon.out *gcov
	rm -f hw4 hw4.prof
