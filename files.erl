-module(files).
%
%  Need to read / write files
%  Read json into record?
% Write json into record


-export([main/0]).
-export([readlines/1]).
-export([get_all_lines/1]).

-export([readAllAtonce/1]).
-export([read/1]).
-export([readAndSplit/1]).

-export([writeToFileBasic/0]).

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
        Line -> 
            io:format("~p \n\n", [Line]),
            [Line] ++ get_all_lines(Device)
    end.

% All at once
readAllAtonce(Filename) ->
    {ok, Bin} = file:read_file(Filename),
    Bin.

% Line by line
read(File) ->
    case file:read_line(File) of
        {ok, Data} -> [Data | read(File)];
        eof        -> []
    end.

% Read line by line
readAndSplit(Filename) ->
    {ok, Data} = file:read_file(Filename),
    S = binary:split(Data, [<<"\n">>], [global]),
     S.



writeToFileBasic() ->
    Data = [1,2,3,{car, "honda"}],
    file:write_file("filetest.txt", io_lib:fwrite("~p.\n", [Data])),
    true.

% writeJason
