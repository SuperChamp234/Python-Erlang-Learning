## Writing modules
For writing programs, you basically write Erl modules. We can write functions in those modules which perform tasks.

Modules can be saved in files ending with `.erl` extension, and can be called after compiling as `Module:Function(Argumets)` 

Here's code for my first Module
```erlang
-module(useless).
-export([add/2,hello/0,greet_and_add_two/1]).

add(A,B) ->
    A+B.

hello() ->
    io:format("Hello World!~n").

greet_and_add_two(X) ->
    hello(),
    add(X,2).
```

Well most of it is self explanatory but here are some points:
- We've gotta define the module as done in first line! 
- We've gotta export the functions that we wanna use outside of the module!
	- The functions must be exported as `-export([Function/<args>]).`
- In order to import functions into a module, we will have to use the following syntax
	`-import(Module, [Function/Arity,...]).`
- The full stops are going to take some time to get used to.

##### Compiling modules
Modules can be compiled from
1. Command Line
	We can do that directly by using `erlc flags <Module>.erl`
2. When in erl Shell
	1. Compile using `compile:file(Filename)`, can also be used in other modules!
	2. Using `c(Modulename).`

Flags can be used to get more control over how a module is compiled
> You can get a list of all of them in the [Erlang documentation](http://erlang.org/doc/man/compile.html). The most common flags are:
`-debug_info`
Erlang tools such as debuggers, code coverage and static analysis tools will use the debug information of a module in order to do their work.
`-{outdir,Dir}`
By default, the Erlang compiler will create the 'beam' files in the current directory. This will let you choose where to put the compiled file.
`-export_all`
Will ignore the `-export` module attribute and will instead export all functions defined. This is mainly useful when testing and developing new code, but should not be used in production.
`-{d,Macro} or {d,Macro,Value}`
Defines a macro to be used in the module, where Macro is an atom. This is more frequently used when dealing when unit-testing, ensuring that a module will only have its testing functions created and exported when they are explicitly wanted. By default, Value is 'true' if it's not defined as the third element of the tuple.

---

I'll keep updating this if I learn more.