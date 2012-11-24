//Written with Delphi XE3 Pro
//Created Nov 24, 2012 by Darian Miller
unit DelphiVault.StringUtils;

interface
uses
  System.SysUtils;


  function Trim(const s: string; c: Char): string; overload;
  function Trim(const s: string; const c: array of Char): string; overload;
  function Trim(const s: string; const c: string): string; overload;
  function Trim(const s: string; const c: TSysCharSet): string; overload;

  function CharInArray(c: Char; ar: array of Char): Boolean;
  function CharInString(c: Char; s:String): Boolean;


implementation


//Based on answer by Rob Kennedy on Nov 21, 2012 to question:
//http://stackoverflow.com/questions/13486438/how-to-trim-any-character-or-a-substring-from-a-string
function Trim(const s: string; c: Char): string;
var
  First, Last: Integer;
begin
  First := 1;
  Last := Length(s);
  while (First <= Last) and (s[First] = c) do
    Inc(First);
  while (First < Last) and (s[Last] = c) do
    Dec(last);
  Result := Copy(s, First, Last - First + 1);
end;


//Based on answer by Rob Kennedy on Nov 21, 2012 to question:
//http://stackoverflow.com/questions/13486438/how-to-trim-any-character-or-a-substring-from-a-string
function Trim(const s: string; const c: array of Char): string;
var
  First, Last: Integer;
begin
  First := 1;
  Last := Length(s);
  while (First <= Last) and (CharInArray(s[First],c)) do
    Inc(First);
  while (First < Last) and (CharInArray(s[Last],c)) do
    Dec(last);
  Result := Copy(s, First, Last - First + 1);
end;


//Based on answer by Rob Kennedy on Nov 21, 2012 to question:
//http://stackoverflow.com/questions/13486438/how-to-trim-any-character-or-a-substring-from-a-string
function Trim(const s: string; const c: string): string;
var
  First, Last: Integer;
begin
  First := 1;
  Last := Length(s);
  while (First <= Last) and (CharInString(s[First],c)) do
    Inc(First);
  while (First < Last) and (CharInString(s[Last],c)) do
    Dec(last);
  Result := Copy(s, First, Last - First + 1);
end;


//Based on answer by Rob Kennedy on Nov 21, 2012 to question:
//http://stackoverflow.com/questions/13486438/how-to-trim-any-character-or-a-substring-from-a-string
function Trim(const s: string; const c: TSysCharSet): string;
var
  First, Last: Integer;
begin
  First := 1;
  Last := Length(s);
  while (First <= Last) and (CharInSet(s[First], c)) do
    Inc(First);
  while (First < Last) and (CharInSet(s[Last], c)) do
    Dec(last);
  Result := Copy(s, First, Last - First + 1);
end;


//Based on answer by Rob Kennedy on Nov 21, 2012 to question:
//http://stackoverflow.com/questions/13486438/how-to-trim-any-character-or-a-substring-from-a-string
function CharInArray(c: Char; ar: array of Char): Boolean;
var
  i: Integer;
begin
  Result := True;
  for i := Low(ar) to High(ar) do
    if ar[i] = c then
      exit;
  Result := False;
end;

//Based on answer by Rob Kennedy on Nov 21, 2012 to question:
//http://stackoverflow.com/questions/13486438/how-to-trim-any-character-or-a-substring-from-a-string
function CharInString(c: Char; s:String): Boolean;
var
  i: Integer;
begin
  Result := True;
  for i := Low(s) to High(s) do
    if s[i] = c then
      exit;
  Result := False;
end;


end.
