program ProcessTest;
procedure AnotherProcedure();
var
anotherLocal, yetAnotherOne: Integer;
aPtr: ^Integer;
begin
WriteLn('The code for AnotherProcedure is at ', HexStr(@AnotherProcedure));
WriteLn('The frame for AnotherProcedure starts at ', HexStr(get_frame));
WriteLn('anotherLocal is at ', HexStr(@anotherLocal));
WriteLn('yetAnotherOne is at ', HexStr(@yetAnotherOne));
New(aPtr);
aPtr^ := 127;
WriteLn('aPtr is at ', HexStr(@aPtr));
WriteLn('aPtr points to ', HexStr(aPtr));
Dispose(aPtr);
end;
procedure Main();
var
myLocalVariable: Integer;
begin
WriteLn('The code for main is at ', HexStr(@Main));
WriteLn('The frame for main starts at ', HexStr(get_frame));
WriteLn('myLocalVariable is at ', HexStr(@myLocalVariable));
AnotherProcedure();
end;
begin
WriteLn('The frame at the start is ', HexStr(get_frame));
Main();
end.