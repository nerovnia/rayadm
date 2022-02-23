unit dovidnik;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, DBCtrls, db;

type
  TfrmSprav = class(TForm)
    Label1: TLabel;
    grdSprav: TDBGrid;
    btnSave: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure CancelUpdateSpravRecord;
    procedure SaveOrCancel;
    procedure btnSaveClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSprav: TfrmSprav;

implementation

uses datadovidnik, MainBase, ZvVirobDop;

{$R *.DFM}

procedure TfrmSprav.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TableClose;
  TableOpen;
  Action := caFree;
end;

procedure TfrmSprav.FormCreate(Sender: TObject);
begin
  datadovid.tblGosp.First;
end;

procedure TfrmSprav.FormDeactivate(Sender: TObject);
begin
  SaveOrCancel;
  Close;
end;

procedure TfrmSprav.SaveOrCancel;
begin
  if dataDovid.tblGosp.Modified then begin
    if MessageDlg('«берегти зм≥ни по господарствам', mtConfirmation, mbOKCancel, 0)=mrOk then
      UpdateSpravRecord
    else
      CancelUpdateSpravRecord;
  end;
end;

procedure TfrmSprav.CancelUpdateSpravRecord;
begin
  dataDovid.tblGosp.FlushBuffers;
end;

procedure TfrmSprav.btnSaveClick(Sender: TObject);
begin
  UpdateSpravRecord;
  SaveBuffers;
end;
procedure TfrmSprav.FormResize(Sender: TObject);
begin
  grdSprav.Width:=frmSprav.Width-30;
  grdSprav.Height:=frmSprav.Height-btnSave.Height-60;
  grdSprav.Columns[1].Width:=grdSprav.Width-grdSprav.Columns[0].Width-35;
  btnSave.Left:=grdSprav.Left+grdSprav.Width-btnSave.Width;
  btnSave.Top:=frmSprav.Height-btnSave.Height-30;
end;

procedure TfrmSprav.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  SaveOrCancel;
end;

end.
