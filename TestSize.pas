{$mode objfpc}
program TestSize;

type
  Friend = record
    name, phone: String;
    age: Integer;
  end;

var
  i: Integer;
  s: String;
  d: Double;
  
  ip: ^Integer;
  sp: ^String;
  dp: ^Double;
  
  f: Friend;
  fp: ^Friend;
  friends: array [0..9] of Friend;
  dynamFriend: array of Friend;
  
  nums: array [0..9] of Integer;

begin
  WriteLn('-------------------------------------------');
  WriteLn('Size of i is ', SizeOf(i));
  WriteLn('Size of s is ', SizeOf(s));
  WriteLn('Size of d is ', SizeOf(d));
  
  WriteLn('-------------------------------------------');
  WriteLn('Size of ip is ', SizeOf(ip));
  WriteLn('Size of sp is ', SizeOf(sp));
  WriteLn('Size of dp is ', SizeOf(dp));
  
  WriteLn('-------------------------------------------');
  WriteLn('Size of f is ', SizeOf(f));
  WriteLn('Size of fp is ', SizeOf(fp));
  
  WriteLn('-------------------------------------------');
  WriteLn('Size of nums is ', SizeOf(nums));
  WriteLn('Size of friends is ', SizeOf(friends));
  WriteLn('Size of dynamFriend is ', SizeOf(dynamFriend));
  
  WriteLn('-------------------------------------------');
  ip := @nums[0];
  WriteLn('nums[] is at address ', HexStr(Addr(nums)));
  WriteLn('ip points to ', HexStr(ip));
  ip := ip + 1;
  WriteLn('ip + 1 points to ', HexStr(ip));
  ip := ip + 1;
  WriteLn('ip + 2 points to ', HexStr(ip));
  ip := ip + 1;
  WriteLn('ip + 3 points to ', HexStr(ip));
  ip := ip + 17;
  WriteLn('ip + 20 points to ', HexStr(ip));
  
  WriteLn('-------------------------------------------');
  fp := @friends[0];
  WriteLn('friends[] is at address ', HexStr(Addr(friends)));
  WriteLn('fp points to ', HexStr(fp));
  fp := fp + 1;
  WriteLn('fp points to+1 ', HexStr(fp));
  fp := fp + 1;
  WriteLn('fp points to+1 ', HexStr(fp));
  fp := fp + 1;
  WriteLn('fp points to+1 ', HexStr(fp));
  
end.