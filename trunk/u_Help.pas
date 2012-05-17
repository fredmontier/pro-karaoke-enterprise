unit u_Help;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, SkinBoxCtrls, u_dm, DynamicSkinForm, ExtCtrls, jpeg;

type
  Tfrm_Help = class(TForm)
    spSkinMemo1: TspSkinMemo;
    Label1: TLabel;
    Image1: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Help: Tfrm_Help;

implementation

{$R *.dfm}

procedure Tfrm_Help.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_Help.FormCreate(Sender: TObject);
begin
KeyPreview := true;
end;

procedure Tfrm_Help.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_f1 then close;
end;

end.
