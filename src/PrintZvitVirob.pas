unit PrintZvitVirob;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrPrintZvitVirob = class(TQuickRep)
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    TitleBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape2: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel2: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    lblYear: TQRLabel;
    lblKolvo: TQRLabel;
    procedure QuickRepAfterPreview(Sender: TObject);
    procedure QuickRepStartPage(Sender: TCustomQuickRep);
  private

  public

  end;

var
  qrPrintZvitVirob: TqrPrintZvitVirob;

implementation

uses datazv, PrintDialog, zvvirob, datadovidnik;

{$R *.DFM}

procedure TqrPrintZvitVirob.QuickRepAfterPreview(Sender: TObject);
begin
  qrPrintZvitVirob.Free;
  qrPrintZvitVirob:=nil;
end;

procedure TqrPrintZvitVirob.QuickRepStartPage(Sender: TCustomQuickRep);
begin
  lblYear.Caption:=frmZvVirob.edYear.Text;
  lblKolvo.Caption:=frmZvVirob.edKolvo.Text;
end;

end.
