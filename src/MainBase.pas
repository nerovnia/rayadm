unit MainBase;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TMainDataModule = class(TDataModule)
    MainDatabase: TDatabase;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    pathApp : PChar;
    { Public declarations }
  end;

var
  MainDataModule: TMainDataModule;

implementation

{$R *.DFM}

procedure TMainDataModule.DataModuleCreate(Sender: TObject);
begin
  MainDatabase.Params.Clear;
  MainDatabase.Params.Add('PATH='+ExtractFilePath(Application.ExeName)+'Base');
  MainDatabase.Params.Add('DEFAULT DRIVER=PARADOX');
  MainDatabase.Params.Add('ENABLE BCD=FALSE');
  pathApp:=StrNew(PChar(ExtractFilePath(Application.ExeName)));
end;

end.
