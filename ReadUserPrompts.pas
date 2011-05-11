unit unit_name;

interface
  Function ReadString(prompt : String):String;
uses
  SysUtils, Classes;

implementation

  Function ReadString(prompt : String):String;
	begin
		Write(prompt);
		ReadLn(result);
	end;


end.