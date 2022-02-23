library mysys;

uses
  SysUtils, registry,
  Classes;

{$R *.RES}

function License : boolean; StdCall;
const
  RegKey = 'HKEY_USERS\.DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\RunExe';

var
  BiosMonth: array[0..1] of char absolute $FFFF5;
  BiosDay: array[0..1] of char absolute $FFFF8;
  BiosYear: array[0..1] of char absolute $FFFFB;
  RegFile:TRegIniFile;

  Day, Month, Year : Word;
begin
  DecodeDate(Date, Year, Month, Day);
  RegFile:=TRegIniFile.Create(RegKey);
  if (Day<2)or(Month<7)or(Year<4)then
    if RegFile.ReadString('SysVar','IniSys','')=IntToStr(StrToInt(BiosDay)+StrToInt(BiosMonth)+StrToInt(BiosYear)*666*777*3) then
      result:=True
    else
      result:=False
  else
    result:=False;
end;

exports
  License;
end.
