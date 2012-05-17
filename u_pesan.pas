unit u_pesan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, SkinCtrls, SkinExCtrls, DBCtrls, SkinData, DynamicSkinForm,
  ExtCtrls, DB, MemDS, DBAccess, Uni;

type
  Tf_pesan = class(TForm)
    spSkinBevel1: TspSkinBevel;
    Label1: TLabel;
    Label2: TLabel;
    spSkinXFormButton1: TspSkinXFormButton;
    spSkinPanel46: TspSkinPanel;
    Memo1: TMemo;
    spSkinPanel45: TspSkinPanel;
    Memo2: TMemo;
    spSkinPanel47: TspSkinPanel;
    Memo3: TMemo;
    spSkinButton57: TspSkinButton;
    spDynamicSkinForm1: TspDynamicSkinForm;
    Timer1: TTimer;
    BtnVKey: TspSkinXFormButton;
    BtnPesanOpr: TspSkinXFormButton;
    BtnPesanMember: TspSkinXFormButton;
    qPesan: TUniQuery;
    procedure spSkinXFormButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Memo3Enter(Sender: TObject);
    procedure Memo3KeyPress(Sender: TObject; var Key: Char);
    procedure spSkinButton57Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BtnVKeyClick(Sender: TObject);
    procedure BtnPesanOprClick(Sender: TObject);
    procedure BtnPesanMemberClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_pesan: Tf_pesan;

implementation

uses u_dm, u_main;

{$R *.dfm}

procedure Tf_pesan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.execSQL(dm.qexec,'update pesan set is_read =1 where pesan_siapa = ''operator'' AND id_room='+QuotedStr(DM.RoomID));
  dm.Pesan := true;
  dm.t_pesan.Close;
  dm.ShowMsg:= false;
  Timer1.Enabled:=false;
end;

procedure Tf_pesan.FormShow(Sender: TObject);
begin
  DM.ShowMsg := true;
  Timer1.Enabled:=true;
end;

procedure Tf_pesan.Memo3Enter(Sender: TObject);
begin
  if Trim(memo3.Lines.Text)='Your text here' then
  memo3.Clear;
end;

procedure Tf_pesan.Memo3KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then spSkinButton57.OnClick(Self);
end;

procedure Tf_pesan.spSkinButton57Click(Sender: TObject);
begin
  if Trim(Memo3.Lines.Text)<>'' then
  begin
    dm.execSQL(dm.qexec,'update room set status=''P'' where id_room='+QuotedStr(DM.RoomID));
    dm.execSQL(dm.qexec,'update pesan set is_read =1 where is_read < 2 and pesan_siapa = ''operator'' AND id_room='+QuotedStr(DM.RoomID));

    dm.execSQL(dm.qexec, 'insert into pesan (id_room, member, username, pesan, tanggal, pesan_siapa) '+
    'values ('+QuotedStr(DM.RoomID)+','+QuotedStr(DM.RoomID)+','+QuotedStr(DM.RoomID)+','+
    QuotedStr(Trim(Memo3.Lines.Text))+','+QuotedStr(FormatDateTime('yyyy-mm-dd', Date))+','+
    QuotedStr('member')+')');
    Memo2.Lines.Add(trim(Memo3.Lines.Text));
    Memo3.Lines.Clear;
  end;
//  Memo3.SetFocus;
end;

procedure Tf_pesan.spSkinXFormButton1Click(Sender: TObject);
begin
  close;
end;

procedure Tf_pesan.BtnPesanMemberClick(Sender: TObject);
begin
  dm.execSQL(dm.qexec,'update pesan set is_read =2 where pesan_siapa = ''member'' AND id_room='+QuotedStr(DM.RoomID));
end;

procedure Tf_pesan.BtnPesanOprClick(Sender: TObject);
begin
  dm.execSQL(dm.qexec,'update pesan set is_read =2 where pesan_siapa = ''operator'' AND id_room='+QuotedStr(DM.RoomID));
end;

procedure Tf_pesan.BtnVKeyClick(Sender: TObject);
begin
  WinExec('C:\Windows\System32\osk.exe', SW_SHOWNORMAL);
end;

procedure Tf_pesan.Timer1Timer(Sender: TObject);
begin
  try
  dm.ac.Connected := True ;
  dm.openSQL(qPesan,'select pesan, pesan_siapa from pesan where is_read in (0,1) AND id_room='+QuotedStr(DM.RoomID));
  if qPesan.RecordCount<>0 then
  Memo1.Lines.Clear;
  Memo2.Lines.Clear;
  while not qPesan.Eof do
  begin
    if qPesan.Fields[1].AsString='operator' then
    begin
      if trim(qPesan.Fields[0].AsString)<>'' then
        Memo1.Lines.Add(qPesan.Fields[0].AsString);
    end;
    if qPesan.Fields[1].AsString='member' then
    begin
      if (trim(qPesan.Fields[0].AsString)<>'') then
        Memo2.Lines.Add(qPesan.Fields[0].AsString);
    end;
    qPesan.Next;
  end
  except
    dm.ac.Connected := False;
    dm.ac.Connect;
//    form1.spSkinMessage1.MessageDlg('Hilang koneksi dengan SERVER, aplikasi akan dimatikan!.', mtInformation,
//      [mbOk], 0);
//    Application.Terminate;
  end;
end;

end.
