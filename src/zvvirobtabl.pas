unit zvvirobtabl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Grids, DBGrids, Buttons;

type
  TfrmZvVirobTabl = class(TForm)
    Label1: TLabel;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    btnApply: TBitBtn;
    Timer1: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDeactivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmZvVirobTabl: TfrmZvVirobTabl;

implementation

uses datazv;

{$R *.DFM}

procedure TfrmZvVirobTabl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  datazvit.tblVirob.ApplyUpdates;
  frmZvVirobTabl.Free;
end;

procedure TfrmZvVirobTabl.FormDeactivate(Sender: TObject);
begin
  frmZvVirobTabl.Close;
end;

procedure TfrmZvVirobTabl.Timer1Timer(Sender: TObject);
begin
  btnApply.Visible:=True;
end;

procedure TfrmZvVirobTabl.btnApplyClick(Sender: TObject);
begin
//  datazvit.tblVirob.ApplyUpdates;
  Timer1.Interval:=120000;
  btnApply.Visible:=False;
end;

end.
