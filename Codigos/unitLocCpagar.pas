//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitLocCpagar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RXSplit, StdCtrls, Mask, DBCtrls, RXCtrls, ExtCtrls, SpeedBar, jpeg,
  CurrEdit, RXDBCtrl, ToolEdit, fcButton, fcImgBtn, Grids, DBGrids,
  RackCtls, db, Variants, RxGrdCpt, fcImager, EMsgDlg;

type
  TFrmLocCpagar = class(TForm)
    Panel1: TPanel;
    RxLabel3: TRxLabel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel7: TRxLabel;
    LEDButton1: TLEDButton;
    LEDButton2: TLEDButton;
    EdtValor: TEdit;
    EdtCampo: TEdit;
    fclLocCPagar: TfcImageBtn;
    cmbcampo: TComboBox;
    RxDBGrid1: TRxDBGrid;
    fclSair: TfcImageBtn;
    Panel2: TPanel;
    RxLabel4: TRxLabel;
    Image3: TImage;
    RxGradientCaption2: TRxGradientCaption;
    MsgDlg: TEvMsgDlg;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValorExit(Sender: TObject);
    procedure fclSairClick(Sender: TObject);
    procedure cmbcampoExit(Sender: TObject);
    procedure fclLocCPagarClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure LEDButton1DblClick(Sender: TObject);
    procedure LEDButton2DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLocCpagar: TFrmLocCpagar;
        LocOpts : TlocateOptions;
      NumDocTab : String;
            Cor : boolean;
        vertipo : char;
implementation

uses UnitDmdados, UnitPrincipal;

{$R *.DFM}

procedure TFrmLocCpagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.StatusTeclas(False,'');
end;

procedure TFrmLocCpagar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
    begin
    Key:=#0;
    Perform(wm_nextdlgctl,0,0);
    end;
end;

procedure TFrmLocCpagar.EdtValorExit(Sender: TObject);
begin
  fclLocCPagar.Default:=true;
  fclLocCPagar.SetFocus;
end;

procedure TFrmLocCpagar.fclSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmLocCpagar.cmbcampoExit(Sender: TObject);
begin
  if cmbCampo.Text = 'Documento' then
    edtCampo.Text:='NumDoc';
end;

procedure TFrmLocCpagar.fclLocCPagarClick(Sender: TObject);
begin
  if (vertipo='I') and (StrToIntDef(edtvalor.text,-1)= -1) then
    begin
    MsgDlg.MsgError('Valor digitado deve ser num�rico');
    edtvalor.SetFocus;
    abort;
    end;
  fclLocCpagar.Default:= False;
  LocOpts:=[];
  if LEDButton1.StateOn then LocOpts:=LocOpts+[loPartialKey];
  if LEDButton2.StateOn then LocOpts:=LocOpts+[loCaseInsensitive];
  if not dmdados.tbCpagar.locate(edtCampo.Text, edtValor.text,LocOpts) then
    MsgDlg.MsgWarning('N�o foi encontrado o valor ' + edtValor.text + ' para o campo '+ cmbCampo.text)
  else
    begin
    cor := true;
    NumDocTab:=dmDados.tbCpagarNumDoc.Value;
    end;
  Cmbcampo.SetFocus;
end;

procedure TFrmLocCpagar.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  doc : string;
begin
  doc :=(Sender as TrxDBGrid).DataSource.DataSet.FieldByName('NumDoc').asString;
  if cor then
    if doc = NumDocTab then
     background:=$00D2E2FF;
end;

procedure TFrmLocCpagar.LEDButton1DblClick(Sender: TObject);
begin
  if LEDButton1.StateOn then
    LEDButton1.StateOn:=False
  else
    LEDButton1.StateOn:=True;
end;

procedure TFrmLocCpagar.LEDButton2DblClick(Sender: TObject);
begin
  if LEDButton2.StateOn then
    LEDButton2.StateOn:=False
  else
    LEDButton2.StateOn:=True;
end;

procedure TFrmLocCpagar.FormShow(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,'[PageUp] A=ABC [PageDown] A=a [F2] Localizar [Esc] Sai');
  cmbcampo.ItemIndex:=0;
  cmbcampo.SetFocus;
  EdtCampo.Text:='NumDoc';
  vertipo:='k';
end;

procedure TFrmLocCpagar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_ESCAPE then
    fclSair.Click;
  if Key=VK_PRIOR then
    LEDButton1DblClick(Sender);
  if Key=VK_NEXT then
    LEDButton2DblClick(Sender);
end;

end.
