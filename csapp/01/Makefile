hello: hello.c
	gcc -o $@ $^

hello.e: hello.c
	gcc -E $^ > $@

hello.s: hello.c
	gcc -S $^

hello.o: hello.s
	as $^ -o $@

clean:
	rm -f hello hello.e hello.s hello.o
