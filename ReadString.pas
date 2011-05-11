unit ReadString;

interface

uses
  SysUtils, Classes;

implementation

function ReadDouble(prompt: String): Double;
var
	temp: String;
begin
	temp := ReadString(prompt);
	
	while not TryStrToFloat(temp, result) do
	begin
		WriteLn('Please enter a real number ');
		temp := ReadString(prompt);
	end;
end;


end.