program newList;

uses
  sysUtils;

type
  NodePtr = ^Node;
  
  Node = record
    name  : String;
    next  : NodePtr;
end;


function CreateNode(data : String; next : NodePtr): NodePtr;
begin
  //alocate space on the heap
  New(result);
  
  //set up node details
  result^.name := data;
  result^.next := next;
end;

function FindNode(list: NodePtr; value: String): NodePtr;
var 
  current : NodePtr;
begin
  current := list;
  while (Assigned(current)) AND (current^.name <> value) do
  begin
    current := current^.next;
    result := current;
  end;
end;

//Function replaces node data
function ReplaceNodeData(list: NodePtr; value: String): NodePtr;
var 
  current : NodePtr;
begin
  current := list;
  while (Assigned(current)) AND (current^.name = value) do
  begin

    result := current;
  end;
end;

procedure PrependNode(list: NodePtr; value: String);

begin

  while (Assigned(list)) AND (list^.name = value) do
  begin
   
   CreateNode('Andrew', list^.next); 
   
  end;
end;

// Insert After Function
function InsertAfter(data: String; n : NodePtr): NodePtr;
begin
  result := CreateNode(data, n^.next); // follow n 
  n^.next := result;
end;

function FindPrevious(list: NodePtr; value: String):NodePtr;
var
  previous, current : NodePtr;
begin
  current := list;
  while (Assigned(current)) AND (current^.name <> value) do
  begin
    previous := current;
    WriteLn('Previous Name ',previous^.name);
    current := current^.next;
  end;
  result := previous;
end;

function InsertBefore(data, value : String; n : NodePtr): NodePtr;
var
  previous,current : NodePtr;
begin
  previous := FindPrevious(n,value);
  WriteLn('InsertBefore Previous Name is ',previous^.name);
  current := CreateNode(data,previous);
  current^.next := previous;

  WriteLn('Current Name is ',current^.name);

  
  result := current;
end;

procedure PrintFrom(n: NodePtr);
begin
  if n <> nil then
    begin
      Write(n^.name,' -> ');
      PrintFrom(n^.next);
     end
    else
    begin
      WriteLn('nil');
    end;
    //WriteLn();
end;


procedure Main();
var
  start: NodePtr;

begin
  //create the node List Record

 
  start := CreateNode('Wayne', nil);
  PrintFrom(start);
  ReplaceNodeData(start,'Wayne');
  PrintFrom(start);
  InsertAfter('Andrew',start);
  PrintFrom(start);
  InsertBefore('NewName','Andrew',start);
  PrintFrom(start);
end;

begin
  Main();
end.