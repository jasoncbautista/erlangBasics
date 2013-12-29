-module(files).
%
%  Need to read / write files
%  Read json into record?
% Write json into record
%
%


-export([main/0]).
-export([readlines/1]).
-export([get_all_lines/1]).

main() ->
    io:fwrite("hello world"),
    
    FileContents =  readlines("README"),
    io:fwrite("~p\n", [FileContents]),
    true.


readlines(FileName) ->
    {ok, Device} = file:open(FileName, [read]),
    try get_all_lines(Device)
      after file:close(Device)
    end.

get_all_lines(Device) ->
    case io:get_line(Device, "") of
        eof  -> [];
        Line -> Line ++ get_all_lines(Device)
    end.



