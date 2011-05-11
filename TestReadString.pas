program TestReadString;

uses SysUtils, ReadStringFunction;

procedure Main();
	var 
		name : String;
		age : Integer;
		aDouble : Double;
	begin
		name := ReadString('EnterYourName :');
		age := ReadIntegerRange('Enter your age :',1,50);
		aDouble := ReadDouble('Enter a real number');
		WriteLn('Hi ',name, ' you are ',age,' you are this smart : ',aDouble:4:2);
end;

begin
	Main();
end.