unit uSplashScreen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, RzStatus, AdvCircularProgress;

type
  TFrmSpalshScreen = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    Timer1: TTimer;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    loading: TAdvCircularProgress;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    function execute: boolean;
  end;

var
  FrmSpalshScreen: TFrmSpalshScreen;
  x: integer;

implementation

uses u_dm;

{$R *.dfm}

function TFrmSpalshScreen.execute: boolean;
begin
  Result := false;
  dm.openSQL(dm.qexec,'select * from room');
  Result := true;
end;

procedure TFrmSpalshScreen.FormCreate(Sender: TObject);
begin
  Width:= Image1.Width;
  Height:= Image1.Height;
  x := 0;
//  Screen.Cursor:= crHourGlass;
end;

procedure TFrmSpalshScreen.FormDestroy(Sender: TObject);
begin
  Cursor := crDefault;
end;

procedure TFrmSpalshScreen.Timer1Timer(Sender: TObject);
begin
  loading.Position := x;
  Inc(x);
  if x >= 10 then
  Timer1.Enabled:= False;
end;

end.
