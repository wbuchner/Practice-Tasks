{$mode objfpc}
program PointerTests;

procedure Main();
var
  i: Integer;
  ip: ^Integer;
begin
  i := 10;
  ip := @i;
  
  WriteLn('-------------------------------------------');
  WriteLn(' Where are the Local Variables? ');
  WriteLn('-------------------------------------------');
  WriteLn('The address of i is ', HexStr(Addr(i)));
  WriteLn('The address of ip is ', HexStr(Addr(ip)));
  WriteLn('-------------------------------------------');
  
  WriteLn('The value of i is ', i);
  WriteLn('The value of ip is ', HexStr(ip));
  WriteLn('The value pointed to by ip is (ip^) ', ip^);
  
  WriteLn('-------------------------------------------');
  WriteLn('Changing value via ip^');
  ip^ := 20;
  WriteLn('The value pointes to by ip is now ', ip^);
  WriteLn('The value of i is ', i);
  WriteLn('-------------------------------------------');
  
  WriteLn('Dynamically allocating space for ip');
  New(ip);
  WriteLn('The value of ip is ', HexStr(ip));
  WriteLn('The value pointed to by ip is ', ip^);
  WriteLn('-------------------------------------------');
  
  WriteLn('Changing value via ip^');
  ip^ := 30;
  WriteLn('The value pointed to by ip is now ', ip^);
  WriteLn('The value of i is ', i);
  WriteLn('-------------------------------------------');
  
  WriteLn('Disposing ip and assigning to nil');
  Dispose(ip);
  ip := nil;
  
  WriteLn('The value in ip is ', HexStr(ip));
  WriteLn('The value ip points to by ip is (crash!) ', ip^);
end;

begin
  Main();
end.