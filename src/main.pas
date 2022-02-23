unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ComCtrls;

type
  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    StatusBar1: TStatusBar;
    N6: TMenuItem;
    N7: TMenuItem;
    procedure N7Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses dovidnik, zvvirob, zvvirobtabl, datazv, datadovidnik, MainBase,
  ZvVirobDop;

{$R *.DFM}

procedure TfrmMain.N7Click(Sender: TObject);
begin
  Application.CreateForm(TfrmSprav, frmSprav)
end;

procedure TfrmMain.N4Click(Sender: TObject);
begin
  frmMain.Close;
end;

procedure TfrmMain.N8Click(Sender: TObject);
begin
  Application.CreateForm(TfrmZvVirobTabl, frmZvVirobTabl);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  MainDataModule.MainDatabase.Connected:=True;
//  dataZvit.tblGosp.Active:=True;
//  dataDovid.tblGospAll.Active:=True;
//  dataZvit.tblVirobOb.Active:=True;
//ShowMessage('----------');
  TableOpen;
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  Application.CreateForm(TfrmZvVirob, frmZvVirob);
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TableClose;
end;

end.
