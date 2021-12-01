-module(recursion).
-export([factorial/1,list_len/1,duplicate/2,duplicate/3]).


factorial(N) when N =:= 0 -> 1;
factorial(N) when N > 0-> N*factorial(N-1).

list_len([]) -> 0;
list_len([_|L]) -> 1 + list_len(L).

% duplicate(N,T) when N =:= 1 -> [T];
% duplicate(N,T) when N> 1 -> [T| duplicate(N-1,T)].

duplicate(N,T) -> duplicate(N,T,[]).

duplicate(N,T, Acc) when N =:= 0 -> Acc;
duplicate(N,T, Acc) when N> 0 -> duplicate(N-1,T,[T| Acc]).