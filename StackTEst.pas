program StackTest;
procedure AnotherProcedure();
begin
WriteLn('The frame for AnotherProcedure starts at ', HexStr(get_frame));
end;
procedure Main();
begin
WriteLn('The frame for main starts at ', HexStr(get_frame));
AnotherProcedure();
end;
begin
WriteLn('The frame at the start is ', HexStr(get_frame));
Main();
end.