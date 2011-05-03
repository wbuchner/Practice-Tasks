program MazeGame;
uses
  sysUtils;
type

	RoomPtr = ^Room;

	Direction = (North, South, East, West);
	
	maze = Array of RoomPtr;
	
	Door = Record
	  Heading     : Direction;
	  Destination : RoomPtr;
	end;
	
	Room = Record
		Title       : String;
		Description : String;
		IsGoal      : Boolean;
		doors       : Array of Door;
	end;
	

	
function CreateRoom(title, description : String; goal:Boolean):RoomPtr;
var
  newRoom: RoomPtr;
begin
  // this allocates space on the HEAP
  New(newRoom);  
  
  // put data into newRoom
  newRoom^.Title := title;
  newRoom^.Description := description;
  newRoom^.IsGoal := goal;
  SetLength(newRoom^.doors, 0);
  // return new room
  result := newRoom;
end;

function DirToString(dir: Direction): String;
begin
  case dir of
  North: result := 'North';
  South: result := 'South';
  East: result := 'East';
  West: result := 'West';
  else result := 'Unknown room';
    end;
end;

procedure DisplayRoom(toShow: RoomPtr);	
	var
	i : Integer;
	begin
	  WriteLn('------------');
	  WriteLn(toShow^.Title);
	  WriteLn('------------');
	  WriteLn(toShow^.Description);
	  WriteLn('------------------------------------------------');
	  for i := Low(toShow^.doors) to  High(toShow^.doors)do
	    WriteLn(' ', i+ 1,': ', toShow^.doors[i].heading) // this is an enumerated type we need a function to convert it to rting
end;
	
procedure AddDoor(fromRoom: RoomPtr; heading: Direction; toRoom: RoomPtr);
begin
  SetLength(fromRoom^.doors, Length(fromRoom^.doors)+1 );
  fromRoom^.doors[High(fromRoom^.doors)].heading := heading;
  fromRoom^.doors[High(fromRoom^.doors)].destination := toRoom;
end;

procedure LoadMaze(filename: String; var myMaze: maze);
var
  input: Text;
  space: Char;
  dir: Direction;
  title, desc: String;
  roomCount, exitCount, goalIdx: Integer;
  i, fromRoom, toRoom: Integer;  

begin
  Assign(input, filename);
  Reset(input);
  
  ReadLn(input, roomCount);
// set the length of the array myMaze
  SetLength(myMaze,roomCount); 
  WriteLn('There are ', roomCount, ' rooms in the maze...');
  WriteLn(Length(myMaze));
  
  ReadLn(input, goalIdx);
  WriteLn('The Goal room is room ',goalIdx);

  for i := 0 to roomCount - 1 do
  begin
    if (i <> goalIdx) then
    begin
      ReadLn(input, title);
      ReadLn(input, desc);
      myMaze[i] := CreateRoom(title, desc, false);
    end
    else
    begin
      ReadLn(input, title);
      ReadLn(input, desc);
      myMaze[i] := CreateRoom(title, desc, true);
    end;
  end;
  
  

  ReadLn(input, exitCount);
  WriteLn('There are ', exitCount, ' paths in the maze...');
  
  for i := 0 to exitCount-1 do
  begin
    ReadLn(input, fromRoom, space, toRoom, space, dir);
    //dir := DirToString(dir);
  
  // last thing to add here.
   AddDoor(myMaze[fromRoom].doors.heading, dir , myMaze[toRoom].doors.destination);
    
    //WriteLn('Exit from ', fromRoom, ' to ', toRoom, ' -> ', dir);
  end;
  
  Close(input);  
end;

procedure DemoFileReading(filename: String);
var
  input: Text;
  space, dir: Char;
  title, desc: String;
  roomCount, exitCount, goalIdx: Integer;
  i, fromRoom, toRoom: Integer;
begin
  Assign(input, filename);
  Reset(input);
  
  // Read the 
  ReadLn(input, roomCount);
  WriteLn('There are ', roomCount, ' rooms in the maze...');
  
  ReadLn(input, goalIdx);
  WriteLn('The ', goalIdx, '''th room in the goal!');
  
  for i := 0 to roomCount - 1 do
  begin
    ReadLn(input, title);
    ReadLn(input, desc);
    
    WriteLn('Room ', i + 1, ' is ', title, ' -> ', desc);
  end;
  
  ReadLn(input, exitCount);
  WriteLn('There are ', exitCount, ' paths in the maze...');
    
  for i := 0 to exitCount -1 do
  begin
    ReadLn(input, fromRoom, toRoom, space, dir);
    WriteLn('Exit from ', fromRoom, ' to ', toRoom, ' -> ', dir);
  end;
  
  Close(input);
end;

procedure Main();
var
  myMaze : maze;
  player : RoomPtr;
  option : Integer;
begin
  // Write the Loadmaze procedure
  LoadMaze('maze.txt', myMaze);
  
  
  // SetLength(myMaze,2);
  //   myMaze[0] := CreateRoom('Room 1', 'This is room 1...',false);
  //   myMaze[1] := CreateRoom('Room 2', 'This is room 2...',false);
  //   myMaze[2] := CreateRoom('Room 3', 'You escaped the Maze',true);
  //   // 
  //   AddDoor(myMaze[0], North, myMaze[1]);
  //   AddDoor(myMaze[0], South, myMaze[0]);
  //   AddDoor(myMaze[1], South, myMaze[0]);
  //   AddDoor(myMaze[1], South, myMaze[2]);
	WriteLn('------------------------------------------------');
  player := myMaze[0];
 repeat
  DisplayRoom(player);
  Write('Take exit: ');
  ReadLn(option);
  player := player^.doors[option- 1].destination;
 until player^.IsGoal;
	WriteLn('------------------------------------------------');
	DisplayRoom(player);
end;

begin
  //DemoFileReading('Maze.txt');
  Main();
end.