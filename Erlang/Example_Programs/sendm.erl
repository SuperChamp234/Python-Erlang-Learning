-module(sendm).
-export([makemessage/2]).

makemessage(Message, Pid) -> %%small wrapper to make message-sending easier!
    Pid ! Message.