unit u_effect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SkinData, DynamicSkinForm, SkinCtrls, SkinExCtrls,
  ImgList, sppngimagelist, MPlayer, u_dm, StdCtrls;

type
  Tf_effect = class(TForm)
    spSkinXFormButton1: TspSkinXFormButton;
    MediaPlayer1: TMediaPlayer;
    spDynamicSkinForm1: TspDynamicSkinForm;
    spSkinGroupBox1: TspSkinGroupBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    procedure FormDeactivate(Sender: TObject);
    procedure spSkinXFormButton1Click(Sender: TObject);
    procedure Image1MouseEnter(Sender: TObject);
    procedure Image1MouseLeave(Sender: TObject);
    procedure Image2MouseEnter(Sender: TObject);
    procedure Image2MouseLeave(Sender: TObject);
    procedure Image3MouseLeave(Sender: TObject);
    procedure Image3MouseEnter(Sender: TObject);
    procedure Image6MouseEnter(Sender: TObject);
    procedure Image6MouseLeave(Sender: TObject);
    procedure Image5MouseLeave(Sender: TObject);
    procedure Image5MouseEnter(Sender: TObject);
    procedure Image4MouseEnter(Sender: TObject);
    procedure Image4MouseLeave(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image2Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_effect: Tf_effect;
  AFile : String;
//const
////  PATH_SERVER = ExtractFilePath(Application.ExeName);

implementation

{$R *.dfm}

procedure Tf_effect.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MediaPlayer1.Close;
end;

procedure Tf_effect.FormCreate(Sender: TObject);
begin
  AFile := ExtractFilePath(Application.ExeName)+'\effect\';;
end;

procedure Tf_effect.FormDeactivate(Sender: TObject);
begin
  f_effect.Close;
end;

procedure Tf_effect.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tf_effect.FormShow(Sender: TObject);
begin
  image1.Picture.LoadFromFile(Concat(AFile,'smiley1.png'));
  image2.Picture.LoadFromFile(Concat(AFile,'smiley2.png'));
  image3.Picture.LoadFromFile(Concat(AFile,'smiley3.png'));
  image4.Picture.LoadFromFile(Concat(AFile,'smiley4.png'));
  image5.Picture.LoadFromFile(Concat(AFile,'smiley5.png'));
  image6.Picture.LoadFromFile(Concat(AFile,'smiley6.png'));
end;

procedure Tf_effect.Image1Click(Sender: TObject);
begin
//  MediaPlayer1.FileName:=Concat(AFile,'peoplelaugh.wav';
  MediaPlayer1.FileName:=Concat(AFile,'peoplelaugh.wav');
  MediaPlayer1.Open;
  MediaPlayer1.Play;
end;

procedure Tf_effect.Image1MouseEnter(Sender: TObject);
begin
//  image1.Picture.LoadFromFile(Concat(AFile,'smiley11.png');
  image1.Picture.LoadFromFile(Concat(AFile,'smiley11.png'));
end;

procedure Tf_effect.Image1MouseLeave(Sender: TObject);
begin
//  image1.Picture.LoadFromFile(Concat(AFile,'smiley1.png');
  image1.Picture.LoadFromFile(Concat(AFile,'smiley1.png'));
end;

procedure Tf_effect.Image2Click(Sender: TObject);
begin
//  MediaPlayer1.FileName:=Concat(AFile,'Tepuk Tangan.wav';
  MediaPlayer1.FileName:=Concat(AFile,'Tepuk Tangan.wav');
  MediaPlayer1.Open;
  MediaPlayer1.Play;
end;

procedure Tf_effect.Image2MouseEnter(Sender: TObject);
begin
  image2.Picture.LoadFromFile(Concat(AFile,'smiley22.png'));
end;

procedure Tf_effect.Image2MouseLeave(Sender: TObject);
begin
  image2.Picture.LoadFromFile(Concat(AFile,'smiley2.png'));
end;

procedure Tf_effect.Image3Click(Sender: TObject);
begin
  MediaPlayer1.FileName:=Concat(AFile,'scream.wav');
  MediaPlayer1.Open;
  MediaPlayer1.Play;
end;

procedure Tf_effect.Image3MouseEnter(Sender: TObject);
begin
  image3.Picture.LoadFromFile(Concat(AFile,'smiley44.png'));
end;

procedure Tf_effect.Image3MouseLeave(Sender: TObject);
begin
  image3.Picture.LoadFromFile(Concat(AFile,'smiley4.png'));
end;

procedure Tf_effect.Image4Click(Sender: TObject);
begin
  MediaPlayer1.FileName:=Concat(AFile,'Snoring.wav');
  MediaPlayer1.Open;
  MediaPlayer1.Play;
end;

procedure Tf_effect.Image4MouseEnter(Sender: TObject);
begin
  image4.Picture.LoadFromFile(Concat(AFile,'smiley33.png'));
end;

procedure Tf_effect.Image4MouseLeave(Sender: TObject);
begin
  image4.Picture.LoadFromFile(Concat(AFile,'smiley3.png'));
end;

procedure Tf_effect.Image5Click(Sender: TObject);
begin
  MediaPlayer1.FileName:=Concat(AFile,'ohhh.mp3');
  MediaPlayer1.Open;
  MediaPlayer1.Play;
end;

procedure Tf_effect.Image5MouseEnter(Sender: TObject);
begin
  image5.Picture.LoadFromFile(Concat(AFile,'smiley66.png'));
end;

procedure Tf_effect.Image5MouseLeave(Sender: TObject);
begin
  image5.Picture.LoadFromFile(Concat(AFile,'smiley6.png'));
end;

procedure Tf_effect.Image6Click(Sender: TObject);
begin
  MediaPlayer1.FileName:=Concat(AFile,'kiss_up.wav');
  MediaPlayer1.Open;
  MediaPlayer1.Play;
end;

procedure Tf_effect.Image6MouseEnter(Sender: TObject);
begin
  image6.Picture.LoadFromFile(Concat(AFile,'smiley55.png'));
end;

procedure Tf_effect.Image6MouseLeave(Sender: TObject);
begin
  image6.Picture.LoadFromFile(Concat(AFile,'smiley5.png'));
end;

procedure Tf_effect.spSkinXFormButton1Click(Sender: TObject);
begin
  Close;
end;

end.
