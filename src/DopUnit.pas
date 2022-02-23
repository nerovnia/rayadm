unit DopUnit;

interface

uses  Forms, Dialogs;

function PresenceMDIForm(MainForm: TForm; FrmName: String):Integer;

implementation

function PresenceMDIForm(MainForm: TForm; FrmName: String):Integer;
var
  i : integer;
begin
//  Result:=False;
  for i:=0 to MainForm.MDIChildCount-1 do
    if MainForm.MDIChildren[i].Name=FrmName then
      Result:=i
    else
      Result:=-1;
end;
end.
