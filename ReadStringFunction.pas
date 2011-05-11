unit ReadStringFunction;

interface
  Function ReadString(prompt : String):String;
  Function ReadDouble(prompt: String): Double;
  Function ReadInt(prompt : String):Integer;
  Function ReadIntegerRange(prompt : String ; min, max : Integer):Integer;
  
implementation
uses
  sysUtils;

Function ReadString(prompt : String):String;
begin
	Write(prompt);
	ReadLn(result);
end;

Function ReadDouble(prompt: String): Double;
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

Function ReadInt(prompt : String):Integer;
var
	temp : String;
	age : Integer;
begin
	//temp := ReadString(prompt);
	while not TryStrToInt(ReadString(prompt),age) do
	begin
		WriteLn('Please enter a whole number :');
		ReadLn(temp);
	end;
	result := age;
end;

function ReadIntegerRange(prompt : String ; min, max : Integer):Integer;
begin
	result := ReadInt(prompt);
	While (result < min) or (result > max) do
	begin
		WriteLn('Please enter a value between ',min,' and ', max);
		result:= ReadInt(prompt);
	end;
end;

end.