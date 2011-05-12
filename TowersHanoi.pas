program TowersHanoi;

function Power(base, toPower: Integer) : Integer; 
begin
  if toPower = 0 then 
  begin
    result := 1;
    end 
  else 
    begin
      result := base * Power(base, toPower -1);
    end;
end;

function fib(n : Integer):Integer;
begin
  if (n < 2) then
  begin
    result := n;
  end
  else
  begin    
    WriteLn('fibonacci ',n);
   result := fib(n-2) + fib(n-1);
  end; 
end;

procedure MoveDisc (n, fromPole, toPole, tempPole: Integer);
begin
  if n > 0 then
  begin
    MoveDisc(n-1, fromPole, tempPole, toPole);
    WriteLn('move ', n, ' to ', toPole);
    MoveDisc(n-1, tempPole, toPole, fromPole);
  end;
end;
procedure Main();
begin
  MoveDisc(3, 1, 3, 2);
  WriteLn('------------------------------');
  WriteLn('Fibonnaci of number 9 is :',fib(9));
  WriteLn('------------------------------');
  WriteLn(Power(2,8));
end;

begin
  Main();
end.