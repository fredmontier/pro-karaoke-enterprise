unit u_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SkinData, DynamicSkinForm, SkinGrids, spDBGrids, SkinCtrls, StdCtrls,
  Mask, SkinBoxCtrls, Xvideo, spMessages, ExtCtrls, Menus, SkinMenus,
  DBCtrls, ShellAPI, Spin, DB, AdvTouchKeyboard, StrUtils,
  AdvSmoothTouchKeyBoard, Grids, BaseGrid, AdvGrid, VidGrab, SkinExCtrls,
  RzStatus, ActnList;

type
  TForm1 = class(TForm)
    vol_down: TLabel;
    vol_up: TLabel;
    Play1: TLabel;
    Stop1: TLabel;
    Pitch_Down: TLabel;
    Pitch_Up: TLabel;
    effect1: TLabel;
    vocal1: TLabel;
    repeat1: TLabel;
    request1: TLabel;
    saran1: TLabel;
    call1: TLabel;
    preview1: TLabel;
    monitor: TLabel;
    list_add1: TLabel;
    list_up1: TLabel;
    list_down1: TLabel;
    playing_del: TLabel;
    playing_open: TLabel;
    playing_save: TLabel;
    playing_up: TLabel;
    playing_down: TLabel;
    list_pgdown: TLabel;
    list_pgup: TLabel;
    Label1: TLabel;
    next1: TLabel;
    pr: TLabel;
    VR: TLabel;
    username: TLabel;
    Edit8: TEdit;
    sb: TspSkinSlider;
    vol: TspSkinSlider;
    pitch: TspSkinSlider;
    Edit1: TEdit;
    Button1: TButton;
    PanelFullScreen: TPanel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    EditOpen: TEdit;
    EditKiller: TEdit;
    Panel3: TPanel;
    Panel5: TPanel;
    refresh: TEdit;
    Edit5: TEdit;
    Edit7: TEdit;
    Edit6: TEdit;
    member: TEdit;
    DSF: TspDynamicSkinForm;
    spSkinData1: TspSkinData;
    spSkinMessage1: TspSkinMessage;
    Timer1: TTimer;
    Room: TEdit;
    spSkinData2: TspSkinData;
    vkeys: TspSkinPanel;
    PanelPlayList: TspSkinPanel;
    gridb: TspSkinDBGrid;
    gridb_bar: TspSkinScrollBar;
    panel_preview: TspSkinPanel;
    skinList: TspCompressedSkinList;
    PopupMenuHouse: TspSkinPopupMenu;
    Karaoke1: TMenuItem;
    Disko1: TMenuItem;
    PopupMenuOthers: TspSkinPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    Jepang1: TMenuItem;
    Korea1: TMenuItem;
    SkinList2: TspCompressedSkinList;
    tutup: TLabel;
    record1: TLabel;
    VideoGrabber1: TVideoGrabber;
    crartis: TspSkinEdit;
    Depan: TLabel;
    Semua: TLabel;
    Title: TLabel;
    Artis: TLabel;
    crlagu: TspSkinEdit;
    Indo: TspSkinStdLabel;
    all: TspSkinStdLabel;
    dangdut: TspSkinStdLabel;
    daerah: TspSkinStdLabel;
    mandarin: TspSkinStdLabel;
    kanji: TspSkinStdLabel;
    baru: TspSkinStdLabel;
    Top100: TspSkinStdLabel;
    barat: TspSkinStdLabel;
    house: TspSkinStdLabel;
    others: TspSkinStdLabel;
    BtnTeknisiLogin: TspSkinSpeedButton;
    food1: TLabel;
    Marquee: TRzMarqueeStatus;
    Memo1: TMemo;
    vk: TAdvSmoothTouchKeyBoard;
    PanelSongList: TspSkinPanel;
    spSkinPanel3: TspSkinPanel;
    grid: TspSkinDBGrid;
    grid_bar: TspSkinScrollBar;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Action6: TAction;
    Action7: TAction;
    Action8: TAction;
    Action9: TAction;
    Action10: TAction;
    Action11: TAction;
    Action12: TAction;
    Action13: TAction;
    MonitorAct: TAction;
    Action15: TAction;
    ActDepan: TAction;
    ActSemua: TAction;
    ActTitle: TAction;
    ActArtis: TAction;
    help1: TLabel;
    BtnHelp: TspSkinButton;
    Timer2: TTimer;
    procedure DSFChangeSkinData(Sender: TObject);
    procedure gridDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure vol_downClick(Sender: TObject);
    procedure vol_upClick(Sender: TObject);
    procedure Play1Click(Sender: TObject);
    procedure vocal1Click(Sender: TObject);
    procedure spSkinButton7Click(Sender: TObject);
    procedure spSkinButton13Click(Sender: TObject);
    procedure spSkinButton4Click(Sender: TObject);
    procedure spSkinButton3Click(Sender: TObject);
    procedure spSkinButton2Click(Sender: TObject);
    procedure preview1Click(Sender: TObject);
    procedure editpassKeyPress(Sender: TObject; var Key: Char);
    procedure effect1Click(Sender: TObject);
    procedure playing_upClick(Sender: TObject);
    procedure playing_downClick(Sender: TObject);
    procedure playing_delClick(Sender: TObject);
    procedure list_add1Click(Sender: TObject);
    procedure list_down1Click(Sender: TObject);
    procedure list_up1Click(Sender: TObject);
    procedure list_pgupClick(Sender: TObject);
    procedure list_pgdownClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure monitorClick(Sender: TObject);
    procedure PanelFullScreenClick(Sender: TObject);
    procedure Pitch_DownClick(Sender: TObject);
    procedure Pitch_UpClick(Sender: TObject);
    procedure saran1Click(Sender: TObject);
    procedure crlaguChange(Sender: TObject);
    procedure sbChanged(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure next1Click(Sender: TObject);
    procedure prClick(Sender: TObject);
    procedure VRClick(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure volChange(Sender: TObject);
    procedure pitchChange(Sender: TObject);
    procedure EditOpenChange(Sender: TObject);
    procedure DBEdit6Change(Sender: TObject);
    procedure DBEdit7Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure playing_saveClick(Sender: TObject);
    procedure playing_openClick(Sender: TObject);
    procedure repeat1Click(Sender: TObject);
    procedure refreshChange(Sender: TObject);
    procedure sbChange(Sender: TObject);
    procedure crartisEnter(Sender: TObject);
    procedure crlaguEnter(Sender: TObject);
    procedure call1Click(Sender: TObject);
    procedure request1Click(Sender: TObject);
    procedure spSkinButton8Click(Sender: TObject);
    procedure spSkinButton15Click(Sender: TObject);
    procedure spSkinButton10Click(Sender: TObject);
    procedure gridbCellClick(Column: TspColumn);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure spSkinButton12Click(Sender: TObject);
    procedure spSkinButton1Click(Sender: TObject);
    procedure spSkinButton5Click(Sender: TObject);
    procedure spSkinButton14Click(Sender: TObject);
    procedure spSkinSpeedButton5Click(Sender: TObject);
    procedure spSkinSpeedButton4Click(Sender: TObject);
    procedure spSkinSpeedButton3Click(Sender: TObject);
    procedure spSkinSpeedButton2Click(Sender: TObject);
    procedure spSkinSpeedButton8Click(Sender: TObject);
    procedure spSkinSpeedButton1Click(Sender: TObject);
    procedure spSkinSpeedButton7Click(Sender: TObject);
    procedure spSkinSpeedButton6Click(Sender: TObject);
    procedure spSkinSpeedButton9Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure Jepang1Click(Sender: TObject);
    procedure Korea1Click(Sender: TObject);
    procedure Karaoke1Click(Sender: TObject);
    procedure Disko1Click(Sender: TObject);
    procedure gridbDblClick(Sender: TObject);
    procedure tutupClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure record1Click(Sender: TObject);
    procedure VideoGrabber1Click(Sender: TObject);
    procedure DepanClick(Sender: TObject);
    procedure TitleClick(Sender: TObject);
    procedure ArtisClick(Sender: TObject);
    procedure IndoClick(Sender: TObject);
    procedure Stop1Click(Sender: TObject);
    procedure allClick(Sender: TObject);
    procedure dangdutClick(Sender: TObject);
    procedure daerahClick(Sender: TObject);
    procedure mandarinClick(Sender: TObject);
    procedure kanjiClick(Sender: TObject);
    procedure baruClick(Sender: TObject);
    procedure Top100Click(Sender: TObject);
    procedure baratClick(Sender: TObject);
    procedure houseClick(Sender: TObject);
    procedure othersClick(Sender: TObject);
    procedure KategoriClick(Sender: TObject);
    procedure BtnTeknisiLoginClick(Sender: TObject);
    procedure food1Click(Sender: TObject);
    procedure SemuaClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Action6Execute(Sender: TObject);
    procedure Action7Execute(Sender: TObject);
    procedure Action8Execute(Sender: TObject);
    procedure Action9Execute(Sender: TObject);
    procedure Action10Execute(Sender: TObject);
    procedure Action11Execute(Sender: TObject);
    procedure Action12Execute(Sender: TObject);
    procedure Action13Execute(Sender: TObject);
    procedure MonitorActExecute(Sender: TObject);
    procedure ActTitleExecute(Sender: TObject);
    procedure ActArtisExecute(Sender: TObject);
    procedure help1Click(Sender: TObject);
    procedure gridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
    canRec, BeginRec, autoCek : boolean;
    procedure getSkin(AIndex: byte);
    procedure gerScreenSize(AWidth, AHeight: integer);
    procedure viewSongs(AParam: String);
    procedure playSong;
    procedure playRemoteSong(AIDNP: integer; AJudul,AArtis,AFile,AVol: String);
    procedure pauseSong;
    procedure WMSysCommand(var msg: TWMSysCommand); message WM_SysCommand;
    procedure clearLabel;
    procedure songQueue;
    procedure AutoUpdate;
    procedure ACari;
    procedure setSwActive(ASW: String);

    function getDurasi: TDateTime;
    function cekRoom: boolean;
    function prosesRecord: boolean;
    function Fsz: integer;
  public
    { Public declarations }
    procedure AppMessage(var Msg: TMSG; var HAndled: Boolean);
  end;

const
  SPI_SCREENSAVERRUNNING = 97;

var
  Form1: TForm1;
  chan, chan1{, chan2}: HSTREAM;
  rec : HRECORD;
  rep,fullscr,paused, finish: boolean;
  OldValue: Longbool;
  maxval, akat:integer;

implementation

uses u_dm, u_effect, Registry, u_layar, u_saran, u_save_song,
  u_open_song, u_pesan, u_request, u_record, uPopup, uPassword, uFood, u_Help;

{$R *.dfm}

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

function TForm1.getDurasi: TDateTime;
var ADurasi: String;
begin
  dm.openSQL(dm.qexec, 'select distinct waktu from transaksi_room '+
  'where id_room='''+dm.RoomID+''' order by id_transaksi desc ');
  ADurasi := FloatToStr(dm.qexec.Fields[0].AsFloat * 60);
  dm.inform(ADurasi, dm.spSkinMessage1);
  Dm.OpenSQL(dm.qexec,'select date_add(NOW(), interval '+ADurasi+' minute)');
  Result := dm.qexec.Fields[0].AsDateTime;
end;


function TimedShutDown(Computer: string; Msg: string; Time: Word; Force: Boolean; Reboot: Boolean): Boolean;
var
  rl: Cardinal;
  hToken: Cardinal;
  tkp: TOKEN_PRIVILEGES;
begin
  //get user privileges to shutdown the machine, we are talking about win nt and 2k here
  if not OpenProcessToken(GetCurrentProcess, TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, hToken) then
         ShowMessage('Cannot open process token.')
  else
  begin
    if LookupPrivilegeValue(nil, 'SeShutdownPrivilege', tkp.Privileges[0].Luid) then
    begin
      tkp.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
      tkp.PrivilegeCount := 1;
      AdjustTokenPrivileges(hToken, False, tkp, 0, nil, rl);
      if GetLastError <> ERROR_SUCCESS then
         ShowMessage('Error adjusting process privileges.');
    end
    else ShowMessage('Cannot find privilege value.');
  end;
  Result := InitiateSystemShutdown(PChar(Computer), PChar(Msg), Time, Force, Reboot);
end;

Procedure ShowDriveSerialNo(Drive : String); // Drive as 'c:' or 'd:', ...
var VolSerNum: DWORD;
    Dummy1, Dummy2: DWORD;
begin
  if GetVolumeInformation(pchar(drive+':\'), NIL, 0, @VolSerNum, Dummy1, Dummy2, NIL, 0) then ShowMessage(Format('%.4x:%.4x', [HiWord(VolSerNum), LoWord(VolSerNum)]));
End;

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

procedure ShowStartButton(bvisible: Boolean);
var
h: hwnd;
TaskWindow: hwnd;
begin
if bvisible then
begin
h := FindWindowEx(GetDesktopWindow, 0, 'Button', nil);
TaskWindow := FindWindow('Shell_TrayWnd', nil);
ShowWindow(h, 1);
Windows.SetParent(h, TaskWindow);
end
else
begin
h := FindWindowEx(FindWindow('Shell_TrayWnd', nil), 0, 'Button', nil);
ShowWindow(h, 0);
Windows.SetParent(h, 0);
end;
end;

function ScreenSaverEnabled: Boolean;
var
  status: Bool;
begin
  SystemParametersInfo(SPI_GETSCREENSAVEACTIVE, 0, @status, 0);
  Result := status = True;
end;

function UpTime: string;
const
  ticksperday: Integer    = 1000 * 60 * 60 * 24;
  ticksperhour: Integer   = 1000 * 60 * 60;
  ticksperminute: Integer = 1000 * 60;
  tickspersecond: Integer = 1000;
var
  t:          Longword;
  d, h, m, s: Integer;
begin
  t := GetTickCount;

  d := t div ticksperday;
  Dec(t, d * ticksperday);

  h := t div ticksperhour;
  Dec(t, h * ticksperhour);

  m := t div ticksperminute;
  Dec(t, m * ticksperminute);

  s := t div tickspersecond;

  Result := 'Uptime: ' + IntToStr(d) + ' Days ' + IntToStr(h) + ' Hours ' + IntToStr(m) +
    ' Minutes ' + IntToStr(s) + ' Seconds';
end;

procedure EnableCTRLALTDEL(YesNo : boolean);
const
sRegPolicies = '\Software\Microsoft\Windows\CurrentVersion\Policies';
begin
  with TRegistry.Create do
  try
    RootKey:=HKEY_CURRENT_USER;
    if OpenKey(sRegPolicies+'\System\',True) then
    begin
      case YesNo of
        False:
          begin
            WriteInteger('DisableTaskMgr',1);
          end;
        True:
          begin
            WriteInteger('DisableTaskMgr',0);
          end;
      end;
    end;
    CloseKey;
    if OpenKey(sRegPolicies+'\Explorer\',True) then
    begin
      case YesNo of
        False:
          begin
            WriteInteger('NoChangeStartMenu',1);
            WriteInteger('NoClose',1);
            WriteInteger('NoLogOff',1);
          end;
        True:
          begin
            WriteInteger('NoChangeStartMenu',0);
            WriteInteger('NoClose',0);
            WriteInteger('NoLogOff',0);
          end;
      end;
    end;
    CloseKey;
  finally
    Free;
  end;
end;

procedure TForm1.WMSysCommand(var msg: TWMSysCommand);
begin
  if msg.CmdType and $FFF0 = SC_MINIMIZE then
    hide
  else
    inherited;
end;

procedure TForm1.ArtisClick(Sender: TObject);
begin
  dsf.SwitchSetState('sw_title', swsOff);
  ACari;
end;

procedure TForm1.AutoUpdate;
var AFile: String;
begin
  AFile := ExtractFilePath(Application.ExeName)+'AddQuery.txt';
  if FileExists(AFile) then
  begin
    Memo1.Lines.LoadFromFile(AFile);
    dm.execSQL(dm.qexec, Memo1.Lines.Text);
    DeleteFile(AFile);
  end;
end;

procedure TForm1.baratClick(Sender: TObject);
begin
  viewSongs('Barat');
  Edit1.Text := 'Barat';
  setSwActive('btn_barat');
end;

procedure TForm1.baruClick(Sender: TObject);
begin
  viewSongs('Baru');
  setSwActive('btn_baru');
end;

procedure TForm1.BtnTeknisiLoginClick(Sender: TObject);
begin
  if not DM.TeknisiMode then
  begin
    dm.IDTmp := 'Teknisi';
    FrmPassword.ShowModal;
  end
  else
  begin
    dm.alert('Teknisi Mode Sudah Running', dm.spSkinMessage1);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  dm.qexec1.SQL.Clear;
  dm.qexec1.SQL.Add('select * from room where id_room='''+room.Text+'''');
  dm.qexec1.Open;
  //ShowMessage(dm.qexec1.FieldByName('killer').AsString);
  if dm.qexec1.FieldByName('killer').AsString='Shutdown' then
  begin
    dm.alert('s', spSkinMessage1);
    ShellExecute(Handle, 'open', PChar('shutdown.exe'), PChar('-s'), nil, sw_show);
    //TimedShutDown(''''+Room.Text+'''','Maaf, Komputer akan dimatikan dalam 10 detik!',10,True, False);
    Application.Terminate;
  end;
  if dm.qexec1.FieldByName('killer').AsString='Restart' then
  begin
    dm.alert('r', spSkinMessage1);
    ShellExecute(Handle, 'open', PChar('shutdown.exe'), PChar('-r'), nil, sw_show);
    TimedShutDown(''''+Room.Text+'''','Maaf, Komputer akan direstart dalam 10 detik!',10,True, True);
    Application.Terminate;
  end;

  label1.Caption := UpTime;
end;

procedure TForm1.call1Click(Sender: TObject);
begin
if cekRoom then
begin
  PanelSongList.Enabled:=not PanelSongList.Enabled;
  if PanelSongList.Enabled then
  begin
    panel_preview.SendToBack;
    xVideo_StreamFree(chan1);
  end else PanelSongList.Enabled:=True;
  form1.FormStyle:=fsNormal;
  f_pesan.ShowModal;
end;
end;

function TForm1.cekRoom: boolean;
begin
 Result := true;
 if DM.getIntegerFromSQL(DM.qexec, 'select count(id_room) from room where ip_address='+
    QuotedStr(DM.IPAddress)) > 0 then
 begin
    DM.openSQL(Dm.qexec3, 'select status, mulai, selesai from room where (ip_address='+
      QuotedStr(DM.IPAddress)+' and not NoTransaksi is null) or (status = ''C'') ');
    if DM.qexec3.RecordCount = 0
      then begin
        Result := false;
        dm.inform('ROOM IP '+DM.IPAddress+' BELUM AKTIF'+#13+'SEGERA HUBUNGI OPERATOR', dm.spSkinMessage1);
      end
        else if (DM.qexec3.Fields[2].AsDateTime < dm.serverNow)
          and (DM.qexec3.Fields[0].AsString <> 'C') then
        begin
          Result := false;
          dm.inform('DURASI ROOM SUDAH HABIS'+#13+'SEGERA HUBUNGI OPERATOR', dm.spSkinMessage1);
        end;
 end
 else begin
  dm.inform('ROOM '+DM.IPAddress+' BELUM TERDAFTAR'+#13+'SEGERA HUBUNGI OPERATOR',dm.spSkinMessage1);
  Result := false;
 end;
 if Result = false then
 begin
  Play1.Tag := 0;
  dsf.SwitchSetState('btn_play', swsOff);
 end else
  dsf.SwitchSetState('btn_play', swsOn);
end;

procedure TForm1.clearLabel;
var i : integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TspSkinStdLabel then
      (Components[i] as TspSkinStdLabel).Caption := '';
  end;

  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TLabel then
      (Components[i] as TLabel).Caption := '';
  end;
    autoCek := false;
    dsf.SwitchSetState('sw_semua', swsOn);
    dsf.SwitchSetState('sw_title', swsOn);
end;

procedure TForm1.tutupClick(Sender: TObject);
begin
  if DM.TeknisiMode then
  begin
    dm.execSQL(dm.qexec,'update teknisi_log set EndDate='+QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss',dm.serverNow))+
    ' where id='+DM.IDTeknisi);
    dm.execSQL(dm.qexec,'update room set status=''A'' where id_room='+QuotedStr(DM.RoomID));
  end;
  DM.IDTmp := 'Close';
  close;
end;

procedure TForm1.VideoGrabber1Click(Sender: TObject);
begin
  if not prosesRecord then
    dm.alert('TIDAK DAPAT MEREKAM VIDEO', dm.spSkinMessage1);
end;

procedure TForm1.crartisEnter(Sender: TObject);
begin
  PanelSongList.Enabled:=not PanelSongList.Enabled;
  if PanelSongList.Enabled then
  begin
    panel_preview.SendToBack;
    xVideo_StreamFree(chan1);
  end else PanelSongList.Enabled:=True;

  crlagu.Clear;
end;

procedure TForm1.crlaguChange(Sender: TObject);
var ACari: String;
begin
  ACari := StringReplace(crlagu.text,'''','''''',[rfReplaceAll]);
  if trim(Edit1.Text)<>'' then
  begin
    dm.ListSong.Close;
    dm.ListSong.SQL.Clear;
    if Depan.Tag = 1 then
      dm.ListSong.SQL.Add('select * from song_list where bahasa='+QuotedStr(Edit1.Text)+
      IfThen(Artis.Tag = 0,' and judul like '''+Acari+'%'' or judul2 like '''+Acari+'%''',
      ' and artis like '''+Acari+'%'' or artis2 like '''+Acari+'%'''))
    else
      dm.ListSong.SQL.Add('select * from song_list where bahasa='+QuotedStr(edit1.Text)+
      IfThen(Artis.Tag = 0,' and judul like ''%'+Acari+'%'' or judul2 like ''%'+Acari+'%''',
      ' and artis like ''%'+Acari+'%'' or artis2 like ''%'+Acari+'%'''));
    dm.ListSong.Open;
  end else
  begin
    dm.ListSong.Close;
    dm.ListSong.SQL.Clear;
    if Depan.Tag = 1 then
      dm.ListSong.SQL.Add('select * from song_list '+
      IfThen(Artis.Tag = 0,' where judul like '''+Acari+'%'' OR judul2 like '''+Acari+'%''',
      ' where artis like '''+Acari+'%'' OR artis2 like '''+Acari+'%'''))
    else
      dm.ListSong.SQL.Add('select * from song_list '+
      IfThen(Artis.Tag = 0,' where judul like ''%'+Acari+'%'' or judul2 like ''%'+Acari+'%'' ',
      ' where artis like ''%'+Acari+'%'' or artis2 like ''%'+Acari+'%'' '));
    dm.ListSong.Open;
  end;
end;

procedure TForm1.crlaguEnter(Sender: TObject);
begin
  PanelSongList.Enabled:=not PanelSongList.Enabled;
  if PanelSongList.Enabled then
  begin
    panel_preview.SendToBack;
    xVideo_StreamFree(chan1);
  end else PanelSongList.Enabled:=True;

  crartis.Clear;
end;

procedure TForm1.daerahClick(Sender: TObject);
begin
  viewSongs('Daerah');
  Edit1.Text := 'Daerah';
  setSwActive('btn_daerah');
end;

procedure TForm1.dangdutClick(Sender: TObject);
begin
  viewSongs('Dangdut');
  Edit1.Text := 'Dangdut';
  setSwActive('btn_dangdut');
end;

procedure TForm1.DBEdit6Change(Sender: TObject);
begin
  if dm.t_roomstatus.Value='A' then
     EditOpen.Text:='OPEN';
  if dm.t_roomstatus.Value='S' then
     EditOpen.Text:='OPEN';
  if dm.t_roomstatus.Value='O' then
     EditOpen.Text:='CLOSED';
end;

procedure TForm1.DBEdit7Change(Sender: TObject);
begin
  if dm.t_roomKiller.Value='Standby' then
     EditKiller.Text:='Standby';
  if dm.t_roomKiller.Value='Shutdown' then
     EditKiller.Text:='Shutdown';
  if dm.t_roomKiller.Value='Restart' then
     EditKiller.Text:='Restart';
end;

procedure TForm1.DepanClick(Sender: TObject);
begin
  dsf.SwitchSetState('sw_semua', swsOff);
  dsf.SwitchSetState('sw_depan', swsOn);
  ACari;
end;

procedure TForm1.Disko1Click(Sender: TObject);
begin
 viewSongs('Disco');
 Edit1.Text := 'Disco';
end;

procedure TForm1.DSFChangeSkinData(Sender: TObject);
begin
  with DSF do
  begin
    LinkControlToArea('grida', PanelSongList);
    LinkControlToArea('crlagu', crlagu);
    LinkControlToArea('crartis', crartis);
    LinkControlToArea('gridb', PanelPlayList);
    LinkControlToArea('scroll_bar', sb);
    LinkControlToArea('volume', Panel3);
    LinkControlToArea('pitch', Panel5);
    LinkControlToArea('play', Play1);
    LinkControlToArea('stop', stop1);
    LinkControlToArea('repeat', repeat1);
    LinkControlToArea('vocal', vocal1);
    LinkControlToArea('effect', effect1);
    LinkControlToArea('request', request1);
    LinkControlToArea('saran', saran1);
    LinkControlToArea('call', call1);
    LinkControlToArea('preview', preview1);
    LinkControlToArea('food', food1);
    LinkControlToArea('list_add', list_add1);
    LinkControlToArea('list_up', list_up1);
    LinkControlToArea('list_down', list_down1);
    LinkControlToArea('vol_down', vol_down);
    LinkControlToArea('vol_up', vol_up);
    LinkControlToArea('pitch_up', Pitch_Up);
    LinkControlToArea('pitch_down', Pitch_Down);
    LinkControlToArea('playing_del', playing_del);
    LinkControlToArea('playing_open', playing_open);
    LinkControlToArea('playing_save', playing_save);
    LinkControlToArea('playing_up', playing_up);
    LinkControlToArea('playing_down', playing_down);
    LinkControlToArea('login1', BtnTeknisiLogin);
    LinkControlToArea('list_pgup', list_pgup);
    LinkControlToArea('list_pgdown', list_pgdown);
    LinkControlToArea('next', next1);
    LinkControlToArea('all', PanelFullScreen);
    LinkControlToArea('PR', PR);
    LinkControlToArea('VR', VR);
    LinkControlToArea('marquee', marquee);
    LinkControlToArea('virtual_keyboard', vkeys);
    LinkControlToArea('panel_preview', panel_preview);
    LinkControlToArea('tutup', tutup);
    LinkControlToArea('record', record1);
    LinkControlToArea('videoGrabber', VideoGrabber1);
    LinkControlToArea('monitor', monitor);
    LinkControlToArea('cari_depan', Depan);
    LinkControlToArea('cari_semua', Semua);
    LinkControlToArea('cari_judul', Title);
    LinkControlToArea('cari_artis', Artis);
    LinkControlToArea('indo', Indo);
    LinkControlToArea('song_all', all);
    LinkControlToArea('dangdut', dangdut);
    LinkControlToArea('daerah', daerah);
    LinkControlToArea('barat', barat);
    LinkControlToArea('mandarin', mandarin);
    LinkControlToArea('kanji', kanji);
    LinkControlToArea('baru', baru);
    LinkControlToArea('top100', Top100);
    LinkControlToArea('house', house);
    LinkControlToArea('others', others);
    LinkControlToArea('help', BtnHelp);
  end;
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
  if Edit2.Text='True' then
  begin
    if edit6.Text='L' then
       xVideo_ChannelSetAttribute(chan,xVideo_ATTRIB_ChanProcess,1);
    if edit6.Text='R' then
       xVideo_ChannelSetAttribute(chan,xVideo_ATTRIB_ChanProcess,2)
  end else
  begin
    if edit6.Text='L' then
       xVideo_ChannelSetAttribute(chan,xVideo_ATTRIB_ChanProcess,2);
    if edit6.Text='R' then
       xVideo_ChannelSetAttribute(chan,xVideo_ATTRIB_ChanProcess,1)
  end;
end;

procedure TForm1.Edit3Change(Sender: TObject);
begin
  if Edit3.Text='True' then
  begin
    xVideo_ChannelStop(chan);
    dsf.SwitchSetState('btn_play', swsOff);
    Play1.Hint:='PLAY';
  end else
  begin
    xVideo_ChannelPlay(chan);
    dsf.SwitchSetState('btn_play', swsOn);
    Play1.Hint:='PAUSE';
  end;
end;

procedure TForm1.Edit5Change(Sender: TObject);
begin
  if (Edit5.Text='0') and (dm.now_playing.RecordCount<>0) or
  (Edit5.Text=edit7.Text)
  then begin
  gridb.DataSource.DataSet.First;
  gridb.OnDblClick(self);
  end;
end;

procedure TForm1.EditOpenChange(Sender: TObject);
begin
  if EditOpen.Text='OPEN' then
  begin
    dm.ListSong.Open;
    dm.now_playing.Open;
  end else
  begin
    dm.ListSong.Close;
    dm.now_playing.Close;
    xVideo_StreamFree(chan1);
    xVideo_StreamFree(chan);
  end;
end;

procedure TForm1.editpassKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    dm.tuser_dat.Open;
    if (dm.tuser_dat.Locate('username',username.Caption,[]))then
//    if encodePassword(dm.tuser_datpassword.Value)=editpass.Text then
    begin
      dm.tuser_dat.Close;
      Application.Terminate;
    end else
    begin
      form1.FormStyle:=fsNormal;
      spSkinMessage1.MessageDlg('Password tidak sesuai!.', mtInformation,
      [mbOk], 0);
//      editpass.SetFocus;
//      form1.FormStyle:=fsStayOnTop;
    end;
  end;
end;

procedure TForm1.effect1Click(Sender: TObject);
begin
if cekRoom then
begin
  PanelSongList.Enabled:=not PanelSongList.Enabled;
  if PanelSongList.Enabled then
  begin
    panel_preview.SendToBack;
    xVideo_StreamFree(chan1);
  end else PanelSongList.Enabled:=True;
  f_effect.Show;
end;
end;

procedure TForm1.monitorClick(Sender: TObject);
begin
if cekRoom then
begin
  edit8.SetFocus;
  if PanelSongList.Enabled then
  begin
//    PanelKategori.SendToBack;
    panel_preview.SendToBack;
    xVideo_StreamFree(chan1);
  end else PanelSongList.Enabled:=True;
  if sb.Value=0 then
  begin
    form1.FormStyle:=fsNormal;
    spSkinMessage1.MessageDlg('Maaf, tdk ada lagu yang diputar!', mtInformation,
      [mbOk], 0);
    exit;
//    form1.FormStyle:=fsStayOnTop;
  end;
  if GetSystemMetrics (SM_CMONITORS)=1 then
  begin
    PanelFullScreen.Visible:=not PanelFullScreen.Visible;
  end else
  begin
    form1.FormStyle:=fsNormal;
    spSkinMessage1.MessageDlg('Maaf, Monitor tidak dapat diaktifkan bersama layar.', mtInformation,
      [mbOk], 0);
//    form1.FormStyle:=fsStayOnTop;
  end;
  if PanelFullScreen.Visible=True then
    begin
      PanelSongList.SendToBack;
      panel3.SendToBack;
      panel5.SendToBack;
//      PanelKategori.SendToBack;
      PanelPlayList.SendToBack;
      vkeys.SendToBack;
      VideoGrabber1.SendToBack;
      BtnTeknisiLogin.SendToBack;
      BtnHelp.SendToBack;
    end else
    begin
      PanelSongList.BringToFront;
      panel3.BringToFront;
      panel5.BringToFront;
//      PanelKategori.BringToFront;
      PanelPlayList.BringToFront;
      vkeys.BringToFront;
      BtnTeknisiLogin.BringToFront;
      BtnHelp.BringToFront;
    end;
  end;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FrmPassword.ShowModal;
  CanClose := FrmPassword.ModalResult = mrOk;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  wndTaskbar: HWND;
  hMutex: THandle;
begin
  akat := 0;
  dsf.SwitchSetState('btn_all', swsOn);
  canRec := false;
//  gerScreenSize(Screen.Width, Screen.Height);
  xVideo_Init(handle);
  xVideo_SetConfig(xVideo_WindowLessHandle,PanelFullScreen.Handle);
  Memo1.Clear;
  hMutex := CreateMutex(nil, False, 'termBlaster');
  if WaitForSingleObject (HMutex, 0) = WAIT_TIMEOUT then
  begin
    MessageDlg ('Aplikasi sudah running!', mtInformation, [mbOK], 0);
    Application.Terminate;
    exit;
  end;  wndTaskbar := FindWindow('Shell_TrayWnd', nil);
  if wndTaskbar <> 0 then
  begin
    EnableWindow(wndTaskbar, False);
    ShowWindow(wndTaskbar, SW_HIDE);
    ShowStartButton(False); // or true to reshow
  end;

 ShellExecute(Handle,'open',PChar(ExtractFilePath(Application.ExeName)+'power.cmd'),'','',SW_SHOWNORMAL);
 fullscr:=false;
 paused:=false;
// doublebuffered:=true;
 xVideo_Init(handle);
  // xVideo_LoadPlugin3('xVideo_MP3.dll');
 xVideo_LoadPlugin3('xVideo_AAC.dll',0);
  //Tell xVideo to use FFDSHOW Audio Decoder
  xVideo_LoadPlugin2(PChar('C:\program files\K-Lite Codec Pack\ffdshow\ffdshow.ax'),
                    PChar('{0F40E1E5-4F79-4988-B1A9-CC98794E6B55}'),
                    PChar('FFDSHOW Audio Decoder'), 0);

 xVideo_SetConfig(xVideo_FLOATDSP,1);
 //xVideo_LoadPlugin('xVideo_FFMPEG.DLL',CLSID_DSHOWPLUGIN ,nil);

  xVideo_SetConfig(xVideo_VideoRenderer,xVideo_VMR7);
  Application.OnMessage := AppMessage;
  ShellExecute(Handle,'open',PChar('importing.cmd'),'',PChar(ExtractFilePath(Application.ExeName)+'MySQL Server 5.1\bin\'),SW_SHOWMINIMIZED);
//  DeleteFile(ExtractFilePath(Application.ExeName)+'MySQL Server 5.1\bin\importing.cmd');
end;

procedure TForm1.FormDestroy(Sender: TObject);
var
  wndTaskbar: HWND;
begin
  xVideo_Free();
  wndTaskbar := FindWindow('Shell_TrayWnd', nil);
  if wndTaskbar <> 0 then
  begin
    {EnableWindow(wndTaskbar, False);
    ShowWindow(wndTaskbar, SW_HIDE);}
    EnableWindow(wndTaskbar, True);
    ShowWindow(wndTaskbar, SW_SHOW);
  end;

  EnableCTRLALTDEL(true);
  ShowStartButton(True); {win xp}
  //ShowStartButton(False);
  ShellExecute(Handle,'open',PChar(ExtractFilePath(Application.ExeName)+'power1.cmd'),'','',SW_SHOWNORMAL);
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if Key = VK_F1 then
//    Stop1.OnClick(self)
//  else if Key = VK_F2 then
//    next1.OnClick(self)
//  else if Key = VK_F4 then
//    frmPassword.ShowModal;
  //else if Key = ... then
    // and so on, for other function keys
    if key=vk_return then
      gridbDblClick(Sender);
end;

procedure TForm1.ACari;
begin                                  
if dsf.SwitchGetState('sw_depan') = swsOn
then
  Depan.Tag := 1 else
  Depan.Tag := 0;

if dsf.SwitchGetState('sw_semua') = swsOn
then
  Semua.Tag := 1 else
  Semua.Tag := 0;

if dsf.SwitchGetState('sw_title') = swsOn
then
  Title.Tag := 1 else
  Title.Tag := 0;

if dsf.SwitchGetState('sw_artis') = swsOn
then
  Artis.Tag := 1 else
  Artis.Tag := 0;
end;

procedure TForm1.ActArtisExecute(Sender: TObject);
begin
  dsf.SwitchSetState('sw_title', swsOff);
  dsf.SwitchSetState('sw_artis', swsOn);
  ACari;
end;

procedure TForm1.Action10Execute(Sender: TObject);
begin
  vol_upClick(Sender);
end;

procedure TForm1.Action11Execute(Sender: TObject);
begin
  help1Click(Sender);
end;

procedure TForm1.Action12Execute(Sender: TObject);
begin
  Pitch_DownClick(Sender);
end;

procedure TForm1.Action13Execute(Sender: TObject);
begin
  Pitch_UpClick(Sender);
end;

procedure TForm1.Action1Execute(Sender: TObject);
begin
crlagu.SetFocus;
end;

procedure TForm1.Action2Execute(Sender: TObject);
begin
  if PanelSongList.Enabled then
    grid.SetFocus;
end;

procedure TForm1.Action3Execute(Sender: TObject);
begin
  gridb.SetFocus;
end;

procedure TForm1.Action4Execute(Sender: TObject);
begin
  if akat < 12 then begin
    case akat of
      0 : allClick(Sender);
      1 : IndoClick(Sender);
      2 : dangdutClick(Sender);
      3 : daerahClick(Sender);
      4 : baratClick(Sender);
      5 : mandarinClick(Sender);
      7 : kanjiClick(Sender);
      8 : houseClick(Sender);
      9 : othersClick(Sender);
      10: baruClick(Sender);
      11 : Top100Click(Sender);
    end;
    inc(akat);
    if akat = 12 then akat := 0;
    
  end;
end;

procedure TForm1.Action6Execute(Sender: TObject);
begin
  next1Click(Sender);
end;

procedure TForm1.Action7Execute(Sender: TObject);
begin
  preview1Click(Sender);
end;

procedure TForm1.Action8Execute(Sender: TObject);
begin
  vocal1Click(Sender);
end;

procedure TForm1.Action9Execute(Sender: TObject);
begin
  vol_downClick(Sender);
end;

procedure TForm1.ActTitleExecute(Sender: TObject);
begin
  dsf.SwitchSetState('sw_artis', swsOff);
  dsf.SwitchSetState('sw_title', swsOn);
  ACari;
end;

procedure TForm1.allClick(Sender: TObject);
begin
  viewSongs('');
  Edit1.Text := '';
  setSwActive('btn_all');
end;

procedure TForm1.AppMessage(var Msg: TMSG; var Handled: Boolean);
begin
  // let your application handle all messages initially
  Handled := False;
  case Msg.Message of
    WM_SYSKEYDOWN:
    begin
      if Msg.wParam = VK_F4 {or VK_LWIN or VK_RWIN} then
        Handled := True; // don't allow ALT-F4
      if Msg.wParam = VK_MENU or VK_RMENU then
        Handled := True; // don't allow ALT-F4
    end;
  end;

  if((WM_SYSCOMMAND = Msg.Message) and
    (SC_SCREENSAVE = Msg.wParam) )then
    Handled := True;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  hwndOwner: HWnd;
begin
//  dm.execSQL(DM.qexec, 'truncate table song_list');
//  ShellExecute(Handle,'open',PChar('importing.cmd'),'',PChar(ExtractFilePath(Application.ExeName)+'MySQL Server 5.1\bin\'),SW_SHOWMINIMIZED);
  AutoUpdate;
  clearLabel;
  DM.TeknisiMode := false;
  gerScreenSize(Screen.Width, Screen.Height);
  panel_preview.SendToBack;
  Room.Text := DM.RoomID;
  marquee.Caption:='';
  sb.Value:=0;
  Edit2.Text:='False';
//  Edit3.Text:='true';
  paused:=true;
//  Edit3.OnChange(Self);
  hwndOwner := GetWindow(Handle, GW_OWNER);
  ShowWindow(hwndOwner, SW_HIDE);
  // For Windows 2000, additionally call the ShowWindowAsync function:
  ShowWindowAsync(hwndOwner, SW_HIDE);
  ShowWindowAsync(Self.Handle, SW_HIDE);

    dm.qexec.SQL.Clear;
    dm.qexec.SQL.Add('delete from now_playing where room='''+room.Text+'''');
    dm.qexec.Execute;

    dm.qexec.SQL.Clear;
    dm.qexec.SQL.Add('update room set killer=''Standby'' where id_room='''+room.Text+'''');
    dm.qexec.Execute;
    //end of home


    vol.Value:=50;
    dm.qexec.SQL.Clear;
    dm.qexec.SQL.Add('select * from room where id_room=''SERVER''');
    dm.qexec.Open;
    if dm.qexec.FieldByName('status').Value<>'A' then
    begin
      form1.FormStyle:=fsNormal;
      spSkinMessage1.MessageDlg('Maaf, Server belum aktif, Aplikasi dihentikan.', mtInformation,
      [mbOk], 0);
      Application.Terminate;
    end else
    begin
      EditOpen.Text:='OPEN';
      //dm.t_room.Open;
    end;
    dm.now_playing.Close;
    dm.now_playing.Filter:='room='''+Room.Text+'''';
    dm.now_playing.Filtered:=True;
    dm.now_playing.Open;

    vkeys.Visible := not vkeys.Visible;
//    Label_pass.Visible:=false;
//    editpass.Visible:=false;

    EnableCTRLALTDEL(false);
    if GetSystemMetrics (SM_CMONITORS)>1 then with form3 do
    begin
      left:=Screen.Monitors[1].Left;
      Top:=Screen.Monitors[1].Top;
      BringToFront;
      Show;
    end;
    if dm.ac.Connected then
    timer1.Enabled:=True;

    grid.Columns[0].Width:=(grid.Width div 2)+80;
    dsf.FForm:=Form1;

 // end else Application.Terminate;
end;


function TForm1.Fsz: integer;
begin
  Result := 14;
//  Result := DM.getIntegerFromSQL(dm.qexec, 'select fontSize from setting where active=1 ');
  dm.openSQL(dm.qexec,'select distinct fontSize from setting where active=1 ');
  if dm.qexec.RecordCount > 0 then
    Result := dm.qexec.Fields[0].AsInteger;
end;

procedure TForm1.gerScreenSize(AWidth, AHeight: integer);
begin
    SetScreenResolution(1024, 768);
    vkeys.Width   := Trunc(0.62* Screen.Width);
    vkeys.Height  := Trunc(0.28* Screen.Height);
    vk.Width      := vkeys.Width;
    vk.Height     := vkeys.Height;
    VideoGrabber1.Visible := canRec;
    dm.openSQL(dm.qexec,'select distinct fontSize,FontName,IF(FontStyle is null,''clYellow'',FontStyle) AS FontColor from setting where active=1 ');
//      spSkinData1.SkinIndex := 10;
    grid.Font.Size:=dm.qexec.Fields[0].AsInteger;
    grid.Font.Name :=dm.qexec.Fields[1].AsString;
    grid.Font.Color :=StringToColor(dm.qexec.Fields[2].AsString);
    gridb.Font.Size:=dm.qexec.Fields[0].AsInteger;
    gridb.Font.Name :=dm.qexec.Fields[1].AsString;
//    crlagu.DefaultFont.Size:=dm.qexec.Fields[0].AsInteger;
    crlagu.DefaultFont.Size:=26;
    crlagu.DefaultFont.Name:=dm.qexec.Fields[1].AsString;
end;

procedure TForm1.getSkin(AIndex: byte);
begin

end;

procedure TForm1.gridbCellClick(Column: TspColumn);
begin
  if PanelFullScreen.Visible=True then
  begin
    panel3.SendToBack;
    panel5.SendToBack;
  end;
end;

procedure TForm1.gridbDblClick(Sender: TObject);
begin
  //playSong;
  Stop1Click(Sender);
  Play1Click(Sender);
end;

procedure TForm1.gridDblClick(Sender: TObject);
var maxrec:integer;
begin
  PanelSongList.Enabled:=not PanelSongList.Enabled;
  if PanelSongList.Enabled then
  begin
    panel_preview.SendToBack;
    xVideo_StreamFree(chan1);
  end else PanelSongList.Enabled:=True;

  if not dm.ListSong.IsEmpty then
  begin
    dm.qexec.SQL.Clear;
    dm.qexec.SQL.Add('select max(IDNP) as maxrec from now_playing');
    dm.qexec.Open;
    maxrec:=dm.qexec.FieldByName('maxrec').AsInteger;

    dm.now_playing.Append;
    dm.now_playingIDNP.Value:=maxrec+1;
    dm.now_playingroom.Value:=Room.Text;
    dm.now_playingtanggal.Value:=now;
    dm.now_playingjudul.Value:=dm.ListSong.FieldByName('judul').AsString;
    dm.now_playingartis.Value:=dm.ListSong.FieldByName('artis').AsString;
    dm.now_playingdirektori.Value:=dm.ListSong.FieldByName('direktori').AsString;
    dm.now_playingnama_file.Value:=dm.ListSong.FieldByName('NamaFile').AsString;
    dm.now_playingVolume.Value:=dm.ListSong.FieldByName('volume').Value;
    dm.now_playing.Post;
    dm.now_playing.Close;
    dm.now_playing.Open;
    songQueue;
  end else
  begin
    form1.FormStyle:=fsNormal;
    spSkinMessage1.MessageDlg('Playlist masih kosong, silahkan hubungi Admin.', mtInformation,
      [mbOk], 0);
//    form1.FormStyle:=fsStayOnTop;
  end;
  grid.SetFocus;
end;

procedure TForm1.gridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
  gridDblClick(Sender);
end;

procedure TForm1.help1Click(Sender: TObject);
begin
  frm_Help := Tfrm_Help.Create(Application);
  frm_help.ShowModal;
end;

procedure TForm1.houseClick(Sender: TObject);
begin
  dm.IDTmp := '0';
  FrmPupop.Showmodal;
  viewSongs(FrmPupop.Executed);
//  FrmPupop.Left := Form1.Width - 350;
  Edit1.Text := FrmPupop.Executed;
  setSwActive('btn_house');
end;

procedure TForm1.IndoClick(Sender: TObject);
begin
  viewSongs('Indonesia');
  Edit1.Text := 'Indonesia';
  setSwActive('btn_indo');
end;

procedure TForm1.Jepang1Click(Sender: TObject);
begin
 viewSongs('Jepang');
 Edit1.Text := 'Jepang';
end;

procedure TForm1.kanjiClick(Sender: TObject);
begin
  viewSongs('Kanji');
  Edit1.Text := 'Kanji';
  setSwActive('btn_kanji');
end;

procedure TForm1.Karaoke1Click(Sender: TObject);
begin
 viewSongs('Karaoke');
 Edit1.Text := 'Karaoke';
end;


procedure TForm1.KategoriClick(Sender: TObject);
begin
  ShowMessage('');
end;

procedure TForm1.Korea1Click(Sender: TObject);
begin
 viewSongs('Korea');
 Edit1.Text := 'Korea';
end;

procedure TForm1.food1Click(Sender: TObject);
begin
  if dm.getIntegerFromSQL(DM.qexec,'select CEILING((UNIX_TIMESTAMP(selesai) - UNIX_TIMESTAMP(now()))/60) AS sisa from room where id_room='+QuotedStr(DM.RoomID))>
  dm.getIntegerFromSQL(DM.qexec,'select distinct(maxfoodOrderTime) from setting where active=1') then
    FrmFood.Showmodal else
    DM.alert('Maaf, anda tidak dapat melakukan order!'+#13+'Durasi tidak mencukupi', DM.spSkinMessage1);
end;

procedure TForm1.list_add1Click(Sender: TObject);
begin
  PanelSongList.Enabled:=not PanelSongList.Enabled;
  if PanelSongList.Enabled then
  begin
    panel_preview.SendToBack;
    xVideo_StreamFree(chan1);
  end else PanelSongList.Enabled:=True;
  grid.OnDblClick(self);
end;

procedure TForm1.list_down1Click(Sender: TObject);
begin
  PanelSongList.Enabled:=not PanelSongList.Enabled;
  if PanelSongList.Enabled then
  begin
    panel_preview.SendToBack;
    xVideo_StreamFree(chan1);
  end else PanelSongList.Enabled:=True;

  if not dm.ListSong.IsEmpty then dm.ListSong.Next;
  FocusControl(grid);
end;

procedure TForm1.list_pgdownClick(Sender: TObject);
begin
  PanelSongList.Enabled:=not PanelSongList.Enabled;
  if PanelSongList.Enabled then
  begin
    panel_preview.SendToBack;
    xVideo_StreamFree(chan1);
  end else PanelSongList.Enabled:=True;

  if not dm.ListSong.IsEmpty then
  begin
    FocusControl(grid);
    keybd_event(VK_NEXT, 0,0,0);
    keybd_event(VK_NEXT, 0,KEYEVENTF_KEYUP,0);
  end;
end;

procedure TForm1.list_pgupClick(Sender: TObject);
begin
  PanelSongList.Enabled:=not PanelSongList.Enabled;
  if PanelSongList.Enabled then
  begin
    panel_preview.SendToBack;
    xVideo_StreamFree(chan1);
  end else PanelSongList.Enabled:=True;

  if not dm.ListSong.IsEmpty then
  begin
    FocusControl(grid);
    keybd_event(VK_PRIOR, 0,0,0);
    keybd_event(VK_PRIOR, 0,KEYEVENTF_KEYUP,0);
  end;
end;

procedure TForm1.list_up1Click(Sender: TObject);
begin
  PanelSongList.Enabled:=not PanelSongList.Enabled;
  if PanelSongList.Enabled then
  begin
    panel_preview.SendToBack;
    xVideo_StreamFree(chan1);
  end else PanelSongList.Enabled:=True;

  if not dm.ListSong.IsEmpty then dm.ListSong.Prior;
  FocusControl(grid);
end;

procedure TForm1.mandarinClick(Sender: TObject);
begin
  viewSongs('Mandarin');
  Edit1.Text := 'Mandarin';
  setSwActive('btn_mandarin');
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
  viewSongs('Anak');
  Edit1.Text := 'Anak';
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
 viewSongs('Rohani');
 Edit1.Text := 'Rohani';
end;

procedure TForm1.MonitorActExecute(Sender: TObject);
begin
  monitorClick(Sender);
end;

procedure TForm1.next1Click(Sender: TObject);
begin
if cekRoom then
begin
  Edit5.Text:='0';
  PanelSongList.Enabled:=not PanelSongList.Enabled;
  if PanelSongList.Enabled then
  begin
    panel_preview.SendToBack;
    xVideo_StreamFree(chan1);
  end else PanelSongList.Enabled:=True;
end;
end;

procedure TForm1.othersClick(Sender: TObject);
begin
  DM.IDTmp := '1';
  FrmPupop.ShowModal;
  viewSongs(FrmPupop.Executed);
//  FrmPupop.Left := Form1.Width - 350;
  Edit1.Text := FrmPupop.Executed;
  setSwActive('btn_other');
end;

procedure TForm1.PanelFullScreenClick(Sender: TObject);
begin
  PanelFullScreen.Visible:=not PanelFullScreen.Visible;
  PanelSongList.BringToFront;
  vkeys.BringToFront;
  if canRec then
      begin
        VideoGrabber1.BringToFront;
        PanelSongList.SendToBack;
        vkeys.SendToBack;
      end;
  grid.SetFocus;
end;

procedure TForm1.pauseSong;
begin
  if Edit3.Text='False' then
  begin
     Edit3.Text:='True';
     if paused=true then
     begin
       paused:=false;
       if not dm.now_playing.IsEmpty then
       begin
         gridb.OnDblClick(self);
       end else
       begin
         form1.FormStyle:=fsNormal;
           spSkinMessage1.MessageDlg('Silahkan pilih lagu yang akan diputar!.', mtInformation,
           [mbOk], 0);
           finish := true;
           if finish then Form3.layar.SendToBack;
//         form1.FormStyle:=fsStayOnTop;
         dsf.SwitchSetState('btn_play', swsOff);
         Edit3.Text:='False';
         paused:=true;
       end;
     end;
  end else
  begin
    Edit3.Text:='False';
  end;
  PanelSongList.Enabled:=not PanelSongList.Enabled;
  if PanelSongList.Enabled then
  begin
    panel_preview.SendToBack;
    xVideo_StreamFree(chan1);
  end else PanelSongList.Enabled:=True;
end;

procedure TForm1.pitchChange(Sender: TObject);
begin
  Timer1.Enabled:=False;
  dm.qexec.SQL.Clear;
  dm.qexec.SQL.Add('update room set pitch='''+IntToStr(pitch.Value)+''' where id_room='''+room.Text+'''');
  dm.qexec.Execute;
  xVideo_ChannelSetAttribute(chan,xVideo_ATTRIB_PITCH,pitch.Value);
  if pitch.Value>0 then
  Panel5.Caption:='+'+IntToStr(pitch.Value) else
  Panel5.Caption:=IntToStr(pitch.Value);
  if dm.ac.Connected then
  Timer1.Enabled:=True;
end;

procedure TForm1.Pitch_DownClick(Sender: TObject);
begin
  PanelSongList.Enabled:=not PanelSongList.Enabled;
  if PanelSongList.Enabled then
  begin
    panel_preview.SendToBack;
    xVideo_StreamFree(chan1);
  end else PanelSongList.Enabled:=True;

  pitch.Value:=pitch.Value-1;
end;

procedure TForm1.Pitch_UpClick(Sender: TObject);
begin
  PanelSongList.Enabled:=not PanelSongList.Enabled;
  if PanelSongList.Enabled then
  begin
    panel_preview.SendToBack;
    xVideo_StreamFree(chan1);
  end else PanelSongList.Enabled:=True;

  pitch.Value:=pitch.Value+1;
end;

procedure TForm1.Play1Click(Sender: TObject);
begin
  if Play1.Tag = 0 then
  begin
    Play1.Tag := 1;
    dsf.SwitchSetState('btn_play', swsOn);
    playSong;
  end
  else
  begin
    pauseSong;
  end;
end;

procedure TForm1.playing_delClick(Sender: TObject);
begin
  PanelSongList.Enabled:=not PanelSongList.Enabled;
  if PanelSongList.Enabled then
  begin
    panel_preview.SendToBack;
    xVideo_StreamFree(chan1);
  end else PanelSongList.Enabled:=True;

  if not dm.now_playing.IsEmpty then
  begin
    dm.now_playing.Delete;
    songQueue;
  end;
end;

procedure TForm1.playing_downClick(Sender: TObject);
var idlama, idbaru,maxrec : integer;
begin
  PanelSongList.Enabled:=not PanelSongList.Enabled;
  if PanelSongList.Enabled then
  begin
    panel_preview.SendToBack;
    xVideo_StreamFree(chan1);
  end else PanelSongList.Enabled:=True;

  dm.qexec.SQL.Clear;
  dm.qexec.SQL.Add('select max(IDNP) as maxrec from now_playing');
  dm.qexec.Open;
  maxrec:=dm.qexec.FieldByName('maxrec').AsInteger;

  if not dm.now_playing.IsEmpty then
  begin
    idlama:=dm.now_playingIDNP.Value;
    if dm.now_playing.RecNo<dm.now_playing.RecordCount then
    begin
      dm.now_playing.Next;
      idbaru:=dm.now_playingIDNP.Value;

      dm.qexec1.SQL.Clear;
      dm.qexec1.SQL.Add('update now_playing set IDNP='+IntToStr(maxrec+1000)+
      ' where IDNP='+IntToStr(idbaru)+' and room='''+Room.Text+'''');
      dm.qexec1.Execute;

      dm.qexec1.SQL.Clear;
      dm.qexec1.SQL.Add('update now_playing set IDNP='+
      IntToStr(idbaru)+' where IDNP='+IntToStr(idlama)+' and room='''+Room.Text+'''');
      dm.qexec1.Execute;

      dm.qexec1.SQL.Clear;
      dm.qexec1.SQL.Add('update now_playing set IDNP='+
      IntToStr(idlama)+' where IDNP='+IntToStr(maxrec+1000)+' and room='''+Room.Text+'''');
      dm.qexec1.Execute;

      dm.now_playing.close;
      dm.now_playing.Open;
      dm.now_playing.Locate('IDNP', idbaru, []);
      songQueue;
    end;
  end;
end;

procedure TForm1.playing_openClick(Sender: TObject);
begin
  PanelSongList.Enabled:=not PanelSongList.Enabled;
  if PanelSongList.Enabled then
  begin
    panel_preview.SendToBack;
    xVideo_StreamFree(chan1);
  end else PanelSongList.Enabled:=True;

  dm.qexec.Close;
  dm.qexec.sql.Clear;
  dm.qexec.sql.Add('select * from song_list1');
  dm.qexec.Open;
  if dm.qexec.IsEmpty then
  begin
    form1.FormStyle:=fsNormal;
    spSkinMessage1.MessageDlg('Maaf, Song List Masih Kosong!.', mtInformation,
      [mbOk], 0);
//    form1.FormStyle:=fsStayOnTop;
  end else
  begin
    Form1.FormStyle:=fsNormal;
    f_open_song.ShowModal;
//    Form1.FormStyle:=fsStayOnTop;
  end;
end;

procedure TForm1.playing_saveClick(Sender: TObject);
begin
  PanelSongList.Enabled:=not PanelSongList.Enabled;
  if PanelSongList.Enabled then
  begin
    panel_preview.SendToBack;
    xVideo_StreamFree(chan1);
  end else PanelSongList.Enabled:=True;

  if dm.now_playing.IsEmpty then
  begin
//    form1.FormStyle:=fsNormal;
    spSkinMessage1.MessageDlg('Maaf, Song List Masih Kosong!.', mtInformation,
      [mbOk], 0);
//    form1.FormStyle:=fsStayOnTop;
  end else
  begin
//    Form1.FormStyle:=fsNormal;
    f_save_song.ShowModal;
//    Form1.FormStyle:=fsStayOnTop;
  end;
end;

procedure TForm1.playing_upClick(Sender: TObject);
var idlama, idbaru,maxrec : integer;
begin
  PanelSongList.Enabled:=not PanelSongList.Enabled;
  if PanelSongList.Enabled then
  begin
    panel_preview.SendToBack;
    xVideo_StreamFree(chan1);
  end else PanelSongList.Enabled:=True;

  dm.qexec.SQL.Clear;
  dm.qexec.SQL.Add('select max(IDNP) as maxrec from now_playing');
  dm.qexec.Open;
  maxrec:=dm.qexec.FieldByName('maxrec').AsInteger;

  if not dm.now_playing.IsEmpty then
  begin
    idlama:=dm.now_playingIDNP.Value;
    if dm.now_playing.RecNo>1 then
    begin
      dm.now_playing.Prior;
      idbaru:=dm.now_playingIDNP.Value;

      dm.qexec1.SQL.Clear;
      dm.qexec1.SQL.Add('update now_playing set IDNP='+IntToStr(maxrec+1000)+
      ' where IDNP='+IntToStr(idbaru)+' and room='''+Room.Text+'''');
      dm.qexec1.Execute;

      dm.qexec1.SQL.Clear;
      dm.qexec1.SQL.Add('update now_playing set IDNP='+
      IntToStr(idbaru)+' where IDNP='+IntToStr(idlama)+' and room='''+Room.Text+'''');
      dm.qexec1.Execute;

      dm.qexec1.SQL.Clear;
      dm.qexec1.SQL.Add('update now_playing set IDNP='+
      IntToStr(idlama)+' where IDNP='+IntToStr(maxrec+1000)+' and room='''+Room.Text+'''');
      dm.qexec1.Execute;

      dm.now_playing.close;
      dm.now_playing.Open;
      dm.now_playing.Locate('IDNP', idbaru, []);
      songQueue;
    end;
  end;
end;

procedure TForm1.playRemoteSong(AIDNP: integer; AJudul,AArtis,AFile,AVol: String);
var namafile: string;
begin
if cekRoom then
begin
  if chan<>0 then
  begin
   xVideo_StreamFree(chan);
   chan:=0;
  end;
//  namafile:=dm.getStringFromSQL(DM.qexec1,'select concat(''\\\\'',IpVideo,VideoDir) from setting where active=1');
//  namafile:=namafile+AFile;
//  namafile:=dm.getStringFromSQL(DM.qexec,'select concat(IpVideo,VideoDir) from setting where active=1');
  namafile:=dm.now_playingdirektori.AsString + dm.now_playingnama_file.AsString;
  marquee.Caption:=AJudul+' by '+AArtis+' ';
  marquee.Hint:=marquee.Caption;
  edit6.Text:=AVol;
  dm.execSQL(DM.qexec1,'update song_list set hit = hit + 1 where  judul='+QuotedStr(dm.now_playingJudul.AsString));
  Chan :=xVideo_StreamCreateFile(PChar(namafile),0, {$IFDEF UNICODE}xVideo_UNICODE or xVideo_STREAM_AUTOFREE {$Else}xVideo_STREAM_AUTOFREE {$ENDIF});
  if not FileExists(namafile) then
  begin
    form1.FormStyle:=fsNormal;
//    spSkinMessage1.MessageDlg('Maaf, File '+namafile+' tidak ditemukan!.', mtInformation, [mbOk], 0);
    spSkinMessage1.MessageDlg('Maaf, File tidak ditemukan!.', mtInformation, [mbOk], 0);
    dm.execSQL(DM.qexec,'delete from now_playing where IDNP='+IntToStr(AIDNP));
    dsf.SwitchSetState('btn_play', swsOff);
    Edit3.Text:='False';
    paused:=true;
//    form1.FormStyle:=fsStayOnTop;
    if dm.now_playing.RecordCount<>0 then next1.OnClick(self);
  end;
  if chan<>0 then
  begin
    paused:=false;
    pitch.Value:=0;
    autoCek := true;
    if GetSystemMetrics (SM_CMONITORS)>1 then with form3 do  // secondary monitor here
    begin
      left:=Screen.Monitors[1].Left;
      Top:=Screen.Monitors[1].Top;
      BringToFront;
      Show;
      xVideo_ChannelAddWindow(chan,layar.Handle);
      xVideo_ChannelSetWindow(chan,layar.Handle);
      xVideo_ChannelPlay(chan);
      dsf.SwitchSetState('btn_stop', swsOn);
      Edit2.Clear;
      Edit2.Text:='True';
      dsf.SwitchSetState('btn_vocal', swsOff);
      Edit3.Text:='False';
      dm.execSQL(DM.qexec,'delete from now_playing where IDNP='+IntToStr(AIDNP));
      songQueue; // antrian song list di TV
      sb.MaxValue:=round(xVideo_ChannelGetLength(chan,xVideo_POS_SEC));
      edit7.Text:=IntToStr(sb.MaxValue-2);
      maxval:=round(xVideo_ChannelGetLength(chan,xVideo_POS_SEC));
      Form1.BringToFront;
    end else
    begin
      xVideo_ChannelSetWindow(chan,PanelFullScreen.Handle);
      xVideo_ChannelPlay(chan);
      dsf.SwitchSetState('btn_stop', swsOn);
      Edit2.Clear;
      Edit2.Text:='True';
      dsf.SwitchSetState('btn_vocal', swsOff);
      Edit3.Text:='False';
      dm.execSQL(DM.qexec,'delete from now_playing where IDNP='+IntToStr(AIDNP));
      sb.MaxValue:=round(xVideo_ChannelGetLength(chan,xVideo_POS_SEC));
      edit7.Text:=IntToStr(sb.MaxValue-2);
    end;
  end;
end;
end;

procedure TForm1.playSong;
var namafile : string;
begin
if cekRoom then
begin
 if dm.now_playing.IsEmpty then
  begin
    form1.FormStyle:=fsNormal;
    DM.alert('Silahkan pilih lagu yang akan diputar!.',dm.spSkinMessage1);
    finish := true;
    if finish then Form3.layar.SendToBack;
    dsf.SwitchSetState('btn_play', swsOff);
    Edit2.Clear;
    Edit2.Text:='False';
    paused:=false;
//    form1.FormStyle:=fsStayOnTop;
    Play1.Tag := 0;
    exit;
  end;
  if chan<>0 then
  begin
   xVideo_StreamFree(chan);
   chan:=0;
  end;
//  namafile:=dm.getStringFromSQL(DM.qexec,'select concat(''\\\\'',IpVideo,VideoDir) from setting where active=1');
//  namafile:=dm.getStringFromSQL(DM.qexec,'select concat(IpVideo,VideoDir) from setting where active=1');
  namafile:=dm.now_playingdirektori.AsString+dm.now_playingnama_file.AsString;
  marquee.Caption:=dm.now_playingJudul.AsString+' by '+dm.now_playingArtis.AsString+' ';
  marquee.Hint:=marquee.Caption;
  edit6.Text:=dm.now_playingVolume.Value;
  dm.qexec1.Close;
  dm.qexec1.SQL.Clear;
  dm.qexec1.SQL.Text := 'update song_list set hit = hit + 1 where  judul='+QuotedStr(dm.now_playingJudul.AsString);
  dm.qexec1.Execute;
  Chan :=xVideo_StreamCreateFile(PChar(namafile),0, {$IFDEF UNICODE}xVideo_UNICODE or xVideo_STREAM_AUTOFREE {$Else}xVideo_STREAM_AUTOFREE {$ENDIF});
  if not FileExists(namafile) then
  begin
    form1.FormStyle:=fsNormal;
//    spSkinMessage1.MessageDlg('Maaf, File '+namafile+' tidak ditemukan!.', mtInformation, [mbOk], 0);
    spSkinMessage1.MessageDlg('Maaf, File '+namafile+' tidak ditemukan!.', mtInformation, [mbOk], 0);
    dm.now_playing.Delete;
    dsf.SwitchSetState('btn_play', swsOff);
    Edit3.Text:='False';
    paused:=true;
//    form1.FormStyle:=fsStayOnTop;
    if dm.now_playing.RecordCount<>0 then next1.OnClick(self);
  end;
  if chan<>0 then
  begin
    paused:=false;
    pitch.Value:=0;
    autoCek := true;
    if BeginRec then prosesRecord;
    if GetSystemMetrics (SM_CMONITORS)>1 then with form3 do  // secondary monitor here
    begin
      left:=Screen.Monitors[1].Left;
      Top:=Screen.Monitors[1].Top;
      BringToFront;
      Show;
      xVideo_ChannelAddWindow(chan,layar.Handle);
      xVideo_ChannelSetWindow(chan,layar.Handle);
      xVideo_ChannelPlay(chan);
      dsf.SwitchSetState('btn_stop', swsOn);
      Edit2.Clear;
      Edit2.Text:='True';
      dsf.SwitchSetState('btn_vocal', swsOff);
      Edit3.Text:='False';
      dsf.SwitchSetState('btn_vocal', swsOff);
      dm.now_playing.Delete;
      songQueue; // antrian song list di TV
      sb.MaxValue:=round(xVideo_ChannelGetLength(chan,xVideo_POS_SEC));
      edit7.Text:=IntToStr(sb.MaxValue-2);
      maxval:=round(xVideo_ChannelGetLength(chan,xVideo_POS_SEC));
      Form1.BringToFront;
    end else
    begin
      xVideo_ChannelSetWindow(chan,PanelFullScreen.Handle);
      xVideo_ChannelPlay(chan);
      dsf.SwitchSetState('btn_stop', swsOn);
      Edit2.Clear;
      Edit2.Text:='True';
      dsf.SwitchSetState('btn_vocal', swsOff);
      Edit3.Text:='False';
      dm.now_playing.Delete;
      sb.MaxValue:=round(xVideo_ChannelGetLength(chan,xVideo_POS_SEC));
      edit7.Text:=IntToStr(sb.MaxValue-2);
    end;
  end;
end;
end;

procedure TForm1.prClick(Sender: TObject);
begin
  PanelSongList.Enabled:=not PanelSongList.Enabled;
  if PanelSongList.Enabled then
  begin
    panel_preview.SendToBack;
    xVideo_StreamFree(chan1);
  end else PanelSongList.Enabled:=True;

  pitch.Value:=0;
end;

procedure TForm1.preview1Click(Sender: TObject);
var namafile : string;
begin
if cekRoom then
begin
//  namafile:=dm.getStringFromSQL(DM.qexec,'select concat(''\\\\'',IpVideo,VideoDir) from setting where active=1');
//  namafile:=namafile + dm.song_listNamaFile.AsString;
//  ShowMessage(namafile);
//  namafile:=dm.getStringFromSQL(DM.qexec,'select concat(IpVideo,VideoDir) from setting where active=1');
  namafile:=dm.ListSong.FieldByName('direktori').AsString + dm.ListSong.FieldByName('NamaFile').AsString;
  if not FileExists(namafile) then
  begin
    form1.FormStyle:=fsNormal;
    spSkinMessage1.MessageDlg('Maaf, File tidak ditemukan!.', mtInformation,
      [mbOk], 0);
    Exit;
//    form1.FormStyle:=fsStayOnTop;
  end;
  PanelSongList.Enabled:=not PanelSongList.Enabled;

  if PanelSongList.Enabled then
  begin
    panel_preview.SendToBack;
    xVideo_StreamFree(chan1);
  end else
  begin
    panel_preview.BringToFront;
    if chan1<>0 then
    begin
      xVideo_StreamFree(chan1);
      chan1:=0;
    end;
    Chan1 :=xVideo_StreamCreateFile(PChar(namafile),0, {$IFDEF UNICODE}xVideo_UNICODE or xVideo_STREAM_AUTOFREE {$Else}xVideo_STREAM_AUTOFREE {$ENDIF});
    xVideo_ChannelRemoveWindow(chan,panel_preview.Handle);
    xVideo_ChannelAddWindow(chan1,panel_preview.Handle);

    xVideo_ChannelSetWindow(chan1,panel_preview.Handle);
    xVideo_ChannelSetAttribute(chan1,xVideo_ATTRIB_VOL,0);
    xVideo_ChannelPlay(chan1);
  end;
end;
end;

function TForm1.prosesRecord: boolean;
begin
Result := true;
try
  if not canRec then
  begin
   canRec := true;
   PanelSongList.SendToBack;
   vkeys.SendToBack;
   VideoGrabber1.Visible := canRec;
   VideoGrabber1.BringToFront;
   VideoGrabber1.HoldRecording := False; // let's start recording as soon as the graph is built.
   VideoGrabber1.AudioRecording := true;
   VideoGrabber1.RecordingFileName := 'C:\'+DM.RoomID+' '+FormatDateTime('yyyy-mm-dd hh:mm:ss',dm.serverNow)+'.mpg';
   VideoGrabber1.StartRecording;
  end
  else
  begin
    canRec := false;
    BeginRec := canRec;
    VideoGrabber1.StopRecording;
    VideoGrabber1.Visible := canRec;
    VideoGrabber1.SendToBack;
    PanelSongList.BringToFront;
    vkeys.BringToFront;
  end;
except
  Result := false;
end;
end;

procedure TForm1.record1Click(Sender: TObject);
begin
//if cekRoom then
//  if not prosesRecord
//    then dm.alert('TIDAK DAPAT MEREKAM VIDEO', dm.spSkinMessage1);
  BeginRec := true;
end;


procedure TForm1.refreshChange(Sender: TObject);
begin
  dm.now_playing.Close;
  dm.now_playing.Open;
end;

procedure TForm1.repeat1Click(Sender: TObject);
begin
if cekRoom then
begin
  xVideo_ChannelSetPosition(chan,1,xVideo_POS_SEC);
  PanelSongList.Enabled:=not PanelSongList.Enabled;
  if PanelSongList.Enabled then
  begin
    panel_preview.SendToBack;
    xVideo_StreamFree(chan1);
  end else PanelSongList.Enabled:=True;
end;
end;

procedure TForm1.request1Click(Sender: TObject);
begin
if cekRoom then
begin
  PanelSongList.Enabled:=not PanelSongList.Enabled;
  if PanelSongList.Enabled then
  begin
    panel_preview.SendToBack;
    xVideo_StreamFree(chan1);
  end else PanelSongList.Enabled:=True;
  form1.FormStyle:=fsNormal;
  f_request.ShowModal;
//  form1.FormStyle:=fsStayOnTop;
end;
end;

procedure TForm1.vol_upClick(Sender: TObject);
begin
  PanelSongList.Enabled:=not PanelSongList.Enabled;
  if PanelSongList.Enabled then
  begin
    panel_preview.SendToBack;
    xVideo_StreamFree(chan1);
  end else PanelSongList.Enabled:=True;

  vol.Value:=vol.Value+10;
end;

procedure TForm1.VRClick(Sender: TObject);
begin
  PanelSongList.Enabled:=not PanelSongList.Enabled;
  if PanelSongList.Enabled then
  begin
    panel_preview.SendToBack;
    xVideo_StreamFree(chan1);
  end else PanelSongList.Enabled:=True;

  vol.Value:=0;
end;

procedure TForm1.saran1Click(Sender: TObject);
begin
if cekRoom then
begin
  PanelSongList.Enabled:=not PanelSongList.Enabled;
  if PanelSongList.Enabled then
  begin
    panel_preview.SendToBack;
    xVideo_StreamFree(chan1);
  end else PanelSongList.Enabled:=True;
  form1.FormStyle:=fsNormal;
  f_saran.ShowModal;
//  form1.FormStyle:=fsStayOnTop;
end;
end;

procedure TForm1.sbChange(Sender: TObject);
begin
  if sb.Value>1 then
  Edit5.Text:=IntToStr(sb.Value);
end;

procedure TForm1.sbChanged(Sender: TObject);
begin
  xVideo_ChannelSetPosition(chan,sb.Value,xVideo_POS_SEC);
  if sb.Value=maxval then
  Edit5.Text:='0';
end;


procedure TForm1.SemuaClick(Sender: TObject);
begin
  dsf.SwitchSetState('sw_depan', swsOff);
  dsf.SwitchSetState('sw_semua', swsOn);
  ACari;
end;

procedure TForm1.setSwActive(ASW: String);
begin
  dsf.SwitchSetState('btn_all', swsoff);
  dsf.SwitchSetState('btn_indo', swsoff);
  dsf.SwitchSetState('btn_dangdut', swsoff);
  dsf.SwitchSetState('btn_daerah', swsoff);
  dsf.SwitchSetState('btn_barat', swsoff);
  dsf.SwitchSetState('btn_mandarin', swsoff);
  dsf.SwitchSetState('btn_kanji', swsoff);
  dsf.SwitchSetState('btn_baru', swsoff);
  dsf.SwitchSetState('btn_top100', swsoff);
  dsf.SwitchSetState('btn_other', swsoff);
  dsf.SwitchSetState('btn_house', swsoff);
  dsf.SwitchSetState(ASW, swson);
end;


procedure TForm1.songQueue;
var i: byte; AStr: String;
begin
DM.openSQL(DM.qexec,'select judul from now_playing where room='+QuotedStr(DM.RoomID));
dm.qexec.First;
i := 1;
AStr := '';
with Form3 do
begin
  while (not dm.qexec.Eof) and (i < 4) do
  begin
    AStr := AStr + IntToStr(i)+'.'+ dm.qexec.Fields[0].AsString+'  ';
    dm.qexec.Next;
    Inc(i);
  end;
  marqueeList.Caption := AStr;
end;
end;

procedure TForm1.spSkinButton10Click(Sender: TObject);
begin
  viewSongs('Kanji');
end;

procedure TForm1.spSkinButton12Click(Sender: TObject);
begin
  viewSongs('Barat');
end;

procedure TForm1.spSkinButton13Click(Sender: TObject);
begin
  viewSongs('Indonesia');
end;

procedure TForm1.spSkinButton14Click(Sender: TObject);
begin
  viewSongs('Mandarin');
end;

procedure TForm1.spSkinButton15Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit1.Text:='MP3';
end;

procedure TForm1.spSkinButton1Click(Sender: TObject);
begin
  viewSongs('Baru');
end;

procedure TForm1.spSkinButton2Click(Sender: TObject);
begin
  viewSongs('Other');
end;

procedure TForm1.spSkinButton3Click(Sender: TObject);
begin
  viewSongs('Dangdut');
end;

procedure TForm1.spSkinButton4Click(Sender: TObject);
begin
  viewSongs('House');
end;

procedure TForm1.spSkinButton5Click(Sender: TObject);
begin
  viewSongs('100');
end;

procedure TForm1.spSkinButton7Click(Sender: TObject);
begin
  viewSongs('');
end;

procedure TForm1.spSkinButton8Click(Sender: TObject);
begin
  viewSongs('Daerah');
end;

procedure TForm1.spSkinSpeedButton1Click(Sender: TObject);
begin
  viewSongs('100');
end;

procedure TForm1.spSkinSpeedButton2Click(Sender: TObject);
begin
  viewSongs('Mandarin');
  Edit1.Text := 'Mandarin';
end;

procedure TForm1.spSkinSpeedButton3Click(Sender: TObject);
begin
  viewSongs('Barat');
  Edit1.Text := 'Barat';
end;

procedure TForm1.spSkinSpeedButton4Click(Sender: TObject);
begin
  viewSongs('Indonesia');
  Edit1.Text := 'Indonesia';
end;

procedure TForm1.spSkinSpeedButton5Click(Sender: TObject);
begin
  viewSongs('');
  Edit1.Text := '';
end;

procedure TForm1.spSkinSpeedButton6Click(Sender: TObject);
begin
  viewSongs('Daerah');
  Edit1.Text := 'Daerah';
end;

procedure TForm1.spSkinSpeedButton7Click(Sender: TObject);
begin
  viewSongs('Dangdut');
  Edit1.Text := 'Dangdut';
end;

procedure TForm1.spSkinSpeedButton8Click(Sender: TObject);
begin
  viewSongs('Kanji1');
  Edit1.Text := 'Kanji1';
end;

procedure TForm1.spSkinSpeedButton9Click(Sender: TObject);
begin
  viewSongs('Baru');
end;

procedure TForm1.Stop1Click(Sender: TObject);
begin
  xVideo_ChannelStop(chan);
  Play1.Tag := 0;
  sb.Value := 0;
  dsf.SwitchSetState('btn_play', swsOff);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var AppName : PChar;
    ASisa: integer;
begin
  Timer2.Enabled := DM.Pesan;
  ASisa := dm.getIntegerFromSQL(dm.qexec2,'select CEILING((UNIX_TIMESTAMP(selesai) - UNIX_TIMESTAMP(now()))/60) AS sisa from room where id_room='+QuotedStr(DM.RoomID));
//  if autoCek then
//    Marquee.BlinkColor := clWhite else
//    Marquee.BlinkColor := clRed;

  if (ASisa <=15) and (ASisa >= 0)
  then begin
    autoCek := false;
    Form3.marqueeList.Caption := 'Info : '+IntToStr(ASisa)+' menit lagi waktu anda habis';
    Form3.marqueeList.Color := clYellow;
  end;
  if (ASisa <= 0) then
  begin
    autoCek := false;
//    Form3.marqueeList.Caption := 'Info : waktu anda habis';
//    Form3.marqueeList.Font.Color := clRed;
  end;

  try
  dm.ac.Connected := True ;

  dm.qexec2.SQL.Clear;
  dm.qexec2.SQL.Add('select * from room where id_room='''+Room.Text+'''');
  dm.qexec2.Open;
  if dm.qexec2.FieldByName('status').AsString='S' then
  begin
    AppName := PChar(Application.ExeName) ;
    ShellExecute(Handle,'open', AppName, nil, nil, SW_SHOWNORMAL) ;
    Application.Terminate;
  end;

  dm.openSQL(dm.qexec,'select count(judul) as judul from now_playing where room='''+Room.Text+'''');
  refresh.Text:=dm.qexec.FieldByName('judul').AsString;

  // Remote methode start here 
  dm.openSQL(dm.qexec,'select * from now_playing where state in (1,2,5,9) and room='''+Room.Text+''' ');
  if dm.qexec.RecordCount>0 then
  begin
    if dm.qexec.FieldByName('state').AsInteger = 9 then // pause
    begin
        dm.now_playing.Refresh;
        dm.now_playing.Locate('IDNP', dm.qexec.FieldByName('IDNP').AsInteger, []);
        dm.execSQL(dm.qexec1,'update now_playing set state=0 where room='''+Room.Text+'''');
        Stop1Click(Sender);
    end
    else
    if dm.qexec.FieldByName('state').AsInteger = 5 then // pause
    begin
        dm.now_playing.Refresh;
        dm.now_playing.Locate('IDNP', dm.qexec.FieldByName('IDNP').AsInteger, []);
        dm.execSQL(dm.qexec1,'update now_playing set state=0 where room='''+Room.Text+'''');
        pauseSong;
    end
    else
    if dm.qexec.FieldByName('state').AsInteger = 2 then // moving up and down
    begin
        dm.now_playing.Refresh;
        dm.now_playing.Locate('IDNP', dm.qexec.FieldByName('IDNP').AsInteger, []);
        dm.execSQL(dm.qexec1,'update now_playing set state=0 where room='''+Room.Text+'''');
    end
    else
    begin
      Stop1Click(Sender);
      dm.execSQL(dm.qexec1,'update now_playing set state=0 where room='''+Room.Text+'''');
      playRemoteSong(dm.qexec.FieldByName('IDNP').AsInteger,dm.qexec.FieldByName('judul').AsString,
      dm.qexec.FieldByName('artis').AsString, dm.qexec.FieldByName('nama_file').AsString, dm.qexec.FieldByName('volume').AsString);
    end;
  end;


  dm.qexec2.SQL.Clear;
  dm.qexec2.SQL.Add('select * from room where id_room=''SERVER''');
  dm.qexec2.Open;

  if dm.qexec2.FieldByName('status').AsString='A' then
  begin
    sb.Value:=round(xVideo_ChannelGetPosition(chan,xVideo_POS_SEC));
    dm.qexec1.SQL.Clear;
    dm.qexec1.SQL.Add('select * from room where id_room='''+room.Text+'''');
    dm.qexec1.Open;
    xVideo_ChannelSetAttribute(chan,xVideo_ATTRIB_VOL, dm.qexec1.FieldByName('vol').AsInteger);
    xVideo_ChannelSetAttribute(chan,xVideo_ATTRIB_PITCH,dm.qexec1.FieldByName('pitch').AsInteger);
    vol.Value:=dm.qexec1.FieldByName('vol').AsInteger;
    pitch.Value:=dm.qexec1.FieldByName('pitch').AsInteger;
    dm.qexec2.SQL.Clear;
    dm.qexec2.SQL.Add('select * from room where id_room='''+room.Text+'''');
    dm.qexec2.Open;
    if dm.qexec2.FieldByName('status').AsString='C' then
    begin
      if sb.Value >= Round(sb.MaxValue / 2) then
      begin
          xVideo_ChannelStop(chan);
          xVideo_StreamFree(chan);
      end;
    end;

    if dm.qexec2.FieldByName('killer').AsString='Shutdown' then
    begin
      TimedShutDown(''''+Room.Text+'''','Maaf, Komputer akan dimatikan dalam 10 detik!',10,True, False);
      Application.Terminate;
    end;
    if dm.qexec2.FieldByName('killer').AsString='Restart' then
    begin
      TimedShutDown(''''+Room.Text+'''','Maaf, Komputer akan direstart dalam 10 detik!',10,True, True);
      Application.Terminate;
    end;
  end;
  except
    dm.ac.Connected := False;
    dm.ac.Connect;
//    spSkinMessage1.MessageDlg('Hilang koneksi dengan SERVER, aplikasi akan dimatikan!.', mtInformation,
//      [mbOk], 0);
//    Application.Terminate;
  end;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
    if DM.Pesan = true then begin
      dm.openSQL(dm.qexec,'select DISTINCT (is_read) from pesan where is_read = 0 AND id_room='+
      QuotedStr(DM.RoomID)+' AND pesan_siapa =''operator'' ');
      if (dm.qexec.RecordCount > 0) and (dm.qexec.Fields[0].AsInteger = 0) then begin
          DM.Pesan := false;
          f_pesan.ShowModal;
      end;
    end;
end;

procedure TForm1.TitleClick(Sender: TObject);
begin
  dsf.SwitchSetState('sw_artis', swsOff);
  ACari;
end;

procedure TForm1.Top100Click(Sender: TObject);
begin
  viewSongs('100');
  setSwActive('btn_top100');
end;

procedure TForm1.viewSongs(AParam: String);
begin
  dm.ListSong.Close;
  dm.ListSong.SQL.Clear;
  if trim(AParam)='' then
  dm.ListSong.SQL.Add('select * from song_list')
  else
  if AParam = '100' then
  dm.ListSong.SQL.Add('select * from song_list order by hit desc LIMIT 0,100')
  else
  if AParam = 'Baru' then
  dm.ListSong.SQL.Add('select * from song_list order by inserted desc')
  else
//  if AParam = 'Kanji' then
//  dm.ListSong.SQL.Add('select * from song_list_unicode where namaFile<>'''' order by inserted desc')
//  else
  dm.ListSong.SQL.Add('select * from song_list where bahasa='''+AParam+'''');
  dm.ListSong.Open;
  PanelSongList.Enabled:=not PanelSongList.Enabled;
  if PanelSongList.Enabled then
  begin
    panel_preview.SendToBack;
    xVideo_StreamFree(chan1);
  end else PanelSongList.Enabled:=True;
end;

procedure TForm1.vocal1Click(Sender: TObject);
begin
  if Edit2.Text='False' then
  begin
     Edit2.Text:='True';
     dsf.SwitchSetState('btn_vocal', swsOff);
  end else
  begin
    Edit2.Text:='False';
    dsf.SwitchSetState('btn_vocal', swsOn);
  end;
end;

procedure TForm1.volChange(Sender: TObject);
begin
  Timer1.Enabled:=False;
  dm.qexec.SQL.Clear;
  dm.qexec.SQL.Add('update room set vol='''+IntToStr(vol.Value)+''' where id_room='''+room.Text+'''');
  dm.qexec.Execute;
  xVideo_ChannelSetAttribute(chan,xVideo_ATTRIB_VOL,vol.Value);
  Panel3.Caption:=IntToStr(vol.Value);
  if dm.ac.Connected then
  Timer1.Enabled:=True;
end;

procedure TForm1.vol_downClick(Sender: TObject);
begin
  PanelSongList.Enabled:=not PanelSongList.Enabled;
  if PanelSongList.Enabled then
  begin
    panel_preview.SendToBack;
    xVideo_StreamFree(chan1);
  end else PanelSongList.Enabled:=True;
  vol.Value:=vol.Value-10;
end;
end.
