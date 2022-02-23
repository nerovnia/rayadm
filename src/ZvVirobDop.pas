unit ZvVirobDop;
interface

uses dbtables;

  procedure Zvit1;
  procedure Zvit2(SetTable: TTable);
  procedure Zvit3(SetTable: TTable);
  procedure Zvit4(SetTable: TTable);
  procedure SaveBuffers;
  procedure UpdateSpravRecord;
  procedure UpdateSpravRecordAll;
  procedure FilterZvVirob(FilterStr: String);
  procedure FilterZvZatrVir(FilterStr: String);
  procedure FilterFinRez(FilterStr: String);
  procedure FilterZemlekorist(FilterStr: String);
  procedure TableClose;
  procedure TableOpen;

implementation
uses PrintZvitVirob, datadovidnik, Classes,zvvirob, Dialogs, dataZv, MainBase;

  const arrayVidProd : array[0..31,0..1] of String = (
      ('1. ������ֲ� ������������ - ������ (���� ����� 0020, 0040-0120)','0010'),
      ('� ���� ����: ������ � ���������� - ������','0020'),
      ('� ���: ������� �����','0025'),
      ('��������� �� �����','0030'),
      ('������ ���������','0040'),
      ('������ ������ (�������)','0050'),
      ('��������','0060'),
      ('����� ��������� ������','0070'),
      ('����� (���������, ��������)','0080'),
      ('��������','0090'),
      ('�������','0095'),
      ('����','0100'),
      ('������ ���������� � ������� ������','0105'),
      ('�����������','0107'),
      ('����������','0110'),
      ('���� ��������� ������������','0120'),
      ('2. ������ֲ� ������������ - ������','0130'),
      ('� ���� ����: ����������� ������ �� ����� (� ���� ���): ������ ������ ������','0140'),
      ('������','0150'),
      ('����� �� ��','0160'),
      ('�����','0170'),
      ('������','0180'),
      ('�����','0190'),
      ('���� ������ (���. ����)','0200'),
      ('���� ��������� ������������','0210'),
      ('3. ������ֲ� �����ί ���������ί ��������� - ������','0220'),
      ('� ���� ����: ������, ��� ������� ��������� �� ��������������','0230'),
      ('�''���, �������� �� ����� ������ � �����','0240'),
      ('��������� ��������� ���������� � �������� (��� ��������� ��������� ���������������)','0250'),
      ('4. ���˲��ֲ� ����� � ������ �� �������','0260'),
      ('������ �� ϲ���Ȫ����� (���. 0010+���.0130+���.0220+���.0260)','0270'),
      ('�� 1 (� ���.0010 �� ���.0270, ��.1 - 6)','0500'));

  const arrayZatrVir : array[0..18,0..1] of String = (
      ('������� �� ������ �����','0280' ),
      ('³���������� �� �������� ������','0285'),
      ('��������� �������, �� ������ � ���������� ��������� (���� ���� 0295-0335)','0290'),
      ('� ���� ����: ������ �� ���������� �������','0295'),
      ('�����','0300'),
      ('� ���� ���� ����� ������','0301'),
      ('���� ��������� ��������� ������������ (���, ��������, ���� ��� ���������)','0305'),
      ('�������� �������','0310'),
      ('�������������','0315'),
      ('�������������','0320'),
      ('������','0325'),
      ('������ �������, ������� �� �������� �������� ��� �������','0330'),
      ('������ ������ � ����, �� ������� ��������� ������������, �� ���� ��������� �������','0335'),
      ('����������� �������� ������','0340'),
      ('���� ������� (��������� ������ �� ������)','0345'),
      ('� ���� ���� ������� ����� ��: ������� ������ (��)','0350'),
      ('������ ��','0351'),
      ('������ ����������� ������ (���� ���� 0280, 0285, 0290, 0340, 1345)','0355'),
      ('�� 2 (� ���. 0280 - ���. 0355 ��. 1-3)','0510'));

  const arrayFinRez : array[0..15,0..2] of String = (
      ('���������� �� ��������� ��������� (����, ������) (���. 0270 ��.6-��.5) �������: - ��������','0360','���.���.'),
      ('- ������','0365','���.���.'),
      ('���� ��������� ������','0366','���.���.'),
      ('������������ �������','0367','���.���.'),
      ('������� �� ����','0368','���.���.'),
      ('- ������','0365','���.���.'),
      ('���� ��������� �������','0369','���.���.'),
      ('- ������','0365','���.���.'),
      ('���� ������ �� �������: - ������ (��������)','0370','���.���.'),
      ('- ������ (������)','0375','���.���.'),
      ('������: - ��������','0380','���.���.'),
      ('- ������','0385','���.���.'),
      ('������������ ������� ������','0395','���.���.'),
      ('��������������� ���������� ����������, �������� � ��������������������� ����������, ��� ���������� ������������� ����� - ������','0400','���.'),
      ('� ���� ����: � �����������','0410','���.'),
      ('� �����������','0411','���.'));

  const arrayZemlekorist : array[0..3,0..1] of String = (
      ('������ �������������������� ����','0450'),
      ('� ���� ����: ����','0451'),
      ('�������','0452'),
      ('��������','0453'));

procedure Zvit1;
begin
  qrPrintZvitVirob.QRLabel4.Enabled:=False;
  qrPrintZvitVirob.QRLabel5.Enabled:=False;
  qrPrintZvitVirob.QRLabel6.Enabled:=False;
  qrPrintZvitVirob.QRLabel3.Enabled:=False;
  qrPrintZvitVirob.QRLabel10.Enabled:=False;
  qrPrintZvitVirob.QRLabel11.Enabled:=False;
  qrPrintZvitVirob.QRLabel13.Enabled:=False;
  qrPrintZvitVirob.QRLabel7.Top:=0;
  qrPrintZvitVirob.QRLabel7.Caption:='2. ������� �����ֲ��ί Ĳ������Ҳ';
  qrPrintZvitVirob.QRLabel1.Caption:='�������� ������';
  qrPrintZvitVirob.QRLabel9.Caption:='������ �� ���������� ��������';
  qrPrintZvitVirob.QRLabel2.Caption:='� ���� ���� �� ���������';
  qrPrintZvitVirob.QRLabel12.Caption:='������������';
  qrPrintZvitVirob.QRLabel14.Caption:='������������';
  qrPrintZvitVirob.QRLabel13.Visible:=False;
  qrPrintZvitVirob.QRLabel9.Left:=288;
  qrPrintZvitVirob.QRLabel9.Height:=33;
  qrPrintZvitVirob.QRLabel9.Top:=40;
  qrPrintZvitVirob.QRLabel8.Left:=224;
  qrPrintZvitVirob.QRLabel9.Width:=167;
  qrPrintZvitVirob.QRLabel12.Width:=105;
  qrPrintZvitVirob.QRLabel14.Left:=576;
  qrPrintZvitVirob.QRLabel14.Width:=105;
  qrPrintZvitVirob.QRLabel16.Left:=232;
  qrPrintZvitVirob.QRLabel15.Left:=88;
  qrPrintZvitVirob.QRLabel19.Enabled:=False;
  qrPrintZvitVirob.QRLabel18.Left:=372;
  qrPrintZvitVirob.QRLabel18.Caption:='1';
  qrPrintZvitVirob.QRLabel21.Enabled:=False;
  qrPrintZvitVirob.QRLabel20.Left:=508;
  qrPrintZvitVirob.QRLabel22.Left:=625;
  qrPrintZvitVirob.QRLabel20.Caption:='2';
  qrPrintZvitVirob.QRLabel22.Caption:='3';
  qrPrintZvitVirob.QRLabel14.Width:=105;
  qrPrintZvitVirob.QRLabel17.Enabled:=False;
  qrPrintZvitVirob.QRLabel1.Width:=145;
  qrPrintZvitVirob.QRShape1.Enabled:=False;
  qrPrintZvitVirob.QRShape6.Enabled:=False;
  qrPrintZvitVirob.QRShape11.Enabled:=False;
  qrPrintZvitVirob.QRShape12.Left:=571;
  qrPrintZvitVirob.QRShape23.Left:=571;
  qrPrintZvitVirob.QRShape20.Enabled:=False;
  qrPrintZvitVirob.QRShape17.Enabled:=False;
  qrPrintZvitVirob.QRShape9.Enabled:=False;
  qrPrintZvitVirob.QRDBText2.Enabled:=False;
  qrPrintZvitVirob.QRDBText1.Width:=176;
  qrPrintZvitVirob.QRDBText5.Enabled:=False;
  qrPrintZvitVirob.QRDBText2.Width:=169;
  qrPrintZvitVirob.QRShape22.Enabled:=False;
  qrPrintZvitVirob.QRDBText7.Enabled:=False;
  qrPrintZvitVirob.QRDBText6.Width:=106;
  qrPrintZvitVirob.QRDBText8.Left:=575;
  qrPrintZvitVirob.QRDBText8.Width:=106;
  qrPrintZvitVirob.QRDBText3.Alignment:=taCenter;
  qrPrintZvitVirob.QRDBText3.DataField:='Code';
  qrPrintZvitVirob.QRDBText4.DataField:='C1';
  qrPrintZvitVirob.QRDBText4.Width:=169;
  qrPrintZvitVirob.QRDBText6.DataField:='C2';
  qrPrintZvitVirob.QRDBText8.DataField:='C3';
  qrPrintZvitVirob.TitleBand1.Height:=19;
  qrPrintZvitVirob.QRDBText2.DataField:='C1';
  qrPrintZvitVirob.QRDBText4.DataField:='C1';
  qrPrintZvitVirob.QRDBText5.DataField:='C1';
  qrPrintZvitVirob.QRDBText6.DataField:='C1';
  qrPrintZvitVirob.QRDBText7.DataField:='C1';
  qrPrintZvitVirob.QRDBText8.DataField:='C1';
end;

procedure Zvit2(SetTable: TTable);
begin
  qrPrintZvitVirob.DataSet:=SetTable;
  qrPrintZvitVirob.QRDBText1.DataSet:=SetTable;
  qrPrintZvitVirob.QRDBText2.DataSet:=SetTable;
  qrPrintZvitVirob.QRDBText3.DataSet:=SetTable;
  qrPrintZvitVirob.QRDBText4.DataSet:=SetTable;
  qrPrintZvitVirob.QRDBText5.DataSet:=SetTable;
  qrPrintZvitVirob.QRDBText6.DataSet:=SetTable;
  qrPrintZvitVirob.QRDBText7.DataSet:=SetTable;
  qrPrintZvitVirob.QRDBText8.DataSet:=SetTable;
  qrPrintZvitVirob.QRDBText4.DataField:='C1';
  qrPrintZvitVirob.QRDBText6.DataField:='C2';
  qrPrintZvitVirob.QRDBText8.DataField:='C3';
end;

procedure Zvit3(SetTable: TTable);
begin
  qrPrintZvitVirob.DataSet:=SetTable;
  qrPrintZvitVirob.QRDBText1.DataSet:=SetTable;
  qrPrintZvitVirob.QRDBText2.DataSet:=SetTable;
  qrPrintZvitVirob.QRDBText3.DataSet:=SetTable;
  qrPrintZvitVirob.QRDBText4.DataSet:=SetTable;
  qrPrintZvitVirob.QRDBText5.DataSet:=SetTable;
  qrPrintZvitVirob.QRDBText6.DataSet:=SetTable;
  qrPrintZvitVirob.QRDBText7.DataSet:=SetTable;
  qrPrintZvitVirob.QRDBText8.DataSet:=SetTable;
  qrPrintZvitVirob.QRDBText4.DataField:='EdIzm';
  qrPrintZvitVirob.QRDBText4.Alignment:=taCenter;
  qrPrintZvitVirob.QRDBText6.DataField:='C1';
  qrPrintZvitVirob.QRLabel7.Caption:='3. Բ�����² ����������';
  qrPrintZvitVirob.QRLabel1.Caption:='����� ���������';
  qrPrintZvitVirob.QRLabel9.Caption:='������� �����';
  qrPrintZvitVirob.QRLabel22.Enabled:=False;
  qrPrintZvitVirob.QRLabel12.Caption:='������';
  qrPrintZvitVirob.QRLabel12.Width:=217;
  qrPrintZvitVirob.QRLabel20.Left:=566;
  qrPrintZvitVirob.QRDBText6.Width:=218;
  qrPrintZvitVirob.QRLabel2.Enabled:=False;
  qrPrintZvitVirob.QRLabel14.Enabled:=False;
  qrPrintZvitVirob.QRShape14.Enabled:=False;
  qrPrintZvitVirob.QRShape12.Enabled:=False;
  qrPrintZvitVirob.QRShape23.Enabled:=False;
  qrPrintZvitVirob.QRDBText8.Enabled:=False;
end;

procedure Zvit4(SetTable: TTable);
begin
  qrPrintZvitVirob.QRLabel7.Caption:='4. ����������������� �� 1 Ѳ��� '+frmZvVirob.edYear.Text+'����';
  qrPrintZvitVirob.QRLabel1.Caption:='';
  qrPrintZvitVirob.QRLabel9.Caption:='������';
  qrPrintZvitVirob.QRLabel12.Caption:='� ���� ���� ����� � ������';
  qrPrintZvitVirob.QRDBText4.Alignment:=taRightJustify;
  qrPrintZvitVirob.DataSet:=SetTable;
  qrPrintZvitVirob.QRDBText1.DataSet:=SetTable;
  qrPrintZvitVirob.QRDBText2.DataSet:=SetTable;
  qrPrintZvitVirob.QRDBText3.DataSet:=SetTable;
  qrPrintZvitVirob.QRDBText4.DataSet:=SetTable;
  qrPrintZvitVirob.QRDBText5.DataSet:=SetTable;
  qrPrintZvitVirob.QRDBText6.DataSet:=SetTable;
  qrPrintZvitVirob.QRDBText7.DataSet:=SetTable;
  qrPrintZvitVirob.QRDBText8.DataSet:=SetTable;
  qrPrintZvitVirob.QRDBText4.DataField:='C1';
  qrPrintZvitVirob.QRDBText6.DataField:='C2';
end;

procedure SaveBuffers;
begin
  datadovid.tblGosp.ApplyUpdates;
  datadovid.tblGosp.FlushBuffers;
  datadovid.tblVirob.ApplyUpdates;
  datadovid.tblVirob.FlushBuffers;
  datadovid.tblZatrVir.ApplyUpdates;
  datadovid.tblZatrVir.FlushBuffers;
  datadovid.tblFinRez.ApplyUpdates;
  datadovid.tblFinRez.FlushBuffers;
  datadovid.tblZemlekorist.ApplyUpdates;
  datadovid.tblZemlekorist.FlushBuffers;

  datadovid.tblGospAll.ApplyUpdates;
  datadovid.tblGospAll.FlushBuffers;
  datadovid.tblVirobAll.ApplyUpdates;
  datadovid.tblVirobAll.FlushBuffers;
  datadovid.tblZatrVirAll.ApplyUpdates;
  datadovid.tblZatrVirAll.FlushBuffers;
  datadovid.tblFinRezAll.ApplyUpdates;
  datadovid.tblFinRezAll.FlushBuffers;
  datadovid.tblZemlekoristAll.ApplyUpdates;
  datadovid.tblZemlekoristAll.FlushBuffers;
end;

procedure UpdateSpravRecord;
var
  i                  : integer;
begin
  with dataDovid.tblGosp do begin
    ApplyUpdates;
    Close;
    Open;
//    Close; Open;
    ShowMessage('------------------------');
    Filter:='CreateZvEkPok=True';
    Filtered:=True;
//    Filter:='CreateZvEkPok=True';
    First;
    while not Eof do begin
      for i:=0 to 31 do begin
        dataDovid.tblVirob.Append;
        dataDovid.tblVirob.Edit;
        dataDovid.tblVirob['VidProd']:=arrayVidProd[i,0];
        dataDovid.tblVirob['Code']:=arrayVidProd[i,1];
        dataDovid.tblVirob.Post;
        if i<18 then begin
          dataDovid.tblZatrVir.Append;
          dataDovid.tblZatrVir.Edit;
          dataDovid.tblZatrVir['VidProd']:=arrayZatrVir[i,0];
          dataDovid.tblZatrVir['Code']:=arrayZatrVir[i,1];
          dataDovid.tblZatrVir.Post;
        end;
        if i<15 then begin
          dataDovid.tblFinRez.Append;
          dataDovid.tblFinRez.Edit;
          dataDovid.tblFinRez['VidProd']:=arrayFinRez[i,0];
          dataDovid.tblFinRez['Code']:=arrayFinRez[i,1];
          dataDovid.tblFinRez['EdIzm']:=arrayFinRez[i,2];
          dataDovid.tblFinRez.Post;
        end;
        if i<4 then begin
          dataDovid.tblZemlekorist.Append;
          dataDovid.tblZemlekorist.Edit;
          dataDovid.tblZemlekorist['VidProd']:=arrayZemlekorist[i,0];
          dataDovid.tblZemlekorist['Code']:=arrayZemlekorist[i,1];
          dataDovid.tblZemlekorist.Post;
        end;
      end;
      Edit;
      FieldValues['CreateZvEkPok']:=False;
      Post;
//      Next;
    end;
    Filtered:=False;
//    SaveBuffers;
{    dataDovid.tblVirob.ApplyUpdates;
    dataDovid.tblVirob.Close;
    dataDovid.tblVirob.Open;
    dataDovid.tblZatrVir.ApplyUpdates;
    dataDovid.tblZatrVir.Close;
    dataDovid.tblZatrVir.Open;
    dataDovid.tblFinRez.ApplyUpdates;
    dataDovid.tblFinRez.Close;
    dataDovid.tblFinRez.Open;
    dataDovid.tblZemlekorist.ApplyUpdates;
    dataDovid.tblZemlekorist.Close;
    dataDovid.tblZemlekorist.Open;
}
  end;
end;


procedure UpdateSpravRecordAll;
var
  i                  : integer;

begin
  for i:=0 to 31 do begin
    dataDovid.tblVirobAll.Append;
    dataDovid.tblVirobAll.Edit;
    dataDovid.tblVirobAll['VidProd']:=arrayVidProd[i,0];
    dataDovid.tblVirobAll['Code']:=arrayVidProd[i,1];
    dataDovid.tblVirobAll.Post;
    if i<18 then begin
      dataDovid.tblZatrVirAll.Append;
      dataDovid.tblZatrVirAll.Edit;
      dataDovid.tblZatrVirAll['VidProd']:=arrayZatrVir[i,0];
      dataDovid.tblZatrVirAll['Code']:=arrayZatrVir[i,1];
      dataDovid.tblZatrVirAll.Post;
    end;
    if i<15 then begin
      dataDovid.tblFinRezAll.Append;
      dataDovid.tblFinRezAll.Edit;
      dataDovid.tblFinRezAll['VidProd']:=arrayFinRez[i,0];
      dataDovid.tblFinRezAll['Code']:=arrayFinRez[i,1];
      dataDovid.tblFinRezAll['EdIzm']:=arrayFinRez[i,2];
      dataDovid.tblFinRezAll.Post;
    end;
    if i<4 then begin
      dataDovid.tblZemlekoristAll.Append;
      dataDovid.tblZemlekoristAll.Edit;
      dataDovid.tblZemlekoristAll['VidProd']:=arrayZemlekorist[i,0];
      dataDovid.tblZemlekoristAll['Code']:=arrayZemlekorist[i,1];
      dataDovid.tblZemlekoristAll.Post;
    end;
  end;
  SaveBuffers;
end;

procedure FilterZvVirob(FilterStr: String);
begin
  datadovid.qryObZvit.SQL.Add('SELECT DISTINCT d.Cod, d.Referential, d.Vidprod, d.Zaglavie, d.Code, d.C1, d.C2, d.C3, d.C4, d.C5, d.C6, d1.Cod, d1.PorNom, d1.Name');
  datadovid.qryObZvit.SQL.Add('FROM "Zvvirob.db" d, "Gosp.db" d1');
  datadovid.qryObZvit.SQL.Add('WHERE');
  datadovid.qryObZvit.SQL.Add('(d1.Cod = d.Referential and d.Code='''+ FilterStr +''')');
  datadovid.qryObZvit.SQL.Add('ORDER BY d.Cod, d.Referential, d.Vidprod, d.Zaglavie, d.Code, d.C1, d.C2, d.C3, d.C4, d.C5, d.C6, d1.Cod, d1.PorNom, d1.Name');
end;

procedure FilterZvZatrVir(FilterStr: String);
begin
  ZvVirobDop.Zvit1;
  ZvVirobDop.Zvit2(DataDovid.tblZatrVir);
  datadovid.qryObZvit.SQL.Add('SELECT DISTINCT d1.Name, D.Vidprod, D.Code, D.C1, D.C2, D.C3');
  datadovid.qryObZvit.SQL.Add('FROM "Gosp.db" d1, "zvzatrvir.DB" D');
  datadovid.qryObZvit.SQL.Add('WHERE');
  datadovid.qryObZvit.SQL.Add('(d1.Cod = D.Referential and d.Code='''+ FilterStr +''')');
  datadovid.qryObZvit.SQL.Add('ORDER BY d1.Name, D.Vidprod, D.Code, D.C1, D.C2, D.C3');
end;

procedure FilterFinRez(FilterStr: String);
begin
  ZvVirobDop.Zvit1;
  ZvVirobDop.Zvit3(DataDovid.tblFinRez);
  datadovid.qryObZvit.SQL.Add('SELECT DISTINCT D.Vidprod, D.Code, D.EdIzm, D.C1, d1.Name');
  datadovid.qryObZvit.SQL.Add('FROM "Finrez.DB" D, "Gosp.db" d1');
  datadovid.qryObZvit.SQL.Add('WHERE');
  datadovid.qryObZvit.SQL.Add('(d1.Cod = D.Referential and d.Code='''+ FilterStr +''')');
  datadovid.qryObZvit.SQL.Add('ORDER BY D.Vidprod, D.Code, D.EdIzm, D.C1, d1.Name');
end;

procedure FilterZemlekorist(FilterStr: String);
begin
  ZvVirobDop.Zvit1;
  ZvVirobDop.Zvit3(DataDovid.tblFinRez);
  ZvVirobDop.Zvit4(DataDovid.tblZemlekorist);
  datadovid.qryObZvit.SQL.Add('SELECT DISTINCT D.Code, D.C1, D.C2, d1.Name');
  datadovid.qryObZvit.SQL.Add('FROM "zemlekorist.DB" D, "Gosp.db" d1');
  datadovid.qryObZvit.SQL.Add('WHERE');
  datadovid.qryObZvit.SQL.Add('(d1.Cod = D.Referential and d.Code='''+ FilterStr +''')');
  datadovid.qryObZvit.SQL.Add('ORDER BY D.Code, D.C1, D.C2, d1.Name');
end;

procedure TableClose;
begin
  dataZvit.tblGosp.Close;
  dataZvit.tblVirobOb.Close;
  dataDovid.tblVirobAll.Close;
  dataDovid.tblZatrVirAll.Close;
  dataDovid.tblFinRezAll.Close;
  dataDovid.tblZemlekoristAll.Close;
  dataDovid.tblGospAll.Close;

  dataZvit.tblGosp.Close;
  dataZvit.tblVirobOb.Close;
  dataDovid.tblVirob.Close;
  dataDovid.tblZatrVir.Close;
  dataDovid.tblFinRez.Close;
  dataDovid.tblZemlekorist.Close;
  dataDovid.qryObZvit.Close;
  dataDovid.tblGosp.Close;
  MainDataModule.MainDatabase.Close;
end;

procedure TableOpen;
begin
  dataDovid.tblGosp.Active:=True;
  dataDovid.tblVirob.Active:=True;
  dataDovid.tblZatrVir.Active:=True;
  dataDovid.tblFinRez.Active:=True;
  dataDovid.tblZemlekorist.Active:=True;
  dataDovid.qryObZvit.Active:=True;
// ----------------------------------------------------
  dataDovid.tblGospAll.Active:=True;
  dataDovid.tblGospAll.Active:=True;
  dataDovid.tblVirobAll.Active:=True;
  dataDovid.tblZatrVirAll.Active:=True;
  dataDovid.tblFinRezAll.Active:=True;
  dataDovid.tblZemlekoristAll.Active:=True;
end;

end.
