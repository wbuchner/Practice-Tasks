program PointerArithmaticTest;

uses
  sysUtils;
procedure Main();
var
  i   :   Integer;
  ip  :   ^Integer;
  ia  :   array of ^Integer;
begin
  SetLength(ia, 3);

  for i:= Low(ia) to High(ia) do
  begin
    New(ia[i]);
    ia[i]^ := (i+1)* 10;
    WriteLn('#1 ',i,'::',HexStr(Addr(ia[i])),' ',ia[i]^);
  end;
  // New(ip);
  ip := ia[0];
 
  repeat
    WriteLn(HexStr(Addr(ip^)),'::',ip^);
    ip := ip + 2;
   until ip > ia[High(ia)];
  
  ip := ip - 2;
  // writes the value that ip is pointing to. So ia
  WriteLn(ip^);

end;

begin
  Main();
end.