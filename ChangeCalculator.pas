//  Author: Wayne Buchner
//  Student ID: 6643140
//  Date: 20 04 2011
//  Program: Calculate Change Assignment 6 Program
// Description: This program initialises a set of coins, accepts a value for a purchase
//  				and tests whether enough change is present and if is able to return the change given
// 				in the correct demonination.

{$MODE objfpc}
program ChangeCalculator;
uses SysUtils, math;

//  Type Declarations.
type
	CoinData = record
		value			: 	Integer;
		count			: 	Integer;
		description		: 	String;
	end;

//  Declare the CoinSet array here...
CoinSet = array [0..5] of CoinData;

//  Delcare the CombineCoinsOp enumeration here...
CombineCoinsOp = (AddCoins, RemoveCoins);


//  Zero all of the counts in a set of coins
procedure ZeroCounts(var aSet: CoinSet);
var
	i : Integer;
begin
  for i := Low(aSet) to High(aSet) do
		begin
			aSet[i].count := 0;
		end;
end;

//  Setup the coin data, initialise value, description, and count (set to 0)
procedure InitialiseCoins(out aSet: CoinSet);
begin
  aSet[0].value := 5;
  aSet[0].description := '5c';
  aSet[1].value := 10;
  aSet[1].description := '10c';
  aSet[2].value := 20;
  aSet[2].description := '20c';
  aSet[3].value := 50;
  aSet[3].description := '50c';
  aSet[4].value := 100;
  aSet[4].description := '$1';
  aSet[5].value := 200;
  aSet[5].description := '$2';
  
  ZeroCounts(aSet);
end;

//  Draws a horizontal line on the Console
procedure DrawLine();
var
  i: Integer;
begin
  for i := 0 to 70 do
  begin
    Write('-');
  end;
  WriteLn();
end;

//  Prints a message followed by the coin data from a set of coins.
procedure PrintCoins(message: String; const aSet: CoinSet);
var 
	i : Integer;
begin
	Write(message,' ');
	for i := Low(aSet) to High(aSet) do
		begin
		Write(aSet[i].count, ' x ', aSet[i].description);
		if i < High(aSet) then
			begin
				Write(', ');
			end;
		end;	
		WriteLn();
end;

//  Displays the coins in the machine between two horizontal lines.
procedure PrintMachineStatus(const machineCoins: CoinSet);
begin
  DrawLine();
  PrintCoins('In Machine - ', machineCoins);
  DrawLine();
  WriteLn();
end;

//  Reads in an integer, using the message as the prompt for the value
function ReadInteger(message: String): Integer;
var
  temp: String;
begin
  Write(message);
  ReadLn(temp);
  
  while not TryStrToInt(temp, result) do
  begin
    WriteLn('Please enter a whole number.');
    
    Write(message);
    ReadLn(temp);    
  end;
end;

//  Reads coin data from the user into a set of coins.
procedure ReadCoinCounts(message: String; var intoSet: CoinSet);
begin
  Write(message, ' (5, 10, 20, 50, 100, 200): ');
  ReadLn(intoSet[0].count,
    intoSet[1].count,
    intoSet[2].count,
    intoSet[3].count,
    intoSet[4].count,
    intoSet[5].count
    );
  WriteLn();
end;

//  Calculates the total value of a set of coins.
function TotalValue(const aSet: CoinSet): Integer;
var
	i : Integer;
begin
	result :=0;
	for i := Low(aSet) to High(aSet) do
		begin
			result += (aSet[i].value * aSet[i].count);
		end;
end;

// The function returns true if it was about to distribute the correct
// change, otherwise it returns false.
function CalculateChange(amount: Integer; const machineCoins: CoinSet; const fromCoins: CoinSet; var intoCoins: CoinSet): Boolean;
var
	i, val : Integer; 
begin
	result := False;
for i := High(machineCoins) downto Low(machineCoins) do
	begin
		
	if machineCoins[i].count > 0 then
	begin
	val := amount DIV machineCoins[i].value;
	if machineCoins[i].count <= val then
		begin
		intoCoins[i].count := machineCoins[i].count;
		amount := amount - (machineCoins[i].count * machineCoins[i].value);
		end
	else 
		begin
		intoCoins[i].count := val;
		amount := amount - (val * machineCoins[i].value);
		end;
	end;
end;
	if amount = 0 then
	begin
		result := True;		
	end
end;

//  Adds or removes the coins in coinsDiff from the fromCoins.
procedure CombineCoins(const coinDiff: CoinSet; var alterCoins: CoinSet; operation: CombineCoinsOp);
var
	i : Integer;
begin
	for i:= low(coinDiff) to High(CoinDiff) do
	if operation = AddCoins then
	begin
		alterCoins[i].count := alterCoins[i].count + coinDiff[i].count;
	end
	else if operation = RemoveCoins then
	begin
		alterCoins[i].count := alterCoins[i].count - coinDiff[i].count;
	end;
end;

//  Performs a purchase involving determining cost,
procedure PerformPurchase(var machineCoins: CoinSet; var purchaseCoins: CoinSet);
var
  cost, diff: Integer;
  payment, change: CoinSet;
begin
  //  Incoming coins
  InitialiseCoins(payment);
  InitialiseCoins(change);
  cost := ReadInteger('PP Cost in cents: ');
  ReadCoinCounts('PP Coins used', payment);
  diff := TotalValue(payment) - cost;
  WriteLn('Change Required ', diff,' cents' );
  // put coins paid into machine
  CombineCoins(payment, machineCoins, AddCoins);
  //  CALLING CALCULATE CHANGE HERE  TRUE or FALSE
if CalculateChange(diff, machineCoins, purchaseCoins, change) then
begin 
  //  if calculatechange is true do this.....check this function with remove coins!
  CombineCoins(change, machineCoins, RemoveCoins);
  PrintCoins('Change required :', change);
end
else
begin
  WriteLn('Not Enough Change Sorry');
  CombineCoins(payment, machineCoins, RemoveCoins);
  WriteLn(TotalValue(payment),' refunded');
 end;
  WriteLn();
end;

//  Main
procedure Main();
var
  machineCoins, customerCoins: CoinSet;
  i : Boolean;
begin
	i := True;
	InitialiseCoins(machineCoins);

	InitialiseCoins(customerCoins);
	while i = True do
	begin
		ReadCoinCounts('Coins to add to machine: ',machineCoins);
		CombineCoins(customerCoins, machineCoins, AddCoins);
		PrintMachineStatus(machineCoins);
		WriteLn('Total value of machine coins is: ', TotalValue(machineCoins));
		PerformPurchase(machineCoins, customerCoins);
		CombineCoins(customerCoins, machineCoins, RemoveCoins);
		//  test remove coins
		PrintMachineStatus(machineCoins);
		WriteLn('Total value of machine coins is: ', TotalValue(machineCoins));
	end;
end;

begin
  Main();
end.