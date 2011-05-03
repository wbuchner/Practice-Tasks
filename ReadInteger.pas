unit ReadInteger;

interface
uses  SysUtils;

function ReadInteger(prompt: String) : Integer;

implementation
	function ReadInteger(prompt: String) : Integer;
	var
	  temp: String;
	begin
	  Write(prompt);
	  ReadLn(temp);
  
	  while not TryStrToInt(temp, result) do
	  begin
	    WriteLn('Please enter a whole number.');
    
	    Write(prompt);
	    ReadLn(temp);    
	  end;
	end;
end.