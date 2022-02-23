unit OtherUnit;

interface
uses
  Forms, Classes;

implementation

procedure CreateOneForm(SenderType: TComponentClass; Sender: TForm);
var
  i : integer;
  Create : Boolean;
begin
  Create:=False;
  for i:=0 to Screen.FormCount-1 do
    if Sender.Name=Screen.Forms[i].Name then begin
      Screen.Forms[i].SetFocus;
      Create:=True;
    end;
  if Create=False then
    Application.CreateForm(SenderType, Sender.Name);
end;
end.
 