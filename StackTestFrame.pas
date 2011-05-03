program StackTestFrame;
procedure AnotherProc(aParam: Integer);
begin
WriteLn('The frame for AnotherProc starts at ', HexStr(get_frame));
WriteLn('-------------------------------');
WriteLn('aParam is at ', HexStr(@aParam));
WriteLn('-------------------------------');
end;
procedure Main(aParam: Integer);
var
myData: Integer;
myOtherData: Array [0..1024] of Integer;
begin
WriteLn('The frame for Main starts at ', HexStr(get_frame));
WriteLn('-------------------------------');
WriteLn('aParam is at ', HexStr(@aParam), ' to ',
HexStr(Cardinal(@aParam) + SizeOf(aParam), 8));
WriteLn('myData is at ', HexStr(@myData), ' to ',
HexStr(Cardinal(@myData) + SizeOf(myData), 8));
WriteLn('myOtherData goes from ', HexStr(@myOtherData), ' to ',
HexStr(Cardinal(@myOtherData) + SizeOf(myOtherData), 8));
//12.3 Stack Frame 111;
WriteLn('-------------------------------');
AnotherProc(1);
end;
begin
WriteLn('The frame for the program is at ', HexStr(get_frame));
Main(1);
end.