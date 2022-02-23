unit Progress;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, Mask, DBCtrls, db, jpeg, Gauges;

type
  TfrmProgress = class(TForm)
    lblProgress: TLabel;
    prgProgress: TProgressBar;
    function OsnEkPokChange : Boolean;
    function Raschot : Boolean;
    function ClearTable : Boolean;
  private
    { Private declarations }
  public
    procedure CreateParams(var Params: TCreateParams); override;
  end;


var
  frmProgress: TfrmProgress;

implementation

uses zvvirob, datadovidnik, ZvVirobDop;

{$R *.DFM}

procedure TfrmProgress.Createparams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  Style := (Style or WS_POPUP) and (not WS_DLGFRAME);
end;

function TfrmProgress.OsnEkPokChange : Boolean;
var
  i : integer;
begin
  lblProgress.Caption:='';
  with frmZvVirob do begin
    DBText3.Visible:=False;
    DBText3.DataField:='C1';
    DBText2.Left:=173;
    DBText2.Width:=41;
    ctrlZvVirob.DataSource:=DataDovid.srcVirob;
    for i:=Low(FormLabel) to High(FormLabel) do begin
      TLabel(FindComponent(FormLabel[i])).Caption:=PozLabel[i].Caption;
      TLabel(FindComponent(FormLabel[i])).Left:=PozLabel[i].Left;
      TLabel(FindComponent(FormLabel[i])).Top:=PozLabel[i].Top;
      TLabel(FindComponent(FormLabel[i])).Height:=PozLabel[i].Height;
      TLabel(FindComponent(FormLabel[i])).Width:=PozLabel[i].Width;
      TLabel(FindComponent(FormLabel[i])).Visible:=PozLabel[i].Visible;
    end;
    for i:=Low(FormShape) to High(FormShape) do begin
      TShape(FindComponent(FormShape[i])).Left:=PozShape[i].Left;
      TShape(FindComponent(FormShape[i])).Visible:=PozShape[i].Visible;
    end;
    for i:=Low(FormDBEdit) to High(FormDBEdit) do begin
      TDBEdit(FindComponent(FormDBEDit[i])).Left:=PozDBEdit[i].Left;
      TDBEdit(FindComponent(FormDBEDit[i])).Width:=PozDBEdit[i].Width;
      TDBEdit(FindComponent(FormDBEDit[i])).DataField:=PozDBEdit[i].DataField;
      TDBEdit(FindComponent(FormDBEDit[i])).Visible:=PozDBEdit[i].Visible;
    end;
{  for i:=Low(FormDBText) to High(FormDBText) do begin
    if (FindComponent(FormDBText[i])).ClassName='TDBText'
    TDBText(FindComponent(FormDBText[i])).Left:=PozDBText[i].Left;
    TDBText(FindComponent(FormDBText[i])).Width:=PozDBText[i].Width;
    TDBText(FindComponent(FormDBText[i])).DataField:=PozDBText[i].DataField;
    TDBText(FindComponent(FormDBText[i])).Visible:=PozDBText[i].Visible;
  end;}
    prgProgress.Position:=0;
    if cmbOsnEkPok.Text=arrayOsnEkPok[0] then begin
      ctrlZvVirob.DataSource:=DataDovid.srcVirob;
      lbPrintZvit.Clear;
      datadovid.tblZatrVir.First;
      prgProgress.Max:=datadovid.tblVirob.RecordCount;
      while not datadovid.tblVirob.Eof do begin
        lbPrintZvit.Items.Add(datadovid.tblVirob.FieldByName('Code').AsString);
        datadovid.tblVirob.Next;
        prgProgress.Position:=prgProgress.Position+1;
      end;
      datadovid.tblVirob.First;
    end;
    if cmbOsnEkPok.Text=arrayOsnEkPok[1] then begin
      lbPrintZvit.Clear;
      datadovid.tblZatrVir.First;
      prgProgress.Max:=datadovid.tblZatrVir.RecordCount;
      while not datadovid.tblZatrVir.Eof do begin
        lbPrintZvit.Items.Add(datadovid.tblZatrVir.FieldByName('Code').AsString);
        datadovid.tblZatrVir.Next;
        prgProgress.Position:=prgProgress.Position+1;
      end;
      datadovid.tblZatrVir.First;
      Caption:='Звітність. ' + arrayOsnEkPok[1];
      edEdit4.DataField:='C1';
      edEdit5.DataField:='C1';
      edEdit6.DataField:='C1';
      ctrlZvVirob.DataSource:=DataDovid.srcZatrVir;
      Label23.Visible:=False;
      Label24.Visible:=False;
      Label26.Visible:=False;
      Label32.Visible:=False;
      Label33.Visible:=False;
      Label35.Visible:=False;
      Shape22.Visible:=False;
      Shape23.Visible:=False;
      Shape25.Visible:=False;
      Label1.Caption:=arrayOsnEkPok[1];
      Label20.Caption:='Елементи затрат';
      Label22.Caption:='Всього на основне виробництво';
      Label22.Left:=268;
      Label22.Top:=103;
      Label22.Width:=157;
      Label31.Left:=351;
      Label28.Caption:='у тому числі на виробництво продукції';
      Label28.Left:=468;
      Label28.Width:=237;
      Shape27.Left:=590;
      Label25.Caption:='рослинництва';
      Label25.Width:=117;
      Label25.Top:=123;
      Label25.Left:=468;
      Label27.Caption:='тваринництва';
      Label27.Top:=123;
      Label27.Left:=596;
      Label27.Width:=109;
      Label27.Height:=49;
      Label34.Left:=526;
      Label34.Caption:='2';
      Label36.Left:=649;
      Label36.Caption:='3';
      edEdit4.Visible:=False;
      edEdit5.Visible:=False;
      edEdit6.Visible:=False;
      edEdit1.Width:=234;
      edEdit2.Left:=469;
      edEdit2.Width:=111;
      edEdit3.Left:=594;
      edEdit3.Width:=102;
      Shape13.Visible:=False;
      Shape14.Visible:=False;
      Shape16.Left:=586;
      Shape17.Visible:=False;
    end;
    if (cmbOsnEkPok.Text=arrayOsnEkPok[2])or(cmbOsnEkPok.Text=arrayOsnEkPok[3]) then begin
      lbPrintZvit.Clear;
      datadovid.tblFinRez.First;
      prgProgress.Max:=datadovid.tblFinRez.RecordCount;
      while not datadovid.tblFinRez.Eof do begin
        lbPrintZvit.Items.Add(datadovid.tblFinRez.FieldByName('Code').AsString);
        datadovid.tblFinRez.Next;
        prgProgress.Position:=prgProgress.Position+1;
      end;
      datadovid.tblFinRez.First;
      Caption:='Звітність. ' + arrayOsnEkPok[2];
      Label1.Caption:=arrayOsnEkPok[2];
      Label20.Caption:='Назва показника';
      Label20.Width:=213;
      Label20.Left:=7;
      Label22.Visible:=False;
      Label24.Visible:=False;
      Label25.Visible:=False;
      Label26.Visible:=False;
      Label27.Visible:=False;
      Label30.Visible:=False;
      Label33.Visible:=False;
      Label34.Visible:=False;
      Label36.Visible:=False;
      Shape11.Visible:=False;
      Shape14.Visible:=False;
      Shape16.Visible:=False;
      Shape20.Visible:=False;
      Shape17.Visible:=False;
      Shape23.Visible:=False;
      Shape25.Visible:=False;
      Shape26.Visible:=False;
      Shape27.Visible:=False;
      Label21.Left:=240;
      Label23.Caption:='Одиниця виміру';
      Label23.Top:=107;
      Label23.Width:=157;
      Label23.Left:=303;
      Label28.Caption:='Всього';
      Label28.Top:=107;
      Label31.Caption:='Б';
      Label35.Caption:='1';
      Label32.Caption:='В';
      Label32.Left:=376;
      edEdit1.Visible:=False;
      edEdit2.Visible:=False;
      edEdit3.Visible:=False;
      edEdit4.Visible:=False;
      edEdit5.Visible:=False;
      edEdit1.DataField:='C1';
      edEdit2.DataField:='C1';
      edEdit3.DataField:='C1';
      edEdit4.DataField:='C1';
      edEdit5.DataField:='C1';
      edEdit6.Width:=236;
      edEdit6.Left:=464;
      edEdit6.Width:=236;
      edEdit6.DataField:='C1';
      DBText3.Visible:=True;
      DBText3.Left:=299;
      DBText3.Width:=156;
      ctrlZvVirob.DataSource:=DataDovid.srcFinRez;
      DBText3.DataField:='EdIzm';
      DBText2.Left:=221;
      DBText2.Width:=68;
      if cmbOsnEkPok.Text=arrayOsnEkPok[3] then begin
        lbPrintZvit.Clear;
        datadovid.tblZemlekorist.First;
        prgProgress.Max:=datadovid.tblZemlekorist.RecordCount;
        while not datadovid.tblZemlekorist.Eof do begin
          lbPrintZvit.Items.Add(datadovid.tblZemlekorist.FieldByName('Code').AsString);
          datadovid.tblZemlekorist.Next;
          prgProgress.Position:=prgProgress.Position+1;
        end;
        datadovid.tblZemlekorist.First;
        Caption:='Звітність. ' + arrayOsnEkPok[3];
        Label1.Caption:=arrayOsnEkPok[3];
        Label20.Caption:='';
        Label23.Caption:='Всього';
        Label28.Caption:='у тому числі взято в оренду';
        Label32.Caption:='1';
        Label35.Caption:='2';
        dbText3.Visible:=False;
        dbText3.DataField:='C1';
        edEdit5.Visible:=True;
        edEdit5.Left:=299;
        edEdit5.Width:=156;
        ctrlZvVirob.DataSource:=DataDovid.srcZemlekorist;
        edEdit6.DataField:='C2';
      end;
    end;
    ctrlZvVirob.Refresh;
    lbPrintZvit.ItemIndex:=0;
  end;
  datadovid.tblGosp.Locate('Name',frmZvVirob.cmbGosp.Text,[loCaseInsensitive]);
  Result:=True;
  Close;
end;


function TfrmProgress.Raschot : Boolean;
var
  StringField1,
  StringField2,
  StringField3,
  StringField4,
  StringField5,
  StringField6,
  StringField7  : array of Currency;
  NameField     : array of String;
  KolField, i   : integer;
begin
  if (frmZvVirob.cmbOsnEkPok.Text=arrayOsnEkPok[0]) then begin
    with datadovid.tblVirob do begin
      ApplyUpdates;
      Close;
      Open;

      // Инициализация динамических массивов
      KolField:=6;
      SetLength(StringField1,KolField);
      SetLength(StringField2,KolField);
      SetLength(StringField3,KolField);
      SetLength(StringField4,KolField);
      SetLength(StringField5,KolField);
      SetLength(StringField6,KolField);
      SetLength(StringField7,KolField);

      SetLength(NameField,KolField);
      for i:=0 to KolField-1 do begin
        NameField[i]:='C'+IntToStr(i+1);
      end;
      //--------------------- Рассчет первой таблицы ---------------------
      //                  ***Виробництво і реалізація***
      //----------------------------- Begin ------------------------------
      prgProgress.Position:=0;
      prgProgress.Max:=RecordCount;
      First;
      for i:=0 to KolField-1 do begin
        StringField1[i]:=0;
        StringField2[i]:=0;
        StringField3[i]:=0;
        StringField4[i]:=0;
        StringField5[i]:=0;
        StringField6[i]:=0;
        StringField7[i]:=0;
      end;
      while not Eof do begin
        Next;
        prgProgress.Position:=prgProgress.Position+1;
        // Рассчет данных для кода 0010
        if (StrToInt(FieldByName('Code').AsString)>10)
            and (StrToInt(FieldByName('Code').AsString)<130)
            and (StrToInt(FieldByName('Code').AsString)<>25)
            and (StrToInt(FieldByName('Code').AsString)<>30) then begin
          for i:=0 to KolField-1 do begin
            StringField1[i]:=StringField1[i]+FieldByName('C'+IntToStr(i+1)).AsCurrency;
          end;
        end;

        // Рассчет данных для кода 0130
        if (StrToInt(FieldByName('Code').AsString)>130)
            and(StrToInt(FieldByName('Code').AsString)<220) then begin
          for i:=0 to KolField-1 do begin
            StringField2[i]:=StringField2[i]+FieldByName('C'+IntToStr(i+1)).AsCurrency;
          end;
        end;

        // Рассчет данных для кода 0220
        if (StrToInt(FieldByName('Code').AsString)>220)
            and(StrToInt(FieldByName('Code').AsString)<260) then begin
          for i:=0 to KolField-1 do begin
            StringField3[i]:=StringField3[i]+FieldByName('C'+IntToStr(i+1)).AsCurrency;
          end;
        end;

        // Рассчет данных для кода 0260
        if (StrToInt(FieldByName('Code').AsString)=0260) then begin
          for i:=0 to KolField-1 do begin
            StringField4[i]:=StringField4[i]+FieldByName('C'+IntToStr(i+1)).AsCurrency;
          end;
        end;

        // Рассчет данных для кода 0500
        if (StrToInt(FieldByName('Code').AsString)<>0500) then begin
          for i:=0 to KolField-1 do begin
            StringField5[i]:=StringField5[i]+FieldByName('C'+IntToStr(i+1)).AsCurrency;
//            ShowMessage(CurrToStr(StringField5[i]));
          end;
        end;

        // Проверка
        if (StrToInt(FieldByName('Code').AsString)=0023)
            or(StrToInt(FieldByName('Code').AsString)=0240)
            or(StrToInt(FieldByName('Code').AsString)=0250) then begin
          for i:=0 to KolField-1 do begin
            StringField6[i]:=StringField6[i]+FieldByName('C'+IntToStr(i+1)).AsCurrency;
          end;
        end;
      end;
      //--------------------- Рассчет первой таблицы ---------------------
      //****************************** End *******************************

      //------------------ Разнесение суммарных данных -------------------
      //----------------------------- Begin ------------------------------
      First;

      // Сумма для кода 0010
      Edit;
      for i:=0 to KolField-1 do begin
        FieldValues['C'+IntToStr(i+1)]:=StringField1[i];
      end;
      Post;

      // Сумма для кода 0130
      Locate('Code','0130', [loPartialKey]);
      Edit;
      for i:=0 to KolField-1 do begin
        FieldValues['C'+IntToStr(i+1)]:=StringField2[i];
      end;
      Post;

      // Сравнение
      Locate('Code','0220', [loPartialKey]);
       //    Edit;
      for i:=0 to KolField-1 do begin
        StringField7[i]:=FieldByName('C'+IntToStr(i+1)).AsCurrency;
        if FieldByName('C'+IntToStr(i+1)).AsCurrency<StringField6[i] then
          ShowMessage('Помилка!!! Перевірте первинні дані.');
      end;
//    Post;

    // Сумма для кода 0270
      Locate('Code','0270', [loPartialKey]);
      Edit;
      for i:=0 to KolField-1 do begin
        FieldValues['C'+IntToStr(i+1)]:=StringField1[i]+StringField2[i]+StringField7[i]+StringField4[i];
      end;
      Post;

      // Сумма для кода 0500
      Locate('Code','0500', [loPartialKey]);
      Edit;
      for i:=0 to KolField-1 do begin
        FieldValues['C'+IntToStr(i+1)]:=null;//StringField5[i];
      end;
      Post;
      //------------------ Разнесение суммарных данных -------------------
      //****************************** End *******************************
    end;
  end;


  if (frmZvVirob.cmbOsnEkPok.Text=arrayOsnEkPok[1]) then begin
    with datadovid.tblZatrVir do begin
      ApplyUpdates;
      Close;
      Open;
      // Инициализация динамических массивов
      KolField:=3;
      SetLength(StringField1,KolField);
      SetLength(StringField2,KolField);

      SetLength(NameField,KolField);
      for i:=0 to KolField-1 do begin
        NameField[i]:='C'+IntToStr(i+1);
      end;

      //--------------------- Рассчет второй таблицы ---------------------
      //               ***Витрати операційної діяльності***
      //----------------------------- Begin ------------------------------
      First;
      for i:=0 to KolField-1 do begin
        StringField1[i]:=0;
        StringField2[i]:=0;
      end;
      while not Eof do begin
        // Рассчет данных для кода 0290
        if (StrToInt(FieldByName('Code').AsString)>290)
            and (StrToInt(FieldByName('Code').AsString)<340)
            and (StrToInt(FieldByName('Code').AsString)<>301) then begin
          for i:=0 to KolField-1 do begin
            StringField1[i]:=StringField1[i]+FieldByName('C'+IntToStr(i+1)).AsCurrency;
          end;
        end;
        Next;
      end;
      // Сумма для кода 0290
      Locate('Code','0290', [loPartialKey]);
      Edit;
      for i:=0 to KolField-1 do begin
        FieldValues['C'+IntToStr(i+1)]:=StringField1[i];
      end;
      Post;
        // Рассчет данных для кода 0355
      First;
      while not Eof do begin
        if (StrToInt(FieldByName('Code').AsString)=280)
            or (StrToInt(FieldByName('Code').AsString)=285)
            or (StrToInt(FieldByName('Code').AsString)=290)
            or (StrToInt(FieldByName('Code').AsString)=340)
            or (StrToInt(FieldByName('Code').AsString)=345) then begin
          for i:=0 to KolField-1 do begin
            StringField2[i]:=StringField2[i]+FieldByName('C'+IntToStr(i+1)).AsCurrency;
          end;
        end;
        Next;
      end;
      // Сумма для кода 0355'
      Locate('Code','0355', [loPartialKey]);
      Edit;
      for i:=0 to KolField-1 do begin
        FieldValues['C'+IntToStr(i+1)]:=StringField2[i];
      end;
      Post;
      First;
    end;
  end;
  if (frmZvVirob.cmbOsnEkPok.Text=arrayOsnEkPok[2]) then begin
    with datadovid.tblFinRez do begin
      ApplyUpdates;
      Close;
      Open;
      // Инициализация динамических массивов
      KolField:=1;
      SetLength(StringField1,KolField);
      SetLength(StringField2,KolField);

      SetLength(NameField,KolField);
      for i:=0 to KolField-1 do begin
        NameField[i]:='C'+IntToStr(i+1);
      end;

      //--------------------- Рассчет третьей таблицы ---------------------
      //                    ***Фінансові результати***
      //----------------------------- Begin ------------------------------
      First;
      for i:=0 to KolField-1 do begin
        StringField1[i]:=0;
        StringField2[i]:=0;
      end;
      datadovid.tblVirob.Locate('Code','0270', [loPartialKey]);
      for i:=0 to KolField-1 do begin
        StringField1[i]:=datadovid.tblVirob.FieldByName('C6').AsCurrency-datadovid.tblVirob.FieldByName('C5').AsCurrency;
        Locate('Code','0360', [loPartialKey]);
        if StringField1[i]>0 then begin
          Edit;
          FieldValues['C1']:=StringField1[i];
          Post;
          Next;
          Edit;
          FieldValues['C1']:=null;
          Post;
        end else begin
          Edit;
          FieldValues['C1']:=null;
          Post;
          Next;
          Edit;
          FieldValues['C1']:=StringField1[i];
          Post;
        end;
      end;
    end;
  end;
  Result:=True;
  Close;
end;

function TfrmProgress.ClearTable : Boolean;
var
  i    : integer;
begin
  lblProgress.Caption:='Зачекайте! Видалення даних.';
  frmZvVirob.ctrlZvVirob.DataSource.DataSet.First;
  with frmZvVirob.ctrlZvVirob.DataSource.DataSet do begin
    prgProgress.Position:=0;
    prgProgress.Max:=RecordCount;
    while not Eof do begin
      for i:=0 to FieldList.Count-1 do begin
        Edit;
        if (FieldList[i].FullName[1]='C')and((Ord(FieldList[i].FullName[2])>47)and(Ord(FieldList[i].FullName[2])<58))then
          FieldValues[FieldList[i].FullName]:=null;
        Post;
      end;
      Next;
      prgProgress.Position:=prgProgress.Position+1;
      frmProgress.Refresh;
    end;
  end;
//  ZvVirobDop.SaveBuffers;
  Result:=True;
  Close;
end;
end.
