unit u_dm;

interface

uses
  Windows, SysUtils, Classes, DB, ADODB, IniFiles, Dialogs, forms, spMessages,
  UniProvider, MySQLUniProvider, DBAccess, Uni, MemDS, Registry, ShellAPI, StrUtils,
  SkinData, WinSock, Controls;

function CekInput(var AResult: boolean; vState: boolean; vMsg: string; vControl: TWinControl): boolean;

type
  Tdm = class(TDataModule)
    ds_song_list: TDataSource;
    ds_now_playing: TDataSource;
    ds_t_saran: TDataSource;
    ds_t_usertdat: TDataSource;
    ds_t_room: TDataSource;
    ds_saved: TDataSource;
    ds_saved_list: TDataSource;
    spSkinMessage1: TspSkinMessage;
    ds_t_pesan: TDataSource;
    ds_t_request: TDataSource;
    MySQLUniProvider1: TMySQLUniProvider;
    now_playing: TUniTable;
    t_saran: TUniTable;
    t_pesan: TUniTable;
    tuser_dat: TUniTable;
    t_room: TUniTable;
    saved: TUniQuery;
    saved_list: TUniTable;
    t_request: TUniTable;
    qexec1: TUniQuery;
    qexec2: TUniQuery;
    qexec3: TUniQuery;
    qexec: TUniQuery;
    SkinData1: TspSkinData;
    SkinList1: TspCompressedSkinList;
    ac: TUniConnection;
    acLokal: TUniConnection;
    now_playingIDNP: TIntegerField;
    now_playingroom: TWideStringField;
    now_playingtanggal: TDateTimeField;
    now_playingJudul: TWideStringField;
    now_playingArtis: TWideStringField;
    now_playingdirektori: TWideStringField;
    now_playingnama_file: TWideStringField;
    now_playingVolume: TWideStringField;
    now_playingstate: TIntegerField;
    t_saranid_saran: TIntegerField;
    t_saranmember: TWideStringField;
    t_saranroom: TWideStringField;
    t_sarantanggal: TDateTimeField;
    t_saransaran: TWideStringField;
    t_pesanid_pesan: TIntegerField;
    t_pesanid_room: TWideStringField;
    t_pesanmember: TWideStringField;
    t_pesanusername: TWideStringField;
    t_pesanpesan: TWideStringField;
    t_pesantanggal: TDateTimeField;
    t_pesanpesan_siapa: TWideStringField;
    t_pesanis_read: TIntegerField;
    tuser_datusername: TWideStringField;
    tuser_datpassword: TWideStringField;
    tuser_datlevel: TWideStringField;
    t_roomid_room: TWideStringField;
    t_roomroom_name: TWideStringField;
    t_roomid_kategory: TIntegerField;
    t_roomid_location: TIntegerField;
    t_roomIP_Address: TWideStringField;
    t_roomstatus: TWideStringField;
    t_roomKiller: TWideStringField;
    t_roomVol: TIntegerField;
    t_roomPitch: TIntegerField;
    t_roomSB: TSmallintField;
    t_roommember: TWideStringField;
    t_roomNoTransaksi: TWideStringField;
    t_roommulai: TDateTimeField;
    t_roomselesai: TDateTimeField;
    t_roomnama: TWideStringField;
    t_roomid_session: TIntegerField;
    saved_listIDNP: TIntegerField;
    saved_listroom: TWideStringField;
    saved_listtanggal: TDateTimeField;
    saved_listJudul: TWideStringField;
    saved_listArtis: TWideStringField;
    saved_listdirektori: TWideStringField;
    saved_listnama_file: TWideStringField;
    saved_listVolume: TWideStringField;
    saved_listnama: TWideStringField;
    t_requestid_request: TIntegerField;
    t_requestmember: TWideStringField;
    t_requestroom: TWideStringField;
    t_requesttanggal: TDateTimeField;
    t_requestjudul: TWideStringField;
    t_requestpenyanyi: TWideStringField;
    savednama: TWideStringField;
    ListSong: TUniTable;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure t_room1AfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    FID : string;
    FRoomID: String;
    FNoTrans: String;
    FServerVideo: String;
    FAppConfig : TIniFile;
    FStart : TDateTime;
    FEnd : TDateTime;
    FIp : String;
    FHost : String;
    FTeknisi : boolean;
    FSaran : boolean;
    FPesan : boolean;
    FIDTeknisi: String;
    FShowMsg : boolean;
    RegDatabase : TRegistry;

    function connect: Boolean;

  public
    { Public declarations }
    function openSQL(AQry: TUniQuery; _SQL: String): boolean;
    function execSQL(AQry: TUniQuery; _SQL: String): boolean;
    function getStringFromSQL(AQry: TUniQuery; _SQL: String): String;
    function getIntegerFromSQL(AQry: TUniQuery; _SQL: String): integer;
    function getFloatFromSQL(AQry: TUniQuery; _SQL: String): Double;
    function confirm(AMsg: String; Skin: TspSkinMessage): boolean;
    function serverNow: TDateTime;
    function hitungWaktu(DT1, DT2: TDateTime): integer;
    function FloatToStrFmt(AFloat: real; ExelStyle: boolean=false; digit: integer=2): string;
    function FloatToStrFmtShowDecimal(AFloat: real; digit: integer=4): string;
    function StrFmtToFloatDef(AString: string; ADefault: real; ExelStyle: Boolean=false): double;

    procedure inform(AMsg: String; Skin: TspSkinMessage);
    procedure alert(AMsg: String; Skin: TspSkinMessage);
    procedure saveLog(AMsg: String);

    Property IDTmp: String read FID Write FID;
    Property RoomID: String read FRoomID Write FRoomID;
    Property NoTrans: String read FNoTrans Write FNoTrans;
    Property ServerVideo: String read FServerVideo Write FServerVideo;
    property Starting : TDateTime read FStart write FStart;
    property Ending : TDateTime read FEnd write FEnd;
    Property IPAddress : String read FIp Write FIp;
    Property Host : String read FHost Write FHost;
    Property TeknisiMode : Boolean read FTeknisi Write FTeknisi;
    Property IDTeknisi : string read FIDTeknisi Write FIDTeknisi;
    Property Saran : Boolean read FSaran Write FSaran;
    Property Pesan : Boolean read FPesan Write FPesan;
    Property ShowMsg : Boolean read FShowMsg Write FShowMsg;
  end;

var
  dm: Tdm;
const
  DATABASE_PATH = '\Software\ProKaraoke';

implementation

uses u_main;

{$R *.dfm}


function CekInput(var AResult: boolean; vState: boolean; vMsg: string; vControl: TWinControl): boolean;
begin
    Result:= vState;
    AResult:= vState;
    if Result = true then Exit;
    DM.spSkinMessage1.MessageDlg(vMsg, mtWarning,[mbOk], 0);
    vControl.SetFocus;
end;
Function GetDriveSerialNo(Drive : String) : String; // Drive as 'x:' ...
var VolSerNum: DWORD;
    Dummy1, Dummy2: DWORD;
begin
  if GetVolumeInformation(pchar(drive+':\'), NIL, 0, @VolSerNum, Dummy1, Dummy2, NIL, 0) then Result := Format('%.4x:%.4x', [HiWord(VolSerNum), LoWord(VolSerNum)]);
End;

function encodePassword(pass:string):string;
var i:integer;
    decodepass:string;
    ch:byte;
begin
   decodepass:='';
   for i:= 1 to length(pass) do
   begin
      ch:=ord(pass[i])-10;
      decodepass:=chr(ch)+decodepass;
   end;
   result:=decodepass;
end;

procedure Tdm.alert(AMsg: String; Skin: TspSkinMessage);
begin
  skin.MessageDlg(AMsg, mtInformation, [mbOK], 0);
end;

function Tdm.confirm(AMsg: String; Skin: TspSkinMessage): boolean;
begin
  Result := ( Skin.MessageDlg(AMsg, mtConfirmation, [mbYes, mbNo], 0) = 1);
end;

function Tdm.connect: Boolean;
begin
Result := true;
Saran := True;
Pesan := True;
try
    try
    //ShowMessage(cript(txtDbPwd.Text));
      RegDatabase := TRegistry.Create;
      RegDatabase.OpenKey(DATABASE_PATH, True);
      ac.Server         := RegDatabase.ReadString('dbServer');
      ac.Database       := RegDatabase.ReadString('dbName');
      ac.Username       := RegDatabase.ReadString('dbUser');
//      ac.Password       := RegDatabase.ReadString('dbPass');
//      RoomID            := RegDatabase.ReadString('roomID');
      IPAddress         := RegDatabase.ReadString('IpAddress');
      ServerVideo       := RegDatabase.ReadString('ServerVideo');
      ac.Connect;

      acLokal.Server    := RegDatabase.ReadString('IpAddress');
      acLokal.Database := RegDatabase.ReadString('dbName');
      acLokal.Username      := RegDatabase.ReadString('dbUser');
      acLokal.Connect;

      if (ac.Connected=true) AND (acLokal.Connected=true) then
      begin
        openSQL(qexec,'select * from room where IP_Address='+QuotedStr(IPAddress));
        RegDatabase.WriteString('roomID', qexec.Fields[0].AsString);
        RoomID      := RegDatabase.ReadString('roomID');
      end;
    except
      Result := false;
    end;
  finally
    RegDatabase.CloseKey;
    RegDatabase.Free;
  end;
end;

procedure Tdm.DataModuleCreate(Sender: TObject);
var constr:string;
  Room, Provider, Password, User_ID, Data_Source,DSN,PWD,SERVER,UID : string;
  pathstring, AHost, Aip, AErr:string;
  DirBuf: array[0..MAX_PATH] of Char;
begin
  GetSystemDirectory(dirBuf, SizeOf(dirBuf));
  pathstring:='';
  pathstring:=dirbuf;
  CurrencyString:='';
  DateSeparator:='-';

  if connect then
  begin
//    ListSong.Open;
//    now_playing.Open;
//    t_room.Open;
//    t_room.Locate('id_room',Room, []);
//    f_login.Label1.Caption:=Room;
  end
  else
  begin
     alert('Tidak ada koneksi dengan SERVER, aplikasi akan dimatikan!.', spSkinMessage1);
//     WinExec(PChar(ExtractFilePath(Application.ExeName)+'Setting.exe'), SW_SHOWNORMAL);
    Application.Terminate;
  end;
end;

procedure Tdm.DataModuleDestroy(Sender: TObject);
begin
//  ac.Connected:=false;
//  song_list.close;
//  now_playing.close;
end;

function Tdm.execSQL(AQry: TUniQuery; _SQL: String): boolean;
begin
with AQry do
begin
  try
    Close;
    sql.Clear;
    sql.Text := _SQL;
    Execute;
    Result := True;
  except
    alert('Data gagal disimpan !.', spSkinMessage1);
    Result := False;
  end;
end;
end;

function Tdm.FloatToStrFmt(AFloat: real; ExelStyle: boolean;
  digit: integer): string;
  var buntut: string;
  begin
    buntut:= RightStr('#####', digit);

    if (ExelStyle) and (AFloat < 0) then
      Result := '('+FormatFloat('#,##0.'+buntut, abs(AFloat))+')'
    else
      Result := FormatFloat('#,##0.'+buntut, AFloat);

end;

function Tdm.FloatToStrFmtShowDecimal(AFloat: real; digit: integer): string;
  var buntut: string;
  begin
    buntut:= RightStr('#####0', digit);
    Result:= FormatFloat('#,##0.'+buntut, AFloat);
end;

function Tdm.getFloatFromSQL(AQry: TUniQuery; _SQL: String): Double;
begin
with AQry do
begin
  try
    close;
    sql.Clear;
    sql.Text := _SQL;
    Open;
    if recordcount > 0 then
      Result := Fields[0].AsFloat
      else Result := 0;
  except
    alert('Data gagal ditampilkan.!', spSkinMessage1);
    Result := 0;
  end;
end;

end;

function Tdm.getIntegerFromSQL(AQry: TUniQuery; _SQL: String): integer;
begin
with AQry do
begin
  try
    close;
    sql.Clear;
    sql.Text := _SQL;
    Open;
    if recordcount > 0 then
      Result := Fields[0].AsInteger
      else Result := 0;
  except
    alert('Data gagal ditampilkan.!', spSkinMessage1);
    Result := 0;
  end;
end;
end;


function Tdm.getStringFromSQL(AQry: TUniQuery; _SQL: String): String;
begin
with AQry do
begin
  try
    close;
    sql.Clear;
    sql.Text := _SQL;
    Open;
    if recordcount > 0 then
      Result := Fields[0].AsString
      else Result := '';
  except
    alert('Data gagal ditampilkan.!', spSkinMessage1);
    Result := '';
  end;
end;
end;

function Tdm.hitungWaktu(DT1, DT2: TDateTime): integer;
begin
  dm.openSQL(dm.qexec, 'select CEILING((UNIX_TIMESTAMP('+
  QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', DT1))+') - '+
  'UNIX_TIMESTAMP('+QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', DT2))+
  '))/60/60) AS hitung');
  Result := dm.qexec.Fields[0].AsInteger;
end;

procedure Tdm.inform(AMsg: String; Skin: TspSkinMessage);
begin
  Skin.MessageDlg(AMsg, mtInformation, [mbOK], 0);
end;

function Tdm.openSQL(AQry: TUniQuery; _SQL: String): boolean;
begin
with AQry do
begin
  try
    close;
    sql.Clear;
    sql.Text := _SQL;
    Open;
    Result := true;
  except
    alert('Data gagal ditampilkan.!', spSkinMessage1);
    Result := false;
  end;
end;
end;

procedure Tdm.saveLog(AMsg: String);
begin
  execSQL(dm.qexec,'insert into err_log (apl, msg) values (''playrer'','+QuotedStr(AMsg)+')');
end;

function Tdm.serverNow: TDateTime;
begin
  dm.openSQL(dm.qexec, 'select now()');
  Result := dm.qexec.Fields[0].AsDateTime;
end;

function Tdm.StrFmtToFloatDef(AString: string; ADefault: real;
  ExelStyle: Boolean): double;
begin
    if ExelStyle then
      if Copy(AString,1,1) = '(' then begin
        AString:= copy(AString, 2, length(AString)-2);
        AString:= '-' + AString;
      end;
    Result := StrToFloatDef(AnsiReplaceStr(AString,ThousandSeparator,''),0);
end;

procedure Tdm.t_room1AfterPost(DataSet: TDataSet);
begin
  t_room.UpdateRecord;
  t_room.Refresh;
end;
end.
