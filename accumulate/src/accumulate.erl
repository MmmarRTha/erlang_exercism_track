-module(accumulate).

-export([accumulate/2]).

%%
%% given a fun and a list, apply fun to each list item replacing list item with fun's return value.
%%
-spec accumulate(fun((A) -> B), [A]) -> [B].
%% Example:
%% Double = fun(X) -> X * 2 end,
%% List = [1, 2, 3, 4, 5],
%% Result = accumulate:accumulate(Double, List).
accumulate(Fn, List) ->
    accumulate(Fn, List, []).

accumulate(_, [], Acc) ->
    lists:reverse(Acc);
accumulate(Fn, [H | T], Acc) ->
    NewAcc = [Fn(H) | Acc],
    accumulate(Fn, T, NewAcc).
