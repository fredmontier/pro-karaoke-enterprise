unit uPassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, u_dm, SkinCtrls, SkinBoxCtrls, StdCtrls, Mask, DynamicSkinForm;

type
  TFrmPassword = class(TForm)
    UserName: TspSkinEdit;
    Password: TspSkinPasswordEdit;
    spSkinStdLabel1: TspSkinStdLabel;
    spSkinStdLabel2: TspSkinStdLabel;
    BtnOK: TspSkinButton;
    BtnCancel: TspSkinButton;
    spDynamicSkinForm1: TspDynamicSkinForm;
    procedure FormShow(Sender: TObject);
    procedure UserNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PasswordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
//    function cakAtuh(AStr: String): boolean;
  end;

var
  FrmPassword: TFrmPassword;

implementation

{$R *.dfm}

//function TFrmPassword.cakAtuh(AStr: String): boolean;
//begin
//  if AStr = 'Teknisi' then
//  begin
//    Result := dm.getIntegerFromSQL(dm.qexec, 'select count (*) from user_dat '+
//    'where username='+quotedStr(UserName.Text)+' and password='+quotedStr(Password.Text)) > 0;
//    if Result then
//      dm.execSQL(dm.qexec,'update room set status=''C'' where id_room='+QuotedStr(DM.RoomID));
//  end else
//   if AStr = 'Close' then
//    Result := True else
//    Result := false;
//end;

function SetScreenResolution(Width, Height: integer): Longint;
var
  DeviceMode: TDeviceMode;
begin
  with DeviceMode do begin
    dmSize := SizeOf(TDeviceMode);
    dmPelsWidth := Width;
    dmPelsHeight := Height;
    dmFields := DM_PELSWIDTH or DM_PELSHEIGHT;
  end;
  Result := ChangeDisplaySettings(DeviceMode, CDS_UPDATEREGISTRY);
end;

procedure TFrmPassword.FormShow(Sender: TObject);
begin
  UserName.Clear;
  Password.Clear;
  UserName.SetFocus;
end;

procedure TFrmPassword.PasswordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then  
    BtnOK.OnClick(Sender);
end;

procedure TFrmPassword.BtnOKClick(Sender: TObject);
var ACount: byte;
begin
ACount := 0;
if (DM.IDTmp = 'Teknisi') OR (DM.IDTmp = 'Close') then
begin
    ACount := dm.getIntegerFromSQL(dm.qexec, 'select count(*) from user_dat '+
    'where username='+quotedStr(UserName.Text)+' and password='+quotedStr(Password.Text));
    if ACount > 0 then
    begin
      if DM.IDTmp = 'Teknisi' then
      begin
        dm.execSQL(dm.qexec,'update room set status=''C'' where id_room='+QuotedStr(DM.RoomID));
        dm.execSQL(dm.qexec,'insert into teknisi_log (UserName, StartDate) '+
        'values ('+QuotedStr(UserName.Text)+','+QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss',Dm.serverNow))+')');
        DM.IDTeknisi := IntToStr(dm.getIntegerFromSQL(DM.qexec,'select @@identity'));
        DM.inform('User dan Password Sesuai ...',dm.spSkinMessage1);
        DM.TeknisiMode := True;
      end else
      if DM.IDTmp = 'Close' then
      begin
        dm.execSQL(dm.qexec,'update room set status=''A'' where id_room='+QuotedStr(DM.RoomID));
        SetScreenResolution(1366, 768);
        Application.Terminate;
      end;
      Close;
    end else
    begin
      Application.MessageBox('User atau Password tidak dikenal ..!', 'User Login',0);
//      BtnOK.ModalResult := mrNone;
    end;
end;
end;

procedure TFrmPassword.UserNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    Password.SetFocus;
end;

end.
