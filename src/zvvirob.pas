//  Сохранение изменений в базе
// Table.FlushBuffers

unit zvvirob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, DBCtrls, ExtCtrls, DBCGrids, Mask, Grids, DBGrids, db;

type
  TfrmZvVirob = class(TForm)
    Label1: TLabel;
    ctrlZvVirob: TDBCtrlGrid;
    DBText1: TDBText;
    edEdit1: TDBEdit;
    edEdit2: TDBEdit;
    edEdit3: TDBEdit;
    edEdit4: TDBEdit;
    edEdit5: TDBEdit;
    edEdit6: TDBEdit;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Shape17: TShape;
    DBText2: TDBText;
    pZvVirob: TPanel;
    Shape18: TShape;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Shape19: TShape;
    Shape20: TShape;
    Shape21: TShape;
    Shape22: TShape;
    Shape23: TShape;
    Shape24: TShape;
    Shape25: TShape;
    Shape26: TShape;
    Shape27: TShape;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    btnRasch: TButton;
    btnPrint: TButton;
    lblZvVirob: TLabel;
    cmbGosp: TComboBox;
    edYear: TEdit;
    lblYear: TLabel;
    lblKolvo: TLabel;
    edKolvo: TEdit;
    btnSave: TButton;
    cmbOsnEkPok: TComboBox;
    Label2: TLabel;
    DBText3: TDBText;
    lbPrintZvit: TListBox;
    cmbTipZvit: TComboBox;
    lblVibFormZvit: TLabel;
    btnClear: TButton;
    procedure cmbGospChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnRaschClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditEnable;
    procedure EditDisable;
    procedure btnPrintClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure cmbOsnEkPokChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ctrlZvVirobKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnClearClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private

  end;

type
  DataLabel = record
    Name : string;
    Visible : boolean;
    Caption : string;
    Left : integer;
    Top : integer;
    Height : integer;
    Width : integer;
  end;

  DataShape = record
    Visible : boolean;
    Left : integer;
  end;

  DataDBEdit = record
    Visible : boolean;
    Left : integer;
    Width : integer;
    DataField : String;
  end;

  DataDBText = record
    Visible : boolean;
    Left : integer;
    Width : integer;
    DataField : String;
  end;

var
  frmZvVirob         : TfrmZvVirob;
  PozLabel           : array of DataLabel;
  PozShape           : array of DataShape;
  PozDBEdit          : array of DataDBEdit;
  PozDBText          : array of DataDBText;
  formLabel          : array of String;
  formShape          : array of String;
  formDBEdit         : array of String;
  formDBText         : array of String;

  const arrayOsnEkPok : array[0..3] of String = (
      '1. Виробництво і реалізація сільськогосподарської продукції',
      '2. Затрати на основне виробництво',
      '3. Фінансові результати',
      '4. Землекористування на 1 січня поточного року');

  const arrayTipZvit : array[0..3] of String = (
      '1. Зведений звіт (по всім господарствам)',
      '2. Звіт по коду (по всім господарствам)',
      '3. Звіт по господарству',
      '4. Звіт по господарству (друк по всім господарствам)');

  const arrayVidProd : array[0..31,0..1] of String = (
      ('1. ПРОДУКЦІЯ РОСЛИННИЦТВА - всього (сума рядків 0020, 0040-0120)','0010'),
      ('у тому числі: зернові і зернобобові - всього','0020'),
      ('з них: пшениця озима','0025'),
      ('кукурудза на зерно','0030'),
      ('насіння соняшника','0040'),
      ('цукрові буряки (фабричні)','0050'),
      ('картопля','0060'),
      ('овочі відкритого грунту','0070'),
      ('плоди (зерняткові, кісточкові)','0080'),
      ('виноград','0090'),
      ('ягідники','0095'),
      ('хміль','0100'),
      ('корневі корнеплоди і баштанні кормові','0105'),
      ('силосування','0107'),
      ('стажування','0110'),
      ('інша продукція рослинництва','0120'),
      ('2. ПРОДУКЦІЯ ТВАРИННИЦТВА - всього','0130'),
      ('у тому числі: вирощування худоби та птиці (в живій масі): великої рогатої худоби','0140'),
      ('свиней','0150'),
      ('овець та кіз','0160'),
      ('птиці','0170'),
      ('молоко','0180'),
      ('вовна','0190'),
      ('яйця курячі (тис. штук)','0200'),
      ('інша продукція тваринництва','0210'),
      ('3. ПРОДУКЦІЯ ВЛАСНОЇ ПРОМИСЛОВОЇ ПЕРЕРОБКИ - всього','0220'),
      ('у тому числі: молоко, яке пройшло переробку та молокопродукти','0230'),
      ('м''ясо, одержане від забою худоби і птиці','0240'),
      ('продукція допоміжних виробництв і промислів (крім продукції переробки сільгосппродуктів)','0250'),
      ('4. РЕАЛІЗАЦІЯ РОБІТ І ПОСЛУГ НА СТОРОНУ','0260'),
      ('ВСЬОГО ПО ПІДПРИЄМСТВУ (ряд. 0010+ряд.0130+ряд.0220+ряд.0260)','0270'),
      ('КП 1 (з ряд.0010 по ряд.0270, гр.1 - 6)','0500'));

  const arrayZatrVir : array[0..18,0..1] of String = (
      ('Витрати на оплату праці','0280' ),
      ('Відрахування на соціальні заходи','0285'),
      ('Матеріальні затрати, які увійшли в собівартість продукції (сума кодів 0295-0335)','0290'),
      ('у тому числі: насіння та посадковий матеріал','0295'),
      ('корми','0300'),
      ('у тому числі корми покупні','0301'),
      ('інша продукція сільсбкого господарства (гній, підстилка, яйця для інкубації)','0305'),
      ('мінеральні добрива','0310'),
      ('нафтопродукти','0315'),
      ('електроенергія','0320'),
      ('паливо','0325'),
      ('запасні частини, ремонтні та будівельні матеріали для ремонту','0330'),
      ('оплата послуг і робіт, що виконані сторонніми організаціями, та інші матеріальні затрати','0335'),
      ('Амортизація основних засобів','0340'),
      ('Інші витрати (включаючи оплату за аренду)','0345'),
      ('у тому числі орендна плата за: земельні частки (паї)','0350'),
      ('майнові паї','0351'),
      ('Усього операційних витрат (сума кодів 0280, 0285, 0290, 0340, 1345)','0355'),
      ('КП 2 (з ряд. 0280 - ряд. 0355 гр. 1-3)','0510'));

  const arrayFinRez : array[0..15,0..2] of String = (
      ('Результати від реалізації продукції (робіт, послуг) (ряд. 0270 гр.6-гр.5) Валовий: - прибуток','0360','тис.грн.'),
      ('- збиток','0365','тис.грн.'),
      ('Інші операційні доходи','0366','тис.грн.'),
      ('Адміністративні витрати','0367','тис.грн.'),
      ('Витрати на збут','0368','тис.грн.'),
      ('- збиток','0365','тис.грн.'),
      ('Інші операційні витрати','0369','тис.грн.'),
      ('- збиток','0365','тис.грн.'),
      ('Інші доходи та витрати: - доходи (прибуток)','0370','тис.грн.'),
      ('- втрати (збитки)','0375','тис.грн.'),
      ('Чистий: - прибуток','0380','тис.грн.'),
      ('- збиток','0385','тис.грн.'),
      ('Середньорічна вартість активів','0395','тис.грн.'),
      ('Середньооблікова чисельність працівників, зайнятих у сільськогосподарському виробництві, для обчислення продуктивності праці - усього','0400','чол.'),
      ('у тому числі: в рослинництві','0410','чол.'),
      ('в тваринництві','0411','чол.'));

  const arrayZemlekorist : array[0..3,0..1] of String = (
      ('Всього сільськогосподарських угідь','0450'),
      ('у тому числі: рілля','0451'),
      ('сінокоси','0452'),
      ('пасовища','0453'));


implementation

uses datazv, datadovidnik, PrintZvitVirob, ZvVirobDop, Progress;

{$R *.DFM}

procedure TfrmZvVirob.cmbGospChange(Sender: TObject);
begin
//  datadovid.tblVirob.ApplyUpdates;
  if datadovid.tblGosp.Locate('Name',cmbGosp.Text,[loCaseInsensitive]) then //loCaseInsensitive
    EditEnable
  else
    EditDisable;
end;

procedure TfrmZvVirob.FormResize(Sender: TObject);
begin
  ctrlZvVirob.RowCount:=Trunc((frmZvVirob.Height-ctrlZvVirob.Top-70)/ctrlZvVirob.PanelHeight);
  ctrlZvVirob.Left:=Trunc(frmZvVirob.Width/2-ctrlZvVirob.Width/2+14-lbPrintZvit.Width);
  pZvVirob.Left:=ctrlZvVirob.Left-4;
  lblZvVirob.Left:=cmbGosp.Left-lblZvVirob.Width-20;
  btnPrint.Top:=frmZvVirob.Height-btnRasch.Height-40;
  btnPrint.Left:=frmZvVirob.Width-btnPrint.Width-17;
  btnRasch.Left:=btnPrint.Left-btnRasch.Width-7;
  btnRasch.Top:=btnPrint.Top;
  btnSave.Top:=btnRasch.Top;
  btnSave.Left:=btnRasch.Left-btnSave.Width-10;
  cmbTipZvit.Top:=frmZvVirob.Height-cmbTipZvit.Height-40;
  lbPrintZvit.Left:=ctrlZvVirob.Left+ctrlZvVirob.Width+7;
  lbPrintZvit.Height:=(ctrlZvVirob.Top-lbPrintZvit.Top)+ctrlZvVirob.Height;
  lblVibFormZvit.Top:=cmbTipZvit.Top-lblVibFormZvit.Height-4;
  btnClear.Top:=btnRasch.Top;
  btnClear.Left:=btnSave.Left-10-btnClear.Width;
end;

procedure TfrmZvVirob.btnRaschClick(Sender: TObject);
begin
  Application.CreateForm(TfrmProgress, frmProgress);
  ShowWindow(frmZvVirob.Handle, SW_HIDE);
  if frmProgress.Raschot then
    ShowWindow(frmZvVirob.Handle, SW_SHOW);
  ctrlZvVirob.Enabled:=True;
  ctrlZvVirob.SetFocus;
end;

procedure TfrmZvVirob.EditEnable;
begin
  edEdit1.Enabled:=True;
  edEdit2.Enabled:=True;
  edEdit3.Enabled:=True;
  edEdit4.Enabled:=True;
  edEdit5.Enabled:=True;
  edEdit6.Enabled:=True;
  btnRasch.Enabled:=True;
  btnSave.Enabled:=True;
  btnPrint.Enabled:=True;
  btnClear.Enabled:=True;
  cmbTipZvit.Enabled:=True;
end;

procedure TfrmZvVirob.EditDisable;
begin
  cmbTipZvit.Enabled:=False;
  btnClear.Enabled:=False;
  btnPrint.Enabled:=False;
  btnSave.Enabled:=False;
  btnRasch.Enabled:=False;
  edEdit1.Enabled:=False;
  edEdit2.Enabled:=False;
  edEdit3.Enabled:=False;
  edEdit4.Enabled:=False;
  edEdit5.Enabled:=False;
  edEdit6.Enabled:=False;
end;

procedure TfrmZvVirob.FormCreate(Sender: TObject);
var
  i,
  indexLabel,
  indexShape,
  indexDBEdit,
  indexDBText    : integer;
begin
  keyPreview := true;
  // Инициализация переменных
  indexLabel:=0;
  indexShape:=0;
  indexDBEdit:=0;
  indexDBText:=0;
  // Заполнение комбо соотв. видами отчетов
  datadovid.tblGosp.First;
  while not datadovid.tblGosp.Eof do begin
    cmbGosp.Items.Add(datadovid.tblGosp.FieldByName('Name').AsString);
    datadovid.tblGosp.Next;
  end;
  cmbGosp.ItemIndex:=0;
  datadovid.tblVirob.First;
  while not datadovid.tblVirob.Eof do begin
    lbPrintZvit.Items.Add(datadovid.tblVirob.FieldByName('Code').AsString);
    datadovid.tblVirob.Next;
  end;
  lbPrintZvit.ItemIndex:=0;
  datadovid.tblVirob.First;
  for i:=Low(arrayOsnEkPok) to High(arrayOsnEkPok) do
    cmbOsnEkPok.Items.Add(arrayOsnEkPok[i]);
  cmbOsnEkPok.ItemIndex:=0;
  for i:=Low(arrayTipZvit) to High(arrayTipZvit) do
    cmbTipZvit.Items.Add(arrayTipZvit[i]);
  cmbTipZvit.ItemIndex:=0;
  // Подсчет количества объектов разных типов для последующего создания
  // соответствующего количества елементов динамических массивов
  for i:= 0 to frmZvVirob.ComponentCount-1 do begin
    if frmZvVirob.Components[i].ClassName='TLabel' then Inc(indexLabel);
    if frmZvVirob.Components[i].ClassName='TShape' then Inc(indexShape);
    if frmZvVirob.Components[i].ClassName='TDBEdit' then Inc(indexDBEdit);
    if frmZvVirob.Components[i].ClassName='TDBText'then Inc(indexDBText);
  end;

  // Инициализация динамических массивов
  SetLength(formLabel,indexLabel);
  SetLength(formShape,indexShape);
  SetLength(formDBEdit,indexDBEdit);
  SetLength(formDBText,indexDBText);
  SetLength(PozLabel,indexLabel);
  SetLength(PozShape,indexShape);
  SetLength(PozDBEdit,indexDBEdit);
  SetLength(PozDBText,indexDBText);

  // Сохранение данных об объектах формы для последующего восстановления
  // ----------------------------Begin----------------------------------
  indexLabel:=0;
  indexShape:=0;
  indexDBEdit:=0;
//PrintZvit.Items.Index
  for i:= 0 to frmZvVirob.ComponentCount-1 do begin
    if frmZvVirob.Components[i].ClassName='TLabel' then begin
      FormLabel[indexLabel]:=frmZvVirob.Components[i].Name;
      PozLabel[indexLabel].Caption:=TLabel(FindComponent(FormLabel[indexLabel])).Caption;
      PozLabel[indexLabel].Left:=TLabel(FindComponent(FormLabel[indexLabel])).Left;
      PozLabel[indexLabel].Top:=TLabel(FindComponent(FormLabel[indexLabel])).Top;
      PozLabel[indexLabel].Height:=TLabel(FindComponent(FormLabel[indexLabel])).Height;
      PozLabel[indexLabel].Width:=TLabel(FindComponent(FormLabel[indexLabel])).Width;
      PozLabel[indexLabel].Visible:=TLabel(FindComponent(FormLabel[indexLabel])).Visible;
      Inc(indexLabel);
    end;
    if frmZvVirob.Components[i].ClassName='TShape' then begin
      FormShape[indexShape]:=frmZvVirob.Components[i].Name;
      PozShape[indexShape].Left:=TShape(FindComponent(FormShape[indexShape])).Left;
      PozShape[indexShape].Visible:=TShape(FindComponent(FormShape[indexShape])).Visible;
      Inc(indexShape);
    end;
    if frmZvVirob.Components[i].ClassName='TDBEdit' then begin
      FormDBEdit[indexDBEdit]:=frmZvVirob.Components[i].Name;
      PozDBEdit[indexDBEdit].Left:=TDBEdit(FindComponent(FormDBEdit[indexDBEdit])).Left;
      PozDBEdit[indexDBEdit].DataField:=TDBEdit(FindComponent(FormDBEdit[indexDBEdit])).DataField;
      PozDBEdit[indexDBEdit].Visible:=TDBEdit(FindComponent(FormDBEdit[indexDBEdit])).Visible;
      PozDBEdit[indexDBEdit].Width:=TDBEdit(FindComponent(FormDBEdit[indexDBEdit])).Width;
      Inc(indexDBEdit);
    end;
{    if frmZvVirob.Components[i].ClassName='TDBText'then begin
      FormDBEdit[indexDBEdit]:=frmZvVirob.Components[i].Name;
      PozDBEdit[indexDBEdit].Left:=TDBEdit(FindComponent(FormDBEdit[indexDBEdit])).Left;
      PozDBEdit[indexDBEdit].DataField:=TDBEdit(FindComponent(FormDBEdit[indexDBEdit])).DataField;
      PozDBEdit[indexDBEdit].Visible:=TDBEdit(FindComponent(FormDBEdit[indexDBEdit])).Visible;
      PozDBEdit[indexDBEdit].Width:=TDBEdit(FindComponent(FormDBEdit[indexDBEdit])).Width;
      Inc(indexDBEdit);
    end;
}  end;
  // -----------------------------End-----------------------------------
  // Запрет редактирования
  datadovid.tblGosp.Locate('Name',frmZvVirob.cmbGosp.Text,[loCaseInsensitive]);
  if cmbGosp.Text='' then
    EditDisable;
end;

procedure TfrmZvVirob.btnPrintClick(Sender: TObject);
var
  i: integer;
  C1, C2, C3, C4, C5, C6: Currency;
begin
  C1:=0;  C2:=0;  C3:=0;  C4:=0;  C5:=0;  C6:=0;
  datadovid.tblVirob.ApplyUpdates;
  datadovid.tblVirob.Close;
  datadovid.tblVirob.Open;
  Application.CreateForm(TqrPrintZvitVirob, qrPrintZvitVirob);
  if (cmbTipZvit.Text=arrayTipZvit[2])or(cmbTipZvit.Text=arrayTipZvit[0]) then begin
    if(cmbTipZvit.Text=arrayTipZvit[2]) then begin
      if (cmbOsnEkPok.Text<>arrayOsnEkPok[0]) then begin
        ZvVirobDop.Zvit1;
        if (cmbOsnEkPok.Text=arrayOsnEkPok[1]) then begin
          ZvVirobDop.Zvit2(DataDovid.tblZatrVir);
        end;
        if (cmbOsnEkPok.Text=arrayOsnEkPok[2])or(cmbOsnEkPok.Text=arrayOsnEkPok[3]) then begin
          ZvVirobDop.Zvit3(DataDovid.tblFinRez);
          if (cmbOsnEkPok.Text=arrayOsnEkPok[3]) then begin
            ZvVirobDop.Zvit4(DataDovid.tblZemlekorist);
          end;
        end;
      end;
    end;
    if (cmbTipZvit.Text=arrayTipZvit[0]) then begin
      if datadovid.tblFinRezAll.IsEmpty then
        UpdateSpravRecordAll;
      if cmbOsnEkPok.Text=arrayOsnEkPok[0] then begin
        datadovid.tblVirob.ApplyUpdates;
        datadovid.tblVirob.Close;
        datadovid.tblVirob.Open;
        for i:=0 to 31 do begin
          datadovid.qryObZvit.SQL.Clear;
          FilterZvVirob(arrayVidProd[i,1]);
          datadovid.qryObZvit.ExecSQL;
          datadovid.qryObZvit.Active:=True;
          datadovid.qryObZvit.Refresh;
          while not datadovid.qryObZvit.Eof do begin
            C1:=C1+datadovid.qryObZvit.FieldByName('C1').AsCurrency;
            C2:=C2+datadovid.qryObZvit.FieldByName('C2').AsCurrency;
            C3:=C3+datadovid.qryObZvit.FieldByName('C3').AsCurrency;
            C4:=C4+datadovid.qryObZvit.FieldByName('C4').AsCurrency;
            C5:=C5+datadovid.qryObZvit.FieldByName('C5').AsCurrency;
            C6:=C6+datadovid.qryObZvit.FieldByName('C6').AsCurrency;
            datadovid.qryObZvit.Next;
          end;
          datadovid.qryObZvit.Active:=False;
          with datadovid.tblVirobAll do begin
            Locate('Code',arrayVidProd[i,1],[]);
            Edit;
            FieldValues['C1']:=C1;
            FieldValues['C2']:=C2;
            FieldValues['C3']:=C3;
            FieldValues['C4']:=C4;
            FieldValues['C5']:=C5;
            FieldValues['C6']:=C6;
            Post;
            ApplyUpdates;
            Close;
            Open;
            C1:=0; C2:=0; C3:=0; C4:=0; C5:=0; C6:=0;
            Next;
          end;
        end;
        qrPrintZvitVirob.DataSet:=datadovid.tblVirobAll;
        qrPrintZvitVirob.QRDBText1.DataSet:=datadovid.tblVirobAll;
        qrPrintZvitVirob.QRDBText2.DataSet:=DataDovid.tblVirobAll;
        qrPrintZvitVirob.QRDBText3.DataSet:=DataDovid.tblVirobAll;
        qrPrintZvitVirob.QRDBText4.DataSet:=DataDovid.tblVirobAll;
        qrPrintZvitVirob.QRDBText5.DataSet:=DataDovid.tblVirobAll;
        qrPrintZvitVirob.QRDBText6.DataSet:=DataDovid.tblVirobAll;
        qrPrintZvitVirob.QRDBText7.DataSet:=DataDovid.tblVirobAll;
        qrPrintZvitVirob.QRDBText8.DataSet:=DataDovid.tblVirobAll;
        qrPrintZvitVirob.Refresh;
      end;
      if cmbOsnEkPok.Text=arrayOsnEkPok[1] then begin
        datadovid.tblZatrVir.ApplyUpdates;
        datadovid.tblZatrVir.Close;
        datadovid.tblZatrVir.Open;
        for i:=0 to 18 do begin
          datadovid.qryObZvit.SQL.Clear;
          FilterZvZatrVir(arrayZatrVir[i,1]);
          datadovid.qryObZvit.ExecSQL;
          datadovid.qryObZvit.Active:=True;
          datadovid.qryObZvit.Refresh;
          while not datadovid.qryObZvit.Eof do begin
            C1:=C1+datadovid.qryObZvit.FieldByName('C1').AsCurrency;
            C2:=C2+datadovid.qryObZvit.FieldByName('C2').AsCurrency;
            C3:=C3+datadovid.qryObZvit.FieldByName('C3').AsCurrency;
            datadovid.qryObZvit.Next;
          end;
          datadovid.qryObZvit.Active:=False;
          with datadovid.tblZatrVirAll do begin
            Locate('Code',arrayZatrVir[i,1],[]);
            Edit;
            FieldValues['C1']:=C1;
            FieldValues['C2']:=C2;
            FieldValues['C3']:=C3;
            Post;
            ApplyUpdates;
            Close;
            Open;
            C1:=0; C2:=0; C3:=0;
            Next;
          end;
        end;
        qrPrintZvitVirob.DataSet:=datadovid.tblZatrVirAll;
        qrPrintZvitVirob.QRDBText1.DataSet:=datadovid.tblZatrVirAll;
        qrPrintZvitVirob.QRDBText2.DataSet:=DataDovid.tblZatrVirAll;
        qrPrintZvitVirob.QRDBText3.DataSet:=DataDovid.tblZatrVirAll;
        qrPrintZvitVirob.QRDBText4.DataSet:=DataDovid.tblZatrVirAll;
        qrPrintZvitVirob.QRDBText5.DataSet:=DataDovid.tblZatrVirAll;
        qrPrintZvitVirob.QRDBText6.DataSet:=DataDovid.tblZatrVirAll;
        qrPrintZvitVirob.QRDBText7.DataSet:=DataDovid.tblZatrVirAll;
        qrPrintZvitVirob.QRDBText8.DataSet:=DataDovid.tblZatrVirAll;
        qrPrintZvitVirob.Refresh;
      end;
      if cmbOsnEkPok.Text=arrayOsnEkPok[2] then begin
        datadovid.tblFinRez.ApplyUpdates;
        datadovid.tblFinRez.Close;
        datadovid.tblFinRez.Open;
        for i:=0 to 15 do begin
          datadovid.qryObZvit.SQL.Clear;
          FilterFinRez(arrayFinRez[i,1]);
          datadovid.qryObZvit.ExecSQL;
          datadovid.qryObZvit.Active:=True;
          datadovid.qryObZvit.Refresh;
          while not datadovid.qryObZvit.Eof do begin
            C1:=C1+datadovid.qryObZvit.FieldByName('C1').AsCurrency;
            datadovid.qryObZvit.Next;
          end;
          datadovid.qryObZvit.Active:=False;
          with datadovid.tblFinRezAll do begin
            Locate('Code',arrayFinRez[i,1],[]);
            Edit;
            FieldValues['C1']:=C1;
            Post;
            ApplyUpdates;
            Close;
            Open;
            C1:=0;
            Next;
          end;
        end;
        qrPrintZvitVirob.DataSet:=datadovid.tblFinRezAll;
        qrPrintZvitVirob.QRDBText1.DataSet:=datadovid.tblFinRezAll;
        qrPrintZvitVirob.QRDBText2.DataSet:=DataDovid.tblFinRezAll;
        qrPrintZvitVirob.QRDBText3.DataSet:=DataDovid.tblFinRezAll;
        qrPrintZvitVirob.QRDBText4.DataSet:=DataDovid.tblFinRezAll;
        qrPrintZvitVirob.QRDBText5.DataSet:=DataDovid.tblFinRezAll;
        qrPrintZvitVirob.QRDBText6.DataSet:=DataDovid.tblFinRezAll;
        qrPrintZvitVirob.QRDBText7.DataSet:=DataDovid.tblFinRezAll;
        qrPrintZvitVirob.QRDBText8.DataSet:=DataDovid.tblFinRezAll;
        qrPrintZvitVirob.Refresh;
      end;
      if cmbOsnEkPok.Text=arrayOsnEkPok[3] then begin
        datadovid.tblZemlekorist.ApplyUpdates;
        datadovid.tblZemlekorist.Close;
        datadovid.tblZemlekorist.Open;
        for i:=0 to 3 do begin
          datadovid.qryObZvit.SQL.Clear;
          FilterZemlekorist(arrayZemlekorist[i,1]);
          datadovid.qryObZvit.ExecSQL;
          datadovid.qryObZvit.Active:=True;
          datadovid.qryObZvit.Refresh;
          while not datadovid.qryObZvit.Eof do begin
            C1:=C1+datadovid.qryObZvit.FieldByName('C1').AsCurrency;
            C2:=C2+datadovid.qryObZvit.FieldByName('C2').AsCurrency;
            datadovid.qryObZvit.Next;
          end;
          datadovid.qryObZvit.Active:=False;
          with datadovid.tblZemlekoristAll do begin
            Locate('Code',arrayZemlekorist[i,1],[]);
            Edit;
            FieldValues['C1']:=C1;
            FieldValues['C2']:=C2;
            Post;
            ApplyUpdates;
            Close;
            Open;
            C1:=0; C2:=0;
            Next;
          end;
        end;
        qrPrintZvitVirob.DataSet:=datadovid.tblZemlekoristAll;
        qrPrintZvitVirob.QRDBText1.DataSet:=datadovid.tblZemlekoristAll;
        qrPrintZvitVirob.QRDBText2.DataSet:=DataDovid.tblZemlekoristAll;
        qrPrintZvitVirob.QRDBText3.DataSet:=DataDovid.tblZemlekoristAll;
        qrPrintZvitVirob.QRDBText4.DataSet:=DataDovid.tblZemlekoristAll;
        qrPrintZvitVirob.QRDBText5.DataSet:=DataDovid.tblZemlekoristAll;
        qrPrintZvitVirob.QRDBText6.DataSet:=DataDovid.tblZemlekoristAll;
        qrPrintZvitVirob.QRDBText7.DataSet:=DataDovid.tblZemlekoristAll;
        qrPrintZvitVirob.QRDBText8.DataSet:=DataDovid.tblZemlekoristAll;
        qrPrintZvitVirob.Refresh;
      end;
    end;
  end else begin
    datadovid.qryObZvit.SQL.Clear;
    if (cmbOsnEkPok.Text=arrayOsnEkPok[0]) then
      FilterZvVirob(lbPrintZvit.Items.Strings[lbPrintZvit.ItemIndex]);
    if (cmbOsnEkPok.Text=arrayOsnEkPok[1]) then
      FilterZvZatrVir(lbPrintZvit.Items.Strings[lbPrintZvit.ItemIndex]);
    if (cmbOsnEkPok.Text=arrayOsnEkPok[2]) then
      FilterFinRez(lbPrintZvit.Items.Strings[lbPrintZvit.ItemIndex]);
    if (cmbOsnEkPok.Text=arrayOsnEkPok[3]) then
      FilterZemlekorist(lbPrintZvit.Items.Strings[lbPrintZvit.ItemIndex]);
    qrPrintZvitVirob.QRDBText1.DataField:='Name';
    datadovid.qryObZvit.ExecSQL;
    datadovid.qryObZvit.Active:=True;
    datadovid.qryObZvit.Refresh;
    qrPrintZvitVirob.DataSet:=datadovid.qryObZvit;
    qrPrintZvitVirob.QRDBText1.DataSet:=datadovid.qryObZvit;
    qrPrintZvitVirob.QRDBText2.DataSet:=DataDovid.qryObZvit;
    qrPrintZvitVirob.QRDBText3.DataSet:=DataDovid.qryObZvit;
    qrPrintZvitVirob.QRDBText4.DataSet:=DataDovid.qryObZvit;
    qrPrintZvitVirob.QRDBText5.DataSet:=DataDovid.qryObZvit;
    qrPrintZvitVirob.QRDBText6.DataSet:=DataDovid.qryObZvit;
    qrPrintZvitVirob.QRDBText7.DataSet:=DataDovid.qryObZvit;
    qrPrintZvitVirob.QRDBText8.DataSet:=DataDovid.qryObZvit;
  end;
  qrPrintZvitVirob.Preview;
end;

procedure TfrmZvVirob.FormActivate(Sender: TObject);
begin
  datadovid.tblVirob.First;
end;

procedure TfrmZvVirob.btnSaveClick(Sender: TObject);
begin
  SaveBuffers;
  ctrlZvVirob.SetFocus;
end;

procedure TfrmZvVirob.cmbOsnEkPokChange(Sender: TObject);
begin
  Application.CreateForm(TfrmProgress, frmProgress);
  ShowWindow(frmZvVirob.Handle, SW_HIDE);
  if frmProgress.OsnEkPokChange then
    ShowWindow(frmZvVirob.Handle, SW_SHOW);
end;

procedure TfrmZvVirob.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmZvVirob.ctrlZvVirobKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=13 then
    Key:=9;
  if Key=40 then
    ctrlZvVirob.DataSource.DataSet.Next;
  if Key=38 then
    ctrlZvVirob.DataSource.DataSet.MoveBy(-1);
end;

procedure TfrmZvVirob.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin
    Key := 0;
    PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmZvVirob.btnClearClick(Sender: TObject);
begin
  Application.CreateForm(TfrmProgress, frmProgress);
  ShowWindow(frmZvVirob.Handle, SW_HIDE);
  if frmProgress.ClearTable then
    ShowWindow(frmZvVirob.Handle, SW_SHOW);
  ctrlZvVirob.Enabled:=True;
  ctrlZvVirob.SetFocus;
end;

procedure TfrmZvVirob.FormDeactivate(Sender: TObject);
begin
//  Close;
end;

end.
