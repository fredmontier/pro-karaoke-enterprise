unit uFood;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, u_dm, DynamicSkinForm, AdvEdit, ComCtrls, SkinTabs, Grids, AdvObj, BaseGrid, AdvGrid,
  AdvCGrid, Menus, SkinMenus, cxButtonEdit, cxCheckBox, cxHyperLinkEdit,
  RzLabel, StrUtils,
  dxtree, dxdbtree, spMessages, AdvSmoothMenu, AdvSmoothListBox,
  DBAdvSmoothListBox, SkinCtrls, DB, MemDS, DBAccess, Uni, StdCtrls, ExtCtrls;

type
  TFrmFood = class(TForm)
    spSkinPageControl1: TspSkinPageControl;
    spSkinTabSheet1: TspSkinTabSheet;
    spSkinTabSheet2: TspSkinTabSheet;
    spDynamicSkinForm1: TspDynamicSkinForm;
    DataSource1: TDataSource;
    buffer: TUniQuery;
    Image1: TImage;
    Memo1: TMemo;
    BtnCari: TspSkinButton;
    EdSearch: TAdvEdit;
    Label1: TLabel;
    pupopList: TspSkinPopupMenu;
    ambahkeList1: TMenuItem;
    grid: TAdvStringGrid;
    BtnDelete: TspSkinButton;
    BtnSimpan: TspSkinButton;
    BtnBatal: TspSkinButton;
    LbCalc: TRzLabel;
    Msg1: TspSkinMessage;
    Label2: TLabel;
    spSkinPanel1: TspSkinPanel;
    Menu1: TAdvSmoothMenu;
    spSkinPanel2: TspSkinPanel;
    ListMenu: TAdvSmoothListBox;
    LbHarga: TLabel;
    LbNama: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BtnCariClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure spSkinTabSheet2Show(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ambahkeList1Click(Sender: TObject);
    procedure gridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure gridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gridGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure gridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure BtnSimpanClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure gridCellValidate(Sender: TObject; ACol, ARow: Integer;
      var Value: string; var Valid: Boolean);
    procedure cxGrid1DBTableView1Btn1PropertiesStartClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Menu1ItemClick(Sender: TObject; ItemIndex: Integer);
    procedure ListMenuItemDblClick(Sender: TObject; itemindex: Integer);
    procedure ListMenuItemClick(Sender: TObject; itemindex: Integer);
    procedure EdSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure loadDataFood(AStr: String);
    procedure loadData(AStr: String);
    procedure viewData(AStr: String);
    procedure initForm;
    procedure initGrid;
    procedure setColWidth;
    function calcOrder: real;

    function isSaved(ANum: String): Boolean;
  public
    { Public declarations }
  end;

var
  FrmFood: TFrmFood;

const
  colNo = 0;
  colID = 1;
  colKode = 2;
  colNama = 3;
  colharga = 4;
  colQty = 5;
  colTotal = 6;

implementation

{$R *.dfm}

procedure TFrmFood.ambahkeList1Click(Sender: TObject);
begin
  try
    if DM.NoTrans = '' then
      Application.MessageBox('Menu Food belum aktif', 'Order F&B', 0)
    else
    begin
      if DM.getIntegerFromSQL(DM.qexec,
        'select count(urut) from transaksi_detail where NoTransaksi=' +
        QuotedStr(DM.NoTrans) + ' and IdFnb=' + buffer.Fields[2].AsString +
        ' and status=0') = 0 then
        DM.execSQL(DM.qexec,
          'insert into transaksi_detail (NoTransaksi,IdFnb,Harga,Qty,Jumlah) ' +
          'values (' + QuotedStr(DM.NoTrans) + ',' + buffer.Fields[2].AsString +
          ',' + DM.qexec3.Fields[0].AsString + ',Qty+1,Qty*Harga)')
      else
        DM.execSQL(DM.qexec, 'update transaksi_detail set ' + 'Harga=' +
          DM.qexec3.Fields[0].AsString + ',' + 'Qty=Qty+1, Jumlah=Qty*Harga ' +
          'where NoTransaksi=' + QuotedStr(DM.NoTrans) + ' AND IdFnb=' +
          buffer.Fields[2].AsString);

      Application.MessageBox('Order Sukses', 'Order F&B', 0)
    end;
  except
    Application.MessageBox('Order Item belum dipilih ! Silahkan ulang kembali',
      'Order F&B', 0);
//    cxGrid1.SetFocus;
  end;
end;

procedure TFrmFood.BtnCariClick(Sender: TObject);
begin
  loadData(EdSearch.Text);
end;

procedure TFrmFood.BtnDeleteClick(Sender: TObject);
begin
  // if DM.confirm('Yakin hapus data order ?', DM.spSkinMessage1) then
  grid.RemoveNormalRow(grid.GetRealRow);
end;

procedure TFrmFood.BtnSimpanClick(Sender: TObject);
begin
  if isSaved(DM.NoTrans) then
    close;
end;

function TFrmFood.calcOrder: real;
var
  i: Integer;
  ATotal: real;
begin
  ATotal := 0;
  for i := 1 to grid.RowCount do
  begin
    if Length(grid.Cells[colID, i]) > 0 then
      ATotal := ATotal + DM.StrFmtToFloatDef(grid.Cells[colTotal, i], 0);
    // ShowMessage(grid.Cells[colTotal, i]);
  end;
  LbCalc.Caption := 'Total : ' + DM.FloatToStrFmt(ATotal, True, 0);
  Result := ATotal;
end;

procedure TFrmFood.cxGrid1DBTableView1Btn1PropertiesStartClick(Sender: TObject);
begin
  ambahkeList1Click(Sender);
end;

procedure TFrmFood.EdSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then loadDataFood(EdSearch.Text);
end;

procedure TFrmFood.FormCreate(Sender: TObject);
begin
  KeyPreview := True;
  spSkinPageControl1.ActivePageIndex := 0;
end;

procedure TFrmFood.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then
    close;
end;

procedure TFrmFood.FormShow(Sender: TObject);
begin
  initForm;
end;

procedure TFrmFood.gridCanEditCell(Sender: TObject; ARow, ACol: Integer;
  var CanEdit: Boolean);
begin
  CanEdit := (ACol = colQty) and (Length(grid.Cells[colID, grid.Row]) > 0);
end;

procedure TFrmFood.gridCellValidate(Sender: TObject; ACol, ARow: Integer;
  var Value: string; var Valid: Boolean);
begin
  Valid := (grid.Cells[colQty, grid.Row] <> '');
  if Valid then
  begin
    grid.Cells[colTotal, grid.Row] :=
      DM.FloatToStrFmt(grid.Floats[colQty, grid.Row] * grid.Floats[colharga,
      grid.Row], True, 0);
  end;
end;

procedure TFrmFood.gridGetAlignment(Sender: TObject; ARow, ACol: Integer;
  var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ACol in [colharga, colQty, colTotal] then
    HAlign := taRightJustify;
end;

procedure TFrmFood.gridGetEditorType(Sender: TObject; ACol, ARow: Integer;
  var AEditor: TEditorType);
begin
  if ACol = colQty then
    AEditor := edNumeric;
end;

procedure TFrmFood.gridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // if key=vk_return then
  // begin
  if (grid.Col = colQty) and (Length(grid.Cells[colID, grid.Row]) > 0) then
  begin
    grid.Cells[colTotal, grid.Row] :=
      DM.FloatToStrFmt(grid.Floats[colharga, grid.Row] * grid.Floats[colQty,
      grid.Row], True, 0);
    calcOrder;
    setColWidth;
    // end;
  end;
end;

procedure TFrmFood.initForm;
var i : byte;
begin
  DM.openSQL(DM.qexec1, 'select NoTransaksi from room where id_room=' +
    QuotedStr(DM.RoomID));
  if DM.qexec1.RecordCount > 0 then
    DM.NoTrans := DM.qexec1.Fields[0].AsString
  else
    DM.NoTrans := '';

  Menu1.Items.Clear;
  ListMenu.Items.Clear;
  Menu1.Items.Add;
  Menu1.Items[0].Tag := 0;
  Menu1.Items[0].Caption := 'Semua Menu';
  Menu1.Items[0].Notes := 'Semua Kategori Menu';
  dm.openSQL(DM.qexec, 'select * from menu_fb_kategori order by kategori');
  for i := 1 to DM.qexec.RecordCount do begin
     Menu1.Items.Add;
     Menu1.Items[i].Tag := DM.qexec.Fields[0].AsInteger;
     Menu1.Items[i].Caption := DM.qexec.Fields[1].AsString;
     Menu1.Items[i].Notes := 'Kategori Menu '+DM.qexec.Fields[1].AsString;
     dm.qexec.Next;
  end;

  initGrid;
  loadData('');
  LbHarga.Caption := '0';
  LbNama.Caption := '';
  Memo1.Clear;
  EdSearch.Clear;
  spSkinPageControl1.ActivePageIndex := 0;
  DataSource1.DataSet.First;
//  cxGrid1.SetFocus;
end;

procedure TFrmFood.initGrid;
begin
  with grid do
  begin
    Clear;
    ColCount := colTotal + 2;
    RowCount := 2;
    Cells[colNo, 0] := 'No';
    Cells[colID, 0] := 'ID';
    Cells[colKode, 0] := 'KODE';
    Cells[colNama, 0] := 'Nama Menu';
    Cells[colharga, 0] := 'Harga';
    Cells[colQty, 0] := 'Qty';
    Cells[colTotal, 0] := 'Total';
  end;
  setColWidth;
end;

function TFrmFood.isSaved(ANum: String): Boolean;
var
  i: Integer;
begin
  try
    DM.execSQL(DM.qexec,
      'delete from transaksi_detail where status = 0 and NoTransaksi=' +
      QuotedStr(ANum));
    for i := 1 to grid.RowCount - 1 do
    begin
      if grid.Cells[colID, i] <> '' then
      begin
        DM.execSQL(DM.qexec,
          'insert into transaksi_detail (NoTransaksi,IdFnb,Harga,Qty,Jumlah,status) '
          + 'values (' + QuotedStr(ANum) + ',' + grid.Cells[colID, i] + ',' +
          FloatToStr(DM.StrFmtToFloatDef(grid.Cells[colharga, i], 0)) + ',' +
          grid.Cells[colQty, i] + ',' +
          FloatToStr(DM.StrFmtToFloatDef(grid.Cells[colTotal, i], 0)) + ', 1)');
        DM.execSQL(DM.qexec, 'update room set status=''O'' where id_room=' +
          QuotedStr(DM.RoomID));
        DM.execSQL(DM.qexec, 'insert into room_hist (id_room, hist) values (' +
          QuotedStr(DM.RoomID) + ',''O'')');
      end;
    end;
    Result := True;
    Msg1.MessageDlg('Data order sukses disimpan.', mtInformation, [mbOK], 0);
    // ShowMessage('Data order sukses disimpan.');
  except
    Result := false;
  end;
end;

procedure TFrmFood.Label1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmFood.ListMenuItemClick(Sender: TObject; itemindex: Integer);
begin
  viewData(IntToStr(ListMenu.Items[itemindex].Tag));
end;

procedure TFrmFood.ListMenuItemDblClick(Sender: TObject; itemindex: Integer);
begin
  try
    if DM.NoTrans = '' then
      Application.MessageBox('Menu Food belum aktif', 'Order F&B', 0)
    else
    begin
      if DM.getIntegerFromSQL(DM.qexec,
        'select count(urut) from transaksi_detail where NoTransaksi=' +
        QuotedStr(DM.NoTrans) + ' and IdFnb=' + IntToStr(ListMenu.Items[itemindex].Tag) +
        ' and status=0') = 0 then
        DM.execSQL(DM.qexec,
          'insert into transaksi_detail (NoTransaksi,IdFnb,Harga,Qty,Jumlah) ' +
          'values (' + QuotedStr(DM.NoTrans) + ',' + IntToStr(ListMenu.Items[itemindex].Tag) +
          ',' + DM.qexec3.Fields[0].AsString + ',Qty+1,Qty*Harga)')
      else
        DM.execSQL(DM.qexec, 'update transaksi_detail set ' + 'Harga=' +
          DM.qexec3.Fields[0].AsString + ',' + 'Qty=Qty+1, Jumlah=Qty*Harga ' +
          'where NoTransaksi=' + QuotedStr(DM.NoTrans) + ' AND IdFnb=' +
          IntToStr(ListMenu.Items[itemindex].Tag));

      Application.MessageBox('Order Sukses', 'Order F&B', 0)
    end;
  except
    Application.MessageBox('Order Item belum dipilih ! Silahkan ulang kembali',
      'Order F&B', 0);
//    cxGrid1.SetFocus;
  end;
end;

procedure TFrmFood.loadData(AStr: String);
var i: integer;
begin
  ListMenu.Items.Clear;
  DM.openSQL(buffer,'select IDMenu, KodeMenu, NamaMenu, HargaBeli, Harga, Deskripsi from menu_fb_header '+
  'where NamaMenu LIKE '+ QuotedStr('%'+AStr+'%') +' Order by NamaMenu ');
  if buffer.RecordCount > 0 then begin
    for i := 0 to buffer.RecordCount -1 do begin
      ListMenu.Items.Add;
      ListMenu.Items[i].Tag := buffer.Fields[0].AsInteger;
      ListMenu.Items[i].Caption := buffer.Fields[2].AsString;
      buffer.Next;
    end;
  end;
end;

procedure TFrmFood.loadDataFood(AStr: String);
var
  i: byte;
begin
  DM.openSQL(DM.qexec2,
    'SELECT f.IDMenu, f.KodeMenu, f.NamaMenu, d.Harga, sum(d.Qty), d.Diskon, sum(d.Jumlah) '
    + 'FROM transaksi_detail d JOIN menu_fb_header f on d.IdFnb=f.IDMenu ' +
    'WHERE d.status <= 1 and d.NoTransaksi=' + QuotedStr(AStr) +
    ' GROUP BY f.IDMenu');
  initGrid;

  with DM.qexec2 do
  begin
    if RecordCount > 0 then
    begin
      First;
      for i := 1 to RecordCount do
      begin
        grid.RowCount := i + 2;
        grid.Ints[colNo, i] := i;
        grid.Ints[colID, i] := Fields[0].AsInteger;
        grid.Cells[colKode, i] := Fields[1].AsString;
        grid.Cells[colNama, i] := Fields[2].AsString;
        grid.Cells[colharga, i] := DM.FloatToStrFmt(Fields[3].AsFloat, True, 0);
        grid.Ints[colQty, i] := Fields[4].AsInteger;
        grid.Cells[colTotal, i] := DM.FloatToStrFmt(Fields[6].AsFloat, True, 0);
        Next;
      end;
    end;
    grid.AutoSize := True;
    setColWidth;
    calcOrder;
  end;
end;

procedure TFrmFood.Menu1ItemClick(Sender: TObject; ItemIndex: Integer);
var i: integer;
begin
  ListMenu.Items.Clear;
  DM.openSQL(buffer,'select IDMenu, KodeMenu, NamaMenu, HargaBeli, Harga, Deskripsi from menu_fb_header '+
  IfThen(Menu1.Items[ItemIndex].Tag > 0,'where IDKategori='+ IntToStr(Menu1.Items[ItemIndex].Tag),' ')+
  ' Order by NamaMenu ');
  if buffer.RecordCount > 0 then begin
    for i := 0 to buffer.RecordCount -1 do begin
      ListMenu.Items.Add;
      ListMenu.Items[i].Tag := buffer.Fields[0].AsInteger;
      ListMenu.Items[i].Caption := buffer.Fields[2].AsString;
      buffer.Next;
    end;
  end;
end;

procedure TFrmFood.setColWidth;
begin
  grid.AutoSize := True;
  grid.ColWidths[colID] := 0;
  grid.ColWidths[colKode] := 0;

end;

procedure TFrmFood.spSkinTabSheet2Show(Sender: TObject);
begin
  loadDataFood(DM.NoTrans);
end;

procedure TFrmFood.viewData(AStr: String);
begin
  DM.openSQL(DM.qexec3, 'SELECT Harga, NamaMenu, Deskripsi, Gambar ' +
    'FROM menu_fb_header WHERE IDMenu=' + AStr);
  with DM.qexec3 do
  begin
    if RecordCount > 0 then
    begin
      LbHarga.Caption := DM.FloatToStrFmt(Fields[0].AsFloat, True, 0);
      // LbHarga.Caption  := Fields[0].AsString;
      LbNama.Caption := Fields[1].AsString;
      Memo1.Lines.Add(Fields[2].AsString);
    end;
  end;
end;

end.
