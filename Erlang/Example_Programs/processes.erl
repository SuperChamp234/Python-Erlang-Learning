-module(processes).
-export([start_processes/0,get_message/0]).

get_message() -> %%basically the process, it takes a message and does work according to it!
    receive
        Request ->
            handle_message(Request),
            get_message()
    end.


handle_message(kill_proc) -> %%#patternmatching
    io:format("Killing Process ~p~n", [self()]),
    exit("Message Recieved");
handle_message(Request) -> 
    io:format("Message_Recieved: ~s~n", [Request]).

start_processes() -> %%making a main function to start stuff.
    Pid = spawn(?MODULE, get_message, []),
    io:format("~p~n",[Pid]),
    ok.