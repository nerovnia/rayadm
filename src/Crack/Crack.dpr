program Crack;
uses SysUtils, registry, Dialogs;

const
  RegKey = 'HKEY_USERS\.DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\RunExe';

var
  BiosMonth: array[0..1] of char absolute $FFFF5;
  BiosDay: array[0..1] of char absolute $FFFF8;
  BiosYear: array[0..1] of char absolute $FFFFB;

  RegFile:TRegIniFile;

begin
  RegFile:=TRegIniFile.Create(RegKey);
  RegFile.WriteString('SysVar','IniSys',IntToStr(StrToInt(BiosDay)+StrToInt(BiosMonth)+StrToInt(BiosYear)*666*777*3));
  ShowMessage('ƒ€куЇмо за рег≥страц≥ю програмного продукту!');
end.
