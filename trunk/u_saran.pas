unit u_saran;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, SkinCtrls, SkinExCtrls, DBCtrls, SkinData, DynamicSkinForm,
  ExtCtrls, u_Dm, SkinBoxCtrls;

type
  Tf_saran = class(TForm)
    spSkinBevel1: TspSkinBevel;
    Label1: TLabel;
    spSkinXFormButton1: TspSkinXFormButton;
    spSkinXFormButton2: TspSkinXFormButton;
    spDynamicSkinForm1: TspDynamicSkinForm;
    Layan: TspSkinRadioGroup;
    Makan: TspSkinRadioGroup;
    Lain: TspSkinRadioGroup;
    spSkinMemo1: TspSkinMemo;
    SoundSystem: TspSkinRadioGroup;
    Interior: TspSkinRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spSkinXFormButton2Click(Sender: TObject);
    procedure spSkinXFormButton1Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  f_saran: Tf_saran;

implementation


{$R *.dfm}

procedure Tf_saran.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.t_saran.Close;
end;

procedure Tf_saran.FormShow(Sender: TObject);
begin
  dm.t_saran.Open;
end;

procedure Tf_saran.spSkinXFormButton1Click(Sender: TObject);
var AID: Integer;
begin
  if dm.Saran then begin
    AID := 0;
    dm.execSQL(dm.qexec,'INSERT into saran (member,room,tanggal) '+
    'VALUES (1,'+QuotedStr(DM.RoomID)+','+QuotedStr(FormatDateTime('yyyy-mm-dd', Date))+')');

    AID := Dm.getIntegerFromSQL(dm.qexec, 'select @@identity');

    dm.execSQL(dm.qexec, 'insert into saran_detail (id_saran, kat, saran) '+
    'values ('+IntToStr(AID)+','+QuotedStr(Layan.Caption)+','+QuotedStr(Layan.Items[Layan.ItemIndex])+')');

    dm.execSQL(dm.qexec, 'insert into saran_detail (id_saran, kat, saran) '+
    'values ('+IntToStr(AID)+','+QuotedStr(Makan.Caption)+','+QuotedStr(Makan.Items[Makan.ItemIndex])+')');

    dm.execSQL(dm.qexec, 'insert into saran_detail (id_saran, kat, saran) '+
    'values ('+IntToStr(AID)+','+QuotedStr(Lain.Caption)+','+QuotedStr(Lain.Items[Lain.ItemIndex])+')');

    dm.execSQL(dm.qexec, 'insert into saran_detail (id_saran, kat, saran) '+
    'values ('+IntToStr(AID)+','+QuotedStr(SoundSystem.Caption)+','+QuotedStr(SoundSystem.Items[SoundSystem.ItemIndex])+')');

    dm.execSQL(dm.qexec, 'insert into saran_detail (id_saran, kat, saran) '+
    'values ('+IntToStr(AID)+','+QuotedStr(Interior.Caption)+','+QuotedStr(Interior.Items[Interior.ItemIndex])+')');

    dm.execSQL(dm.qexec, 'insert into saran_detail (id_saran, kat, saran) '+
    'values ('+IntToStr(AID)+','+QuotedStr('MEMBER')+','+QuotedStr(spSkinMemo1.Text)+')');

    DM.Saran := False;
  end
  else begin
    Application.MessageBox('Maaf, Saran hanya berlaku satu kali','Saran', 0);
  end;
  close;
//  dm.inform('TERIMA KASIH ATAS SARAN ANDA', dm.spSkinMessage1);
end;

procedure Tf_saran.spSkinXFormButton2Click(Sender: TObject);
begin
  close;
end;

end.
