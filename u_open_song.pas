unit u_open_song;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, SkinCtrls, SkinGrids, spDBGrids, DynamicSkinForm, ExtCtrls;

type
  Tf_open_song = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    spSkinDBGrid1: TspSkinDBGrid;
    spDynamicSkinForm1: TspDynamicSkinForm;
    BtnOK: TspSkinButton;
    BtnCancel: TspSkinButton;
    BtnCari: TspSkinButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure spSkinDBGrid1DblClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnCariClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_open_song: Tf_open_song;

implementation

uses u_dm, u_main;

{$R *.dfm}

procedure Tf_open_song.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure Tf_open_song.BtnCariClick(Sender: TObject);
begin
  dm.saved.Close;
  dm.saved.sql.Clear;
  dm.saved.sql.Add('select distinct nama from song_list1 where nama='+QuotedStr(Edit1.Text)+' AND room='+QuotedStr(DM.RoomID));
  dm.saved.Open;
end;

procedure Tf_open_song.BtnOKClick(Sender: TObject);
begin
  spSkinDBGrid1.OnDblClick(self);
end;

procedure Tf_open_song.Edit1Change(Sender: TObject);
begin
//  dm.saved.Locate('nama', Edit1.Text,[]);
end;

procedure Tf_open_song.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    spSkinDBGrid1.OnDblClick(self);
  end;
end;

procedure Tf_open_song.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.saved.Close;
end;

procedure Tf_open_song.FormShow(Sender: TObject);
begin
  dm.saved.Close;
  dm.saved.sql.Clear;
  dm.saved.sql.Add('select distinct nama from song_list1 where room='+QuotedStr(DM.RoomID));
  dm.saved.Open;
  Edit1.Clear;
  Edit1.SetFocus;
end;

procedure Tf_open_song.spSkinDBGrid1DblClick(Sender: TObject);
begin
  Form1.FormStyle:=fsNormal;
  dm.now_playing.Open;

  dm.saved_list.Open;
  
  dm.qexec.SQL.Clear;
  dm.qexec.SQL.Add('delete from now_playing where room='+QuotedStr(DM.RoomID));
  dm.qexec.Execute;

  dm.qexec.SQL.Clear;
  dm.qexec.SQL.Add('select * from song_list1 where nama='+QuotedStr(dm.savednama.Value));
  dm.qexec.SQL.Add('and room='+QuotedStr(DM.RoomID));
  dm.qexec.Open;
  dm.qexec.First;
  while not dm.qexec.Eof do
  begin
    dm.now_playing.Append;
    dm.now_playingIDNP.Value:=dm.qexec.FieldByName('IDNP').Value;
    dm.now_playingroom.Value:=Form1.Room.Text;
    dm.now_playingtanggal.Value:=dm.qexec.FieldByName('tanggal').Value;
    dm.now_playingJudul.Value:=dm.qexec.FieldByName('judul').AsString;
    dm.now_playingArtis.Value:=dm.qexec.FieldByName('artis').AsString;
    dm.now_playingdirektori.Value:=dm.qexec.FieldByName('direktori').AsString;
    dm.now_playingnama_file.Value:=dm.qexec.FieldByName('nama_file').AsString;
    dm.now_playingVolume.Value:=dm.qexec.FieldByName('volume').AsString;
    dm.now_playing.Post;
    dm.qexec.Next;
  end;
  dm.now_playing.Close;
  dm.now_playing.Filter:='room='''+Form1.Room.Text+'''';
  dm.now_playing.Filtered:=True;
  dm.now_playing.Open;
  close;
//  Form1.FormStyle:=fsStayOnTop;

end;

end.
