-module(part1).
-export([read/1,run/0,transpose/1,split_sum/2,split_sum/1,gamma/3]).

read(File) ->
    case file:read_line(File) of 
        {ok, Data} -> [Data--"\n" | read(File)];
        eof -> []
    end.
split_sum(Input) ->
    split_sum(Input,0).
split_sum([48| Rest],Acc) ->
    split_sum(Rest, Acc-1);
split_sum([49| Rest],Acc) ->
    split_sum(Rest, Acc+1);
split_sum([],Acc) ->
    Acc.
gamma([First|Rest],G,B) ->
    case split_sum(First) of
        Digit when Digit > 0 -> gamma(Rest,G++"1",B++"0");
        Digit when Digit =< 0 -> gamma(Rest,G++"0",B++"1")
    end;
gamma([],G,B) ->
    % io:format("~w,~w~n",[binary_to_integer(list_to_binary(G), 2),binary_to_integer(list_to_binary(B), 2)]).
    io:format("~w~n",[binary_to_integer(list_to_binary(G), 2)*binary_to_integer(list_to_binary(B), 2)]).
transpose([[]|_]) -> [];
transpose(M) ->
  [lists:map(fun hd/1, M) | transpose(lists:map(fun tl/1, M))].

run() ->
    {ok, Device} = file:open("test.txt", ['read']), Device,
    Input = read(Device),
    gamma(transpose(Input),"","").