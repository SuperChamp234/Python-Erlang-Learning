#### Pattern matching in functions
So, Erlang is really good at pattern matching. Saves a lot of boilerplate code!
Instead of typing like this:
```
function(Args)
   if X then
      Expression
   else if Y then
      Expression
   else
      Expression
```
We can type like this!
```erlang
function(X) ->
Expression;
function(Y) ->
Expression;
function(_) ->
Expression.
```
PS. IO Chapter Sneek Peek!
```
1> io:format("~s~n",[<<"Hello">>]).
Hello
ok
2> io:format("~p~n",[<<"Hello">>]).
<<"Hello">>
ok
3> io:format("~~~n").
~
ok
4> io:format("~f~n", [4.0])
.
4.000000
ok
5> io:format("~30f~n", [4.0]).
					  4.000000
ok
6> io:format("~20~n2").
~~~~~~~~~~~~~~~~~~~~n2ok
7> io:format("~20~n 2").
~~~~~~~~~~~~~~~~~~~~n 2ok
```
We can use some more pattern matching forms, just some examples here
```erlang
head([H|_]) -> %%or the built in hd() function
    H.
second([_,S|_]) -> 
    S.
valid_time({Date={Y,M,D},Time={H,Min,Sec}}) ->
    io:format("The date tuple ~p says the date is ~p/~p/~p, ~n",[Date,D,M,Y]),
    io:format("The time tuple ~p says the time is ~p:~p:~p, ~n",[Time,H,Min,Sec]);
valid_time(_) ->
    io:format("Invalid Date and Time").
```
But, the functions still take in all values, may they be numbers or atoms!
```
15> functions:valid_time({{2011,09,06},{"not",valid,time}}). 
The date tuple {2011,9,6} says the date is 6/9/2011, 
The time tuple {"not",valid,time} says the time is "not":valid:time,
ok
```
For that, we can use guards.
#### Guards