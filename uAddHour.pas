unit uAddHour;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DynamicSkinForm, StdCtrls, AdvEdit, SkinCtrls, ExtCtrls, DB, MemDS,
  DBAccess, Uni;

type
  TFrmAddHour = class(TForm)
    Dsf: TspDynamicSkinForm;
    Panel2: TPanel;
    Label1: TLabel;
    BtnSave: TspSkinButton;
    BtnCancel: TspSkinButton;
    Durasi: TAdvEdit;
    buffer: TUniQuery;
    procedure BtnSaveClick(Sender: TObject);
  private
    { Private declarations }
    function isValid: boolean;
    function isSaved: boolean;
  public
    { Public declarations }
  end;

var
  FrmAddHour: TFrmAddHour;

implementation

uses u_dm;

{$R *.dfm}

procedure TFrmAddHour.BtnSaveClick(Sender: TObject);
begin
  if isValid then isSaved;
end;

function TFrmAddHour.isSaved: boolean;
begin
  try
    DM.execSQL(buffer,'delete from room_hist where id_room='+QuotedStr(DM.RoomID));
    DM.execSQL(buffer,'insert into room_hist (id_room, hist, durasi) values ('+
    QuotedStr(Dm.RoomID)+',''0'','+Durasi.Text+')');
  finally
    Close;
  end;
end;

function TFrmAddHour.isValid: boolean;
begin
  Result:= False;
  if CekInput(Result, Durasi.Text <> '', 'Durasi belum diisi.', Durasi) then
     CekInput(Result, StrToInt(Durasi.Text) <> 0 , 'Durasi tidak valid.', Durasi);
end;

end.
