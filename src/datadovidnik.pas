unit datadovidnik;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TDataDovid = class(TDataModule)
    srcGosp: TDataSource;
    tblGosp: TTable;
    srcVirob: TDataSource;
    tblVirob: TTable;
    srcZatrVir: TDataSource;
    tblZatrVir: TTable;
    srcFinrez: TDataSource;
    tblFinRez: TTable;
    srcZemlekorist: TDataSource;
    tblZemlekorist: TTable;
    srcObZvit: TDataSource;
    qryObZvit: TQuery;
    srcVirobAll: TDataSource;
    tblVirobAll: TTable;
    srcZatrVirAll: TDataSource;
    tblZatrVirAll: TTable;
    srcFinRezAll: TDataSource;
    tblFinRezAll: TTable;
    srcZemlekoristAll: TDataSource;
    tblZemlekoristAll: TTable;
    srGospAll: TDataSource;
    tblGospAll: TTable;
    procedure tblGospBeforeDelete(DataSet: TDataSet);
    procedure tblGospAfterDelete(DataSet: TDataSet);
    procedure tblGospNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataDovid: TDataDovid;

implementation

uses MainBase;

{$R *.DFM}

procedure TDataDovid.tblGospBeforeDelete(DataSet: TDataSet);
begin
  with dataDovid.tblVirob do begin
    First;
    while not Eof do begin
      Delete;
    end;
    ApplyUpdates;
    Close; Open;
  end;
  with dataDovid.tblZatrVir do begin
    First;
    while not Eof do begin
      Delete;
    end;
    ApplyUpdates;
    Close; Open;
  end;
  with dataDovid.tblFinRez do begin
    First;
    while not Eof do begin
      Delete;
    end;
    ApplyUpdates;
    Close; Open;
  end;
  with dataDovid.tblZemlekorist do begin
    First;
    while not Eof do begin
      Delete;
    end;
    ApplyUpdates;
    Close; Open;
  end;
end;

procedure TDataDovid.tblGospAfterDelete(DataSet: TDataSet);
begin
  tblGosp.ApplyUpdates;
  tblGosp.Close;
  tblGosp.Open;
end;

procedure TDataDovid.tblGospNewRecord(DataSet: TDataSet);
begin
  with tblGosp do begin
    Edit;
    FieldValues['CreateZvEkPok']:=True;
    Post;
    ApplyUpdates;
    Close;
    Open;
  end;
end;

end.
