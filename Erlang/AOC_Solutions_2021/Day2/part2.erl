-module(part2).
-export([read/1,run/0,sum/4]).

read(File) ->
    case file:read_line(File) of
        {ok, Data} ->
            [First|Rest] = string:tokens(Data, " \t\n"),
            [{First,string:join(Rest, "\t")} | read(File)];
        eof -> []
    end.
sum([{"forward", Unit} | Rest_Of_Input], X, Y, Aim) ->
    sum(Rest_Of_Input, X+erlang:list_to_integer(Unit), Y+(Aim * erlang:list_to_integer(Unit)), Aim);
sum([{"up", Unit} | Rest_Of_Input], X, Y, Aim) -> 
    sum(Rest_Of_Input, X, Y, Aim-erlang:list_to_integer(Unit));
sum([{"down", Unit} | Rest_Of_Input], X, Y, Aim) ->
    sum(Rest_Of_Input, X, Y, Aim+erlang:list_to_integer(Unit));
sum([], X, Y, Aim) ->
    io:format("The Depth is ~w, and the forward is ~w and the aim is ~w thus your answer is ~w~n", [Y,X,Aim,(X*Y)]).


run() ->
    {ok, Device} = file:open("test.txt", ['read']), Device,
    Input = read(Device),
    sum(Input,0,0,0).
