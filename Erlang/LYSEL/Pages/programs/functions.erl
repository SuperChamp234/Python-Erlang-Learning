-module(functions).
-compile(export_all).

head([H|_]) -> %%or the built in hd() function
    H.
second([_,S|_]) -> 
    S.
valid_time({Date={Y,M,D},Time={H,Min,Sec}}) ->
    io:format("The date tuple ~p says the date is ~p/~p/~p, ~n",[Date,D,M,Y]),
    io:format("The time tuple ~p says the time is ~p:~p:~p, ~n",[Time,H,Min,Sec]);
valid_time(_) ->
    io:format("Invalid Date and Time").
