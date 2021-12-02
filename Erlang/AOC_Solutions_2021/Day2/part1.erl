-module(part1).
-export([read/1,run/0,sum/3]).

read(File) ->
    case file:read_line(File) of
        {ok, Data} ->
            [First|Rest] = string:tokens(Data, " \t\n"),
            [{First,string:join(Rest, "\t")} | read(File)];
        eof -> []
    end.
sum([{"forward", Unit} | Rest_Of_Input], X, Y) -> 
    sum(Rest_Of_Input, X+erlang:list_to_integer(Unit), Y);
sum([{"up", Unit} | Rest_Of_Input], X, Y) -> 
    sum(Rest_Of_Input, X, Y-erlang:list_to_integer(Unit));
sum([{"down", Unit} | Rest_Of_Input], X, Y) -> 
    sum(Rest_Of_Input, X, Y+erlang:list_to_integer(Unit));
sum([], X, Y) ->
    io:format("The Depth is ~w, and the forward is ~w~n", [Y,X]).

run() ->
    {ok, Device} = file:open("test.txt", ['read']), Device,
    Input = read(Device),
    sum(Input,0,0).
