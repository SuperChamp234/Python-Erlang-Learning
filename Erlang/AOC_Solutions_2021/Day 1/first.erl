-module(first).
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

check_inc([X, Y | Input], Inc) when X < Y -> check_inc([Y | Input], Inc+1);
check_inc([], Inc) -> Inc;
check_inc([_ | Input], Inc) -> check_inc(Input, Inc).


run() -> 
    Device = open_file("firstinp.txt",read),
    Input = readf(Device),
    check_inc(Input).