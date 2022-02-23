unit PrintDialog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfrmDialog = class(TForm)
    Label1: TLabel;
    edYear: TEdit;
    Label2: TLabel;
    edKolvo: TEdit;
    btnOk: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDialog: TfrmDialog;

implementation

uses PrintZvitVirob;

{$R *.DFM}

procedure TfrmDialog.btnOkClick(Sender: TObject);
begin
  frmDialog.Close;
end;

procedure TfrmDialog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qrPrintZvitVirob.lblYear.Caption:=edYear.Text;
  qrPrintZvitVirob.lblKolvo.Caption:=edKolvo.Text;
  //  Application.CreateForm(TfrmDialog, frmDialog);
//  qrPrintZvitVirob.Free;
end;

end.
