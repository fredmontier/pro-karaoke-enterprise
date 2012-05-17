unit u_request;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SkinData, DynamicSkinForm, SkinCtrls, SkinExCtrls, StdCtrls, Mask,
  DBCtrls, u_dm;

type
  Tf_request = class(TForm)
    Label3: TLabel;
    Label1: TLabel;
    spSkinXFormButton1: TspSkinXFormButton;
    Edit1: TEdit;
    Edit2: TEdit;
    spSkinXFormButton2: TspSkinXFormButton;
    spDynamicSkinForm1: TspDynamicSkinForm;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure spSkinXFormButton1Click(Sender: TObject);
    procedure spSkinXFormButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_request: Tf_request;

implementation

uses u_main;

{$R *.dfm}

procedure Tf_request.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform (CM_DialogKey, VK_TAB, 0);
  end;
end;

procedure Tf_request.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  form1.FormStyle:=fsStayOnTop;
  dm.t_request.Close;
end;

procedure Tf_request.FormShow(Sender: TObject);
begin
  form1.FormStyle:=fsNormal;
  edit1.Clear;
  edit2.Clear;
  dm.t_request.Open;
end;

procedure Tf_request.spSkinXFormButton1Click(Sender: TObject);
begin
  if (Edit1.Text<>'') and (Edit2.Text<>'') then
  begin
    dm.t_request.Append;
    dm.t_requestroom.Value:=Form1.Room.Text;
    dm.t_requesttanggal.Value:=now;
    dm.t_requestjudul.Value:=Edit1.Text;
    dm.t_requestpenyanyi.Value:=Edit2.Text;
    dm.t_requestmember.Value:=Form1.member.Text;
    dm.t_request.Post;
    close;
  end else
  begin
    form1.FormStyle:=fsNormal;
    MessageDlg('Input tidak lengkap!.', mtInformation, [mbOk], 0);
    if Edit1.Text='' then
      edit1.SetFocus else
      edit2.SetFocus;
  end;
end;

procedure Tf_request.spSkinXFormButton2Click(Sender: TObject);
begin
  dm.t_request.Cancel;
  close;
end;

end.
