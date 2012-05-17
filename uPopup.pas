unit uPopup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DynamicSkinForm, SkinCtrls, SkinBoxCtrls, u_DM, StdCtrls;

type
  TFrmPupop = class(TForm)
    spDynamicSkinForm1: TspDynamicSkinForm;
    spSkinGroupBox1: TspSkinGroupBox;
    List1: TListBox;
    Label1: TLabel;
    spSkinButton1: TspSkinButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure List1DblClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure spSkinButton1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure Execute(ID: string; ALeft: Integer);
    function Executed: string;
  end;

var
  FrmPupop: TFrmPupop;

implementation

uses u_main;

{$R *.dfm}

{ TFrmPupop }

procedure TFrmPupop.Button1Click(Sender: TObject);
begin
close;
end;

procedure TFrmPupop.Execute(ID: string; ALeft: Integer);
begin
if ID='0' then begin
  List1.Clear;
  List1.Items.Add('KARAOKE');
  List1.Items.Add('DISKO');
end
else
if ID='1' then begin
  List1.Clear;
  List1.Items.Add('ANAK');
  List1.Items.Add('ROHANI');
  List1.Items.Add('JEPANG');
  List1.Items.Add('KOREA');
  List1.Items.Add('CDG FILE');
end;
  FrmPupop.Left := ALeft;
end;

function TFrmPupop.Executed: string;
begin
//  Result := '';
//  if ModalResult = mrOk then
    if List1.ItemIndex > -1 then
      Result := List1.Items[List1.ItemIndex] else
      Result := 'ALL';
end;

procedure TFrmPupop.FormCreate(Sender: TObject);
begin
  KeyPreview := true;
end;

procedure TFrmPupop.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=vk_return) or (key=vk_escape) or (key=vk_f5) then
    close;
end;

procedure TFrmPupop.FormShow(Sender: TObject);
begin
  Execute(DM.IDTmp, 640);
end;

procedure TFrmPupop.Label1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmPupop.List1DblClick(Sender: TObject);
begin
  close;
end;

procedure TFrmPupop.spSkinButton1Click(Sender: TObject);
begin
  close;
end;

end.
