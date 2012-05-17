unit u_layar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SkinCtrls, StdCtrls, ExtCtrls, jpeg, RzStatus, DB;

type
  TForm3 = class(TForm)
    layar: TPanel;
    Button1: TButton;
    Image1: TImage;
    SongList: TPanel;
    marqueeList: TRzMarqueeStatus;
    procedure Button1Click(Sender: TObject);
    procedure marqueeListDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure loadLogo;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses u_dm;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  loadLogo;
end;

procedure TForm3.loadLogo;
  var BS: TStream;
  vGraphic: TGraphic;
begin
  DM.openSQL(DM.qexec,'select distinct(logo) from company where not logo is null');
  if DM.qexec.RecordCount > 0 then
  begin
    BS := DM.qexec.CreateBlobStream(DM.qexec.FieldByName('logo'), bmRead);
    try
      vGraphic := TJPEGImage.Create;
      try
        vGraphic.LoadFromStream(BS);
        Image1.Picture.Graphic := vGraphic;
      finally
        vGraphic.Free;
      end;
    finally
      BS.Free;
    end;
  end
    else Image1.Picture := nil;
end;

procedure TForm3.marqueeListDblClick(Sender: TObject);
begin
  close;
end;

end.
