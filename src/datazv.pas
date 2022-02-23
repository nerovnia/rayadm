unit datazv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls;

type
  TDataZvit = class(TDataModule)
    srcGosp: TDataSource;
    tblGosp: TTable;
    srcVirobOb: TDataSource;
    tblVirobOb: TTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataZvit: TDataZvit;

implementation

{$R *.DFM}

end.
