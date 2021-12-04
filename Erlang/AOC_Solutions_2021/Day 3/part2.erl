-module(part2).
-export([run/0,read/1,loopthrough/3,eliminate/4]).


run() ->
    {ok, Device} = file:open("test.txt", ['read']), Device,
    Input = read(Device),
    binary_to_integer(list_to_binary(o2num(Input)), 2)*binary_to_integer(list_to_binary(co2num(Input)), 2).

read(File) ->
    case file:read_line(File) of 
        {ok, Data} -> [Data--"\n" | read(File)];
        eof -> []
    end.

co2num(List) ->
    co2num(List,1).

co2num([Term],_) -> Term;

co2num(List,N) ->
    Digit = loopthrough(List,N,0),
    case Digit of
        48 -> NewList = eliminate(49,List,N,[]);
        49 -> NewList = eliminate(48,List,N,[])
    end,
    io:format("~p~n",[NewList]),
    co2num(NewList,N+1).


o2num(List) ->
    o2num(List,1).

o2num([Term],_) -> Term;

o2num(List,N) ->
    Digit = loopthrough(List,N,0),
    NewList = eliminate(Digit,List,N,[]),
    io:format("~p~n",[NewList]),
    o2num(NewList,N+1).

eliminate(Digit,[Term|Rest],N,Acc) -> 
    case lists:nth(N,Term) of
        Nth when Nth =:= Digit-> eliminate(Digit,Rest,N,Acc++[Term]);
        _ -> eliminate(Digit,Rest,N,Acc)
    end;
eliminate(_,[],_,Acc) ->
    Acc.

loopthrough([Term|Rest],N,Acc) ->
    case lists:nth(N,Term) of
        49 -> loopthrough(Rest,N,Acc+1);
        48 -> loopthrough(Rest,N,Acc-1)
    end;
loopthrough([],_,Acc) ->
    if
        Acc>=0 -> 49;
        Acc<0 -> 48
    end.