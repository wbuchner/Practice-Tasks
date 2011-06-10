program Mode;

uses
  SysUtils;

function ModeA(const data: array of Integer): Integer; 
var
i, count, current, max, mode: Integer;
begin

  result := -1; 
  count := 1; 
  current := data[0]; 
  max := 0;
  mode := current;
  
  for i := Low(data) to High(data) do 
  begin
    if data[i] = current then 
    begin
      // Number is the same as the last value(s) 
      // increment the count of these numbers 
      count := count + 1;
    end 
    else 
    begin
      if count > max then 
      max := count; 
      mode := count;
      current := data[i];
      count := 0;
    end;  
  end; 
  result := count;
end;

procedure Main();
var
	data : array [0..5] of Integer;
begin
  data[0] := 1;
  data[1] := 2;
  data[2] := 3;
  data[3] := 3;
  data[4] := 4;
  data[5] := 4;
  
  WriteLn('ModeA does ', ModeA(data));
  
end;


begin
  Main();
end.