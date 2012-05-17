unit u_save_song;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DynamicSkinForm;

type
  Tf_save_song = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    spDynamicSkinForm1: TspDynamicSkinForm;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_save_song: Tf_save_song;

implementation

uses u_dm, u_main;

{$R *.dfm}

procedure Tf_save_song.Button1Click(Sender: TObject);
begin
  if Edit1.Text<>'' then
  begin
    dm.qexec.SQL.Clear;
    dm.qexec.SQL.Add('select DISTINCT nama from song_list1 where nama='''+Edit1.Text+'''');
    dm.qexec.Open;
    if dm.qexec.FieldByName('nama').AsString=Edit1.Text then
    begin
       Application.MessageBox('Maaf, Nama File Sudah Ada!','Save Play List', 0);
       Edit1.SetFocus;
    end else
    begin
      dm.saved_list.Open;
      dm.now_playing.First;
      while not dm.now_playing.Eof do
      begin
        dm.saved_list.Append;
        dm.saved_listIDNP.Value:=dm.now_playingIDNP.Value;
        dm.saved_listroom.Value:=form1.Room.Text;
        dm.saved_listtanggal.Value:=now;
        dm.saved_listJudul.Value:=dm.now_playingjudul.Value;
        dm.saved_listArtis.Value:=dm.now_playingartis.Value;
        dm.saved_listdirektori.Value:=dm.now_playingdirektori.Value;
        dm.saved_listnama_file.Value:=dm.now_playingnama_file.Value;
        dm.saved_listVolume.Value:=dm.now_playingVolume.Value;
        dm.saved_listnama.Value:=Edit1.Text;
        dm.saved_list.Post;
        dm.saved_list.Close;
        dm.saved_list.Open;
        dm.now_playing.Next;
      end;
      close;
    end;
  end else
  Application.MessageBox('Maaf, File Tidak Boleh Kosong!','Save Play List', 0);
end;

procedure Tf_save_song.Button2Click(Sender: TObject);
begin
  close;
end;

procedure Tf_save_song.FormShow(Sender: TObject);
begin
  Edit1.Clear;
end;

end.
