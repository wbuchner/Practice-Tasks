// Author: Wayne Buchner
// Student ID: 6643140
// Date: 03/04/2011
// Program: MyFriends.pas
// Description: reads strings from a prompt into an array
program MyFriends;

uses SysUtils;

type
	Address = record
	no: Integer;
	street: String;
	suburb: String;
	end;
	
	Friend = Record
		name, phone : String;
		age : Integer;
		address : Address;
		end;
		
Function ReadString(prompt : String):String;
begin
	Write(prompt);
	ReadLn(result);
end;

Function ReadInt(prompt : String):Integer;
var
	temp : String;
	age : Integer;
begin
	while not TryStrToInt(ReadString(prompt),age) do
	begin
		WriteLn('Please enter a whole number :');
		ReadLn(temp);
	end;
	result := age;
end;

function ReadFriend():Friend;
begin
	result.name := ReadString('Enter a Name :');
	result.phone := ReadString('Enter a phone :');
	result.age := ReadInt('Enter an age :');
	result.address.no := ReadInt('Enter Your Street Number :');
	result.address.street := ReadString('Enter Your Street :');
	result.address.suburb := ReadString('Enter Your Suburb :');
end;

procedure PopulateFriends(var list : array of Friend);
var
	i : Integer;
begin
	for i := Low(list) to High(list) do
	begin
		list[i] := ReadFriend();
	end;
	
end;
procedure PrintFriends(const list : array of Friend);
var
	i: Integer;
begin
	for i := Low(list) to High(list) do
	begin
		WriteLn('Name :',list[i].name);
		WriteLn('Phone :',list[i].phone);
		WriteLn('Age :',list[i].age);
		WriteLn('Address :',list[i].address.no,' ' ,list[i].address.street);
		WriteLn('Suburb :',list[i].address.suburb)
	end;
end;

procedure Main();
var
	names : array [0..2] of Friend;
begin
	PopulateFriends(names);
	PrintFriends(names);
end;

begin
	Main();
end.