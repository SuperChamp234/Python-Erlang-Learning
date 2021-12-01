-module(first2).
-export([open_file/2,run/0,check_inc/1,check_inc/2]).

open_file(FileName, Mode) ->
    {ok, Device} = file:open(FileName, [Mode]),
    Device.

readf(File) -> 
    case file:read_line(File) of 
        {ok, Data} -> [erlang:list_to_integer(Data--"\n") | readf(File)];
        eof -> []
    end.
check_inc(Input) -> 
    check_inc(Input, 0).

check_inc([W, X, Y, Z | Input], Inc) when (W+X+Y) < (X+Y+Z) -> check_inc([X,Y,Z | Input], Inc+1);
check_inc([], Inc) -> Inc;
check_inc([_ | Input], Inc) -> check_inc(Input, Inc).


run() -> 
    Device = open_file("test.txt",read),
    Input = readf(Device),
    check_inc(Input).