//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Ultima modificacao: 03/2007
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadIndice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, ToolEdit, RXDBCtrl, StdCtrls, Mask, CurrEdit, Grids,
  DBGrids, JvLabel, JvTransBtn, EMsgDlg, JvComponent, JvEnterTab, fcLabel,
  ExtCtrls, fcpanel, DB;

type
  TfrmCadIndice = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    JvEnterAsTab2: TJvEnterAsTab;
    pnBotoes: TfcPanel;
    btnPrimeiro: TJvTransparentButton;
    btnAnterior: TJvTransparentButton;
    btnProximo: TJvTransparentButton;
    btnUltimo: TJvTransparentButton;
    btnNovo: TJvTransparentButton;
    btnGravar: TJvTransparentButton;
    btnCancelar: TJvTransparentButton;
    btnAlterar: TJvTransparentButton;
    btnDeletar: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    pnCentro: TfcPanel;
    JvLabel1: TJvLabel;
    GridMoeda: TRxDBGrid;
    JvLabel2: TJvLabel;
    dbValor: TRxDBCalcEdit;
    JvLabel3: TJvLabel;
    dbData: TDBDateEdit;
    dbMoeda: TDBEdit;
    MsgDlg: TEvMsgDlg;
    procedure btnSairClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure dbValorExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadIndice: TfrmCadIndice;
  NovoItem    : Boolean      ;

implementation

uses untdmDados, untPrincipal;

{$R *.dfm}

procedure TfrmCadIndice.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadIndice.btnPrimeiroClick(Sender: TObject);
begin
  dmDados.tbIndice.First;
  btnPrimeiro.Enabled := False;
  btnAnterior.Enabled := False;
  btnProximo.Enabled  := True ;
  btnUltimo.Enabled   := True ; 
  dmDados.vTabStt     := True ;
end;

procedure TfrmCadIndice.btnAnteriorClick(Sender: TObject);
begin
  dmDados.tbIndice.Prior;
  btnProximo.Enabled := True;
  btnUltimo.Enabled  := True;
  if DMDados.tbIndice.Bof then
    begin
    btnPrimeiro.Enabled := False;
    btnAnterior.Enabled := False;
    end;
  dmDados.vTabStt := True;
end;

procedure TfrmCadIndice.btnProximoClick(Sender: TObject);
begin
  dmDados.tbIndice.Next;
  btnPrimeiro.Enabled := True;
  btnAnterior.Enabled := True;
  If dmDados.tbIndice.Eof Then
    Begin
    btnProximo.Enabled := False;
    btnUltimo.Enabled  := False;
    End;
  dmDados.vTabStt := True;
end;

procedure TfrmCadIndice.btnUltimoClick(Sender: TObject);
begin
  dmDados.tbIndice.Last;
  btnPrimeiro.Enabled := True ;
  btnAnterior.Enabled := True ;
  btnProximo.Enabled  := False;
  btnUltimo.Enabled   := False;
  dmDados.vTabStt     := True ;
end;

procedure TfrmCadIndice.btnNovoClick(Sender: TObject);
begin
  dmdados.tbIndice.Append;
  NovoItem             := True ;
  dmDados.vTabStt      := False;
  // Ajusta bot�es
  btnGravar.Enabled    := true ;
  btnCancelar.Enabled  := true ;
  btnNovo.Enabled      := False;
  btnPrimeiro.Enabled  := False;
  btnAnterior.Enabled  := False;
  btnProximo.Enabled   := False;
  btnUltimo.Enabled    := False;
  btnAlterar.Enabled   := False;
  btnDeletar.Enabled   := False;
  // Habilitando os componentes
  dbData.Enabled    := True ;
  dbMoeda.Enabled   := True ;
  dbValor.Enabled   := True ;
  GridMoeda.Enabled := True ;
  dbData.SetFocus;
end;

procedure TfrmCadIndice.btnGravarClick(Sender: TObject);
var
  Campos : string ;
  Gravar : boolean;
  Vazio  : boolean;
  x      : integer;
  Flag   : boolean;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  if dbData.Text= '  /  /    ' then
    begin
    if Length(Campos)>0 then Campos:=Campos+', ';
    Campos:=Campos+'Data';
    Gravar:=False;
    Vazio:=True;
    end
  else
    try StrToDate(dbData.text)
    except on EConvertError do
      begin
      MsgDlg.MsgError('Data Inv�lida!');
      gravar:= false;
      end;
    end;
  if (dbMoeda.Text = '') then
    begin
    if (Length(Campos) > 0) then
      Campos := Campos + ', ';
    Campos := 'Moeda';
    Gravar := False ;
    Vazio  := True  ;
    end;
  if dbValor.Text= '' then
    begin
    if dbValor.value=0 then Campos:=Campos+', ';
    Campos:=Campos+'Valor(R$)';
    Gravar:=False;
    Vazio:=True;
    end;
  if Gravar Then
    begin
    NovoItem:= False;
    dmdados.tbIndice.Post;
    dmDados.vTabStt:=True;
    // Ajusta Bot�es
    BtnGravar.enabled   := False;
    BtnCancelar.Enabled := False;
    BtnNovo.Enabled     := True ;
    BtnPrimeiro.Enabled := True ;
    BtnAnterior.Enabled := True ;
    BtnProximo.Enabled  := True ;
    BtnUltimo.Enabled   := True ;
    BtnAlterar.Enabled  := True ;
    Btndeletar.Enabled  := True ;
    // Desabilitando os Componentes
    dbData.Enabled    := False;
    dbMoeda.Enabled   := False;
    dbValor.Enabled   := False;
    GridMoeda.Enabled := False;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    dmDados.tbIndice.Refresh;
    pnBotoes.SetFocus;
    end
  else
    if (Vazio) then
      begin
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      dbData.Enabled := True;
      dbData.SetFocus;
      end;
end;

procedure TfrmCadIndice.btnCancelarClick(Sender: TObject);
begin
  dmdados.tbIndice.Cancel;
  NovoItem            := False;
  dmDados.vTabStt     := True ;
 // Ajusta bot�es
  btngravar.Enabled   := False;
  BtnNovo.Enabled     := True ;
  BtnCancelar.Enabled := False;
  BtnPrimeiro.Enabled := True ;
  BtnAnterior.Enabled := True ;
  BtnProximo.Enabled  := True ;
  BtnUltimo.Enabled   := True ;
  BtnAlterar.Enabled  := True ;
  BtnDeletar.Enabled  := True ;
  pnBotoes.SetFocus;
  // Desabilitando os Componentes
  dbData.Enabled    := False;
  dbMoeda.Enabled   := False;
  dbValor.Enabled   := False;
  GridMoeda.Enabled := False;
  pnBotoes.SetFocus;
end;

procedure TfrmCadIndice.btnAlterarClick(Sender: TObject);
begin
  if (dmDados.tbIndice.RecordCount = 0) then
    MsgDlg.MsgError('Tabela sem registro!!!')
  else
    begin
    NovoItem             := True ;
    dmdados.tbIndice.Edit;
    // Ajusta Bot�es
    BtnCancelar.Enabled  := True ;
    BtnGravar.Enabled    := True ;
    BtnNovo.Enabled      := False;
    BtnPrimeiro.Enabled  := False;
    BtnAnterior.Enabled  := False;
    BtnProximo.Enabled   := False;
    BtnUltimo.Enabled    := False;
    BtnAlterar.Enabled   := False;
    Btndeletar.Enabled   := False;
  // Habilitando os componentes
    dbData.Enabled    := True ;
    dbMoeda.Enabled   := True ;
    dbValor.Enabled   := True ;
    GridMoeda.Enabled := True ;
    dmDados.vTabStt   := False;
    dbData.SetFocus;
    end;
end;

procedure TfrmCadIndice.btnDeletarClick(Sender: TObject);
var
  Flag : Boolean;
begin
  Flag := False;
  if (dmDados.tbIndice.RecordCount = 0) then
    MsgDlg.MsgError('Tabela vazia')
  else
    if MsgDlg.MsgConfirmation('Tem certeza que deseja excluir este registro?') = id_yes then
      begin
      if (Flag) then
        MsgDlg.MsgInformation('�ndice ativo, ou com registro de opera��es anteriores, n�o pode ser exclu�do !!!')
      else
        dmdados.tbIndice.Delete;
      end
    else
      dmdados.tbIndice.cancel;
end;

procedure TfrmCadIndice.FormActivate(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,' [Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
end;

procedure TfrmCadIndice.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    dmDados.tbIndice.Close ;
    frmPrincipal.StatusTeclas(False,'');
    Action := CaFree;
end;

procedure TfrmCadIndice.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case (key) of
    // Teclas de a��o na tabela
    VK_Insert : if (dmDados.vTabStt) then btnNovo.Click;
    VK_Home   : if (dmDados.vTabStt) then btnAlterar.Click;
    VK_Delete : if (dmDados.vTabStt) then btnDeletar.Click;
    VK_End    : if not(dmDados.vTabStt) then btnGravar.Click;
    VK_ESCAPE : if not(dmDados.vTabStt) then btnCancelar.Click
                else btnSair.Click;
  end;
end;

procedure TfrmCadIndice.FormShow(Sender: TObject);
begin
  dmDados.vTabStt := True;
  if (dmDados.tbIndice.State = dsInactive) then
    dmDados.tbIndice.Open;
end;

procedure TfrmCadIndice.dbValorExit(Sender: TObject);
begin
  pnBotoes.SetFocus;
end;

end.
