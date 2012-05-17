unit u_record;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, u_dm, DynamicSkinForm;

type
  TFrmRecord = class(TForm)
    spDynamicSkinForm1: TspDynamicSkinForm;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRecord: TFrmRecord;

implementation

{$R *.dfm}

end.
