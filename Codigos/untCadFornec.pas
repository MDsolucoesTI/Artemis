//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Ultima modificacao: 03/2007
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadFornec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TFlatSplitterUnit, ToolEdit, RXDBCtrl, DBCtrls, EDBZero,
  StdCtrls, RxDBComb, Mask, RxGrdCpt, fcButton, fcImgbtn, VerCNPJ, VerCPF,
  RXCtrls, ExtCtrls, DbTables, DB, ShellApi, jpeg, fcImager, EMsgDlg,
  fcLabel, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel, JvPanel, JvTransparentPanel, JvLabel,
  JvComponent, JvTransbtn, EChkCGC, EChkCPF, JvEnterTab, fcpanel, RxLookup,
  ComCtrls, JvDBComb, JvLookup;

type
  TfrmCadFornec = class(TForm)
    pnTop: TfcPanel;
    JvEnterAsTab2: TJvEnterAsTab;
    fcLabel1: TfcLabel;
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
    btnCadCid: TfcImagebtn;
    btnEmail: TfcImagebtn;
    btnTel1: TfcImagebtn;
    btnTel2: TfcImagebtn;
    btnTel3: TfcImagebtn;
    cmbLkCidade: TRxDBLookupCombo;
    cmbTipo: TRxDBComboBox;
    dbBairro: TDBEdit;
    dbCep: TDBEdit;
    dbCnpj: TDBEdit;
    dbCod: TDBEdit;
    dbCompl: TDBEdit;
    dbCpf: TDBEdit;
    dbDataCad: TDBDateEdit;
    dbEmail: TDBEdit;
    dbEnd: TDBEdit;
    dbFantasia: TDBEdit;
    dbIE: TDBEdit;
    dbNome: TDBEdit;
    dbNum: TEvDBZeroEdit;
    dbObs: TDBMemo;
    dbRaz: TDBEdit;
    dbRg: TDBEdit;
    dbTel1: TDBEdit;
    dbTel2: TDBEdit;
    dbTel3: TDBEdit;
    JvTransparentPanel1: TJvTransparentPanel;
    JvLabel1: TJvLabel;
    JvLabel11: TJvLabel;
    lbCPF: TJvLabel;
    JvLabel13: TJvLabel;
    JvLabel14: TJvLabel;
    JvLabel15: TJvLabel;
    JvLabel16: TJvLabel;
    JvLabel17: TJvLabel;
    JvLabel18: TJvLabel;
    JvLabel19: TJvLabel;
    JvLabel2: TJvLabel;
    JvLabel20: TJvLabel;
    JvLabel21: TJvLabel;
    lbRG: TJvLabel;
    JvLabel23: TJvLabel;
    lbNome: TJvLabel;
    lbCNPJ: TJvLabel;
    lbFan: TJvLabel;
    lbIE: TJvLabel;
    lbRaz: TJvLabel;
    cmbTel1: TJvDBComboBox;
    cmbTel2: TJvDBComboBox;
    cmbTel3: TJvDBComboBox;
    cmbVisUF: TJvDBLookupCombo;
    cmbUf: TJvDBLookupCombo;
    MsgDlg: TEvMsgDlg;
    procedure btnSairClick(Sender: TObject);
    procedure DBEemailExit(Sender: TObject);
    procedure btnCadCidClick(Sender: TObject);
    procedure btnTel1Click(Sender: TObject);
    procedure btnTel2Click(Sender: TObject);
    procedure btnTel3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure cmbTipoChange(Sender: TObject);
    procedure cmbTipoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFornec: TfrmCadFornec;

implementation

uses untCadCidade, untDiscar, untdmDados, untPrincipal;


{$R *.dfm}

procedure TfrmCadFornec.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadFornec.DBEemailExit(Sender: TObject);
begin
  pnBotoes.SetFocus;
end;

procedure TfrmCadFornec.btnCadCidClick(Sender: TObject);
begin
  frmCadCidade:=TfrmCadCidade.create(application);
  frmCadCidade.Show;
end;

procedure TfrmCadFornec.btnTel1Click(Sender: TObject);
begin
  frmDiscar:=TfrmDiscar.create(application);
  frmDiscar.Show;
end;

procedure TfrmCadFornec.btnTel2Click(Sender: TObject);
begin
  frmDiscar:=TfrmDiscar.create(application);
  frmDiscar.Show;
end;

procedure TfrmCadFornec.btnTel3Click(Sender: TObject);
begin
  frmDiscar:=TfrmDiscar.create(application);
  frmDiscar.Show;
end;

procedure TfrmCadFornec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDados.tbFornecedor.Close ;
  dmDados.tbPais.Close       ;
  dmDados.tbEstado.Close     ;
  dmDados.tbCidade.Close     ;
  frmPrincipal.StatusTeclas(False,'');
  Action := Cafree;
end;

procedure TfrmCadFornec.btnPrimeiroClick(Sender: TObject);
begin
  dmdados.tbFornecedor.First;
  btnprimeiro.Enabled := False;
  btnAnterior.Enabled := False;
  btnProximo.Enabled  := True ;
  btnUltimo.Enabled   := True ;
  if (cmbTipo.Text = 'PESSOA F�SICA') then
    begin
    lbCPF.Visible      := True ;
    lbCNPJ.Visible     := False;
    lbRG.Visible       := True ;
    lbIE.Visible       := False;
    lbNome.Visible     := True ;
    lbRaz.Visible      := False;
    lbFan.Visible      := False;
    dbCpf.Visible      := True ;
    dbCnpj.Visible     := False;
    dbRg.Visible       := True ;
    dbIE.Visible       := False;
    dbNome.Visible     := True ;
    dbRaz.Visible      := False;
    dbFantasia.Visible := False;
    end
  else
    begin
    lbCPF.Visible      := False;
    lbCNPJ.Visible     := True ;
    lbRG.Visible       := False;
    lbIE.Visible       := True ;
    lbNome.Visible     := False;
    lbRaz.Visible      := True ;
    lbFan.Visible      := True ;
    dbCpf.Visible      := False;
    dbCnpj.Visible     := True ;
    dbRg.Visible       := False;
    dbIE.Visible       := True ;
    dbNome.Visible     := False;
    dbRaz.Visible      := True ;
    dbFantasia.Visible := True ;
    end;
end;

procedure TfrmCadFornec.btnAnteriorClick(Sender: TObject);
begin
  dmdados.tbFornecedor.Prior;
  btnProximo.Enabled  := True ;
  btnUltimo.Enabled   := True ;
  if dmdados.tbFornecedor.bof then
    begin
    btnPrimeiro.Enabled := False;
    btnAnterior.Enabled := False;
    end;
  if (cmbTipo.Text = 'PESSOA F�SICA') then
    begin
    lbCPF.Visible      := True ;
    lbCNPJ.Visible     := False;
    lbRG.Visible       := True ;
    lbIE.Visible       := False;
    lbNome.Visible     := True ;
    lbRaz.Visible      := False;
    lbFan.Visible      := False;
    dbCpf.Visible      := True ;
    dbCnpj.Visible     := False;
    dbRg.Visible       := True ;
    dbIE.Visible       := False;
    dbNome.Visible     := True ;
    dbRaz.Visible      := False;
    dbFantasia.Visible := False;
    end
  else
    begin
    lbCPF.Visible      := False;
    lbCNPJ.Visible     := True ;
    lbRG.Visible       := False;
    lbIE.Visible       := True ;
    lbNome.Visible     := False;
    lbRaz.Visible      := True ;
    lbFan.Visible      := True ;
    dbCpf.Visible      := False;
    dbCnpj.Visible     := True ;
    dbRg.Visible       := False;
    dbIE.Visible       := True ;
    dbNome.Visible     := False;
    dbRaz.Visible      := True ;
    dbFantasia.Visible := True ;
    end;
end;

procedure TfrmCadFornec.btnProximoClick(Sender: TObject);
begin
  dmdados.tbFornecedor.Next;
  btnPrimeiro.Enabled := True ;
  btnAnterior.Enabled := True ;
  if dmdados.tbFornecedor.Eof then
    begin
    btnProximo.Enabled := False;
    btnUltimo.Enabled  := False;
    end;
  if (cmbTipo.Text = 'PESSOA F�SICA') then
    begin
    lbCPF.Visible      := True ;
    lbCNPJ.Visible     := False;
    lbRG.Visible       := True ;
    lbIE.Visible       := False;
    lbNome.Visible     := True ;
    lbRaz.Visible      := False;
    lbFan.Visible      := False;
    dbCpf.Visible      := True ;
    dbCnpj.Visible     := False;
    dbRg.Visible       := True ;
    dbIE.Visible       := False;
    dbNome.Visible     := True ;
    dbRaz.Visible      := False;
    dbFantasia.Visible := False;
    end
  else
    begin
    lbCPF.Visible      := False;
    lbCNPJ.Visible     := True ;
    lbRG.Visible       := False;
    lbIE.Visible       := True ;
    lbNome.Visible     := False;
    lbRaz.Visible      := True ;
    lbFan.Visible      := True ;
    dbCpf.Visible      := False;
    dbCnpj.Visible     := True ;
    dbRg.Visible       := False;
    dbIE.Visible       := True ;
    dbNome.Visible     := False;
    dbRaz.Visible      := True ;
    dbFantasia.Visible := True ;
    end;
end;

procedure TfrmCadFornec.btnUltimoClick(Sender: TObject);
begin
  dmdados.tbFornecedor.Last;
  btnPrimeiro.Enabled := True ;
  btnAnterior.Enabled := True ;
  btnProximo.Enabled  := False;
  btnUltimo.Enabled   := False;
  if (cmbTipo.Text = 'PESSOA F�SICA') then
    begin
    lbCPF.Visible      := True ;
    lbCNPJ.Visible     := False;
    lbRG.Visible       := True ;
    lbIE.Visible       := False;
    lbNome.Visible     := True ;
    lbRaz.Visible      := False;
    lbFan.Visible      := False;
    dbCpf.Visible      := True ;
    dbCnpj.Visible     := False;
    dbRg.Visible       := True ;
    dbIE.Visible       := False;
    dbNome.Visible     := True ;
    dbRaz.Visible      := False;
    dbFantasia.Visible := False;
    end
  else
    begin
    lbCPF.Visible      := False;
    lbCNPJ.Visible     := True ;
    lbRG.Visible       := False;
    lbIE.Visible       := True ;
    lbNome.Visible     := False;
    lbRaz.Visible      := True ;
    lbFan.Visible      := True ;
    dbCpf.Visible      := False;
    dbCnpj.Visible     := True ;
    dbRg.Visible       := False;
    dbIE.Visible       := True ;
    dbNome.Visible     := False;
    dbRaz.Visible      := True ;
    dbFantasia.Visible := True ;
    end;
end;

procedure TfrmCadFornec.btnNovoClick(Sender: TObject);
begin
  dmdados.tbFornecedor.Append;
  NovoItem             := True ;
  cmbUf.Visible        := True ;
  cmbVisUF.Visible     := False;
  {habilitando os bot�es}
  btnGravar.Enabled    := True ;
  btnCancelar.Enabled  := True ;
  btnNovo.Enabled      := False;
  btnPrimeiro.Enabled  := False;
  btnAnterior.Enabled  := False;
  btnProximo.Enabled   := False;
  btnUltimo.Enabled    := False;
  btnAlterar.Enabled   := False;
  btnDeletar.Enabled   := False;
  {habilitando os componentes}
  if (cmbTipo.Text = 'PESSOA F�SICA') then
    begin
    lbCPF.Visible      := True ;
    lbCNPJ.Visible     := False;
    lbRG.Visible       := True ;
    lbIE.Visible       := False;
    lbNome.Visible     := True ;
    lbRaz.Visible      := False;
    lbFan.Visible      := False;
    dbCpf.Visible      := True ;
    dbCnpj.Visible     := False;
    dbRg.Visible       := True ;
    dbIE.Visible       := False;
    dbNome.Visible     := True ;
    dbRaz.Visible      := False;
    dbFantasia.Visible := False;
    end
  else
    begin
    lbCPF.Visible      := False;
    lbCNPJ.Visible     := True ;
    lbRG.Visible       := False;
    lbIE.Visible       := True ;
    lbNome.Visible     := False;
    lbRaz.Visible      := True ;
    lbFan.Visible      := True ;
    dbCpf.Visible      := False;
    dbCnpj.Visible     := True ;
    dbRg.Visible       := False;
    dbIE.Visible       := True ;
    dbNome.Visible     := False;
    dbRaz.Visible      := True ;
    dbFantasia.Visible := True ;
    end;
  cmbTipo.Enabled      := True ;
  dbCpf.Enabled        := True ;
  dbCnpj.Enabled       := True ;
  dbRg.Enabled         := True ;
  dbIE.Enabled         := True ;
  dbNome.Enabled       := True ;
  dbRaz.Enabled        := True ;
  dbFantasia.Enabled   := True ;
  dbEnd.Enabled        := True ;
  dbNum.Enabled        := True ;
  dbCompl.Enabled      := True ;
  dbBairro.Enabled     := True ;
  dbCep.Enabled        := True ;
  cmbLkCidade.Enabled  := True ;
  btnCadCid.Enabled    := True ;
  cmbUf.Enabled        := True ;
  dbEmail.Enabled      := True ;
  dbDataCad.Enabled    := True ;
  cmbTel1.Enabled      := True ;
  dbTel1.Enabled       := True ;
  cmbTel2.Enabled      := True ;
  dbTel2.Enabled       := True ;
  cmbTel3.Enabled      := True ;
  dbTel3.Enabled       := True ;
  dbObs.Enabled        := True ;
  dmDados.vTabStt      := False;
  cmbLkCidade.LookupSource            := dmDados.dsCidade;
  dmDados.tbEstado.Locate('EST_SIGLA', 'SP', []);
  dmDados.tbCidade.Locate('CID_CODIGO', 5217, []);
  cmbUf.Value                         := 'SP'            ;
  dmDados.tbFornecedorFOR_CEP.Value     := '11600000'    ;
  dmDados.tbFornecedorCID_CODIGO.Value  := 5217          ;
  cmbTipo.SetFocus;
end;

procedure TfrmCadFornec.btnGravarClick(Sender: TObject);
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
  if (cmbTipo.Text = 'PESSOA F�SICA') then
    begin
    if (cmbTipo.Text = '') then
      begin
      if (Length(Campos) > 0) then
        Campos := Campos + ', ';
      Campos := 'Tipo de Pessoa';
      Gravar := False ;
      Vazio  := True  ;
      end;
    if (dbNome.Text = '') then
      begin
      if (Length(Campos) > 0) then
        Campos := Campos + ', ';
      Campos := 'Nome';
      Gravar := False ;
      Vazio  := True  ;
      end;
    end
  else
    begin
    if (cmbTipo.Text = '') then
      begin
      if (Length(Campos) > 0) then
        Campos := Campos + ', ';
      Campos := 'Tipo de Pessoa';
      Gravar := False ;
      Vazio  := True  ;
      end;
    if (dbRaz.Text = '') then
      begin
      if (Length(Campos) > 0) then
        Campos := Campos + ', ';
      Campos := 'Raz�o Social';
      Gravar := False ;
      Vazio  := True  ;
      end;
    end;
  if (Gravar) then
    begin
    dmDados.tbFornecedor.Post;
    cmbLkCidade.LookupSource := dmDados.dsVisCidade;
    NovoItem            := False;
    dmDados.vTabStt     := True ;
    //Ajusta bot�es
    btnCancelar.enabled := False;
    btnGravar.Enabled   := False;
    btnNovo.Enabled     := True ;
    btnPrimeiro.Enabled := True ;
    btnAnterior.Enabled := True ;
    btnProximo.Enabled  := True ;
    btnUltimo.Enabled   := True ;
    btnAlterar.Enabled  := True ;
    btndeletar.Enabled  := True ;
    if (frmPrincipal.Acesso=1) then
     btnDeletar.Enabled := True
    else
      btnDeletar.Enabled := False;
    {habilitando os componentes}
    if (cmbTipo.Text = 'PESSOA F�SICA') then
      begin
      lbCPF.Visible      := True ;
      lbCNPJ.Visible     := False;
      lbRG.Visible       := True ;
      lbIE.Visible       := False;
      lbNome.Visible     := True ;
      lbRaz.Visible      := False;
      lbFan.Visible      := False;
      dbCpf.Visible      := True ;
      dbCnpj.Visible     := False;
      dbRg.Visible       := True ;
      dbIE.Visible       := False;
      dbNome.Visible     := True ;
      dbRaz.Visible      := False;
      dbFantasia.Visible := False;
      end
    else
      begin
      lbCPF.Visible      := False;
      lbCNPJ.Visible     := True ;
      lbRG.Visible       := False;
      lbIE.Visible       := True ;
      lbNome.Visible     := False;
      lbRaz.Visible      := True ;
      lbFan.Visible      := True ;
      dbCpf.Visible      := False;
      dbCnpj.Visible     := True ;
      dbRg.Visible       := False;
      dbIE.Visible       := True ;
      dbNome.Visible     := False;
      dbRaz.Visible      := True ;
      dbFantasia.Visible := True ;
      end;
    cmbTipo.Enabled     := False;
    dbCpf.Enabled       := False;
    dbCnpj.Enabled      := False;
    dbRg.Enabled        := False;
    dbIE.Enabled        := False;
    dbNome.Enabled      := False;
    dbRaz.Enabled       := False;
    dbFantasia.Enabled  := False;
    dbEnd.Enabled       := False;
    dbNum.Enabled       := False;
    dbCompl.Enabled     := False;
    dbBairro.Enabled    := False;
    dbCep.Enabled       := False;
    cmbLkCidade.Enabled := False;
    btnCadCid.Enabled   := False;
    cmbUf.Enabled       := False;
    dbEmail.Enabled     := False;
    dbDataCad.Enabled   := False;
    cmbTel1.Enabled     := False;
    dbTel1.Enabled      := False;
    cmbTel2.Enabled     := False;
    dbTel2.Enabled      := False;
    cmbTel3.Enabled     := False;
    dbTel3.Enabled      := False;
    dbObs.Enabled       := False;
    cmbUf.Visible       := False;
    cmbVisUF.Visible    := True ;
    dmDados.vTabStt     := True ;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    dmDados.tbFornecedor.Refresh;
    pnBotoes.SetFocus;
    end
  else
    if (Vazio) then
      begin
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      cmbTipo.Enabled := True;
      cmbTipo.SetFocus;
      end;
end;

procedure TfrmCadFornec.btnCancelarClick(Sender: TObject);
begin
  dmDados.tbFornecedor.Cancel;
  cmbLkCidade.LookupSource := dmDados.dsVisCidade;
  NovoItem            := False;
  dmDados.vTabStt     := True ;
  //Ajusta bot�es
  btnCancelar.enabled := False;
  btnGravar.Enabled   := False;
  btnNovo.Enabled     := True ;
  btnPrimeiro.Enabled := True ;
  btnAnterior.Enabled := True ;
  btnProximo.Enabled  := True ;
  btnUltimo.Enabled   := True ;
  btnAlterar.Enabled  := True ;
  btndeletar.Enabled  := True ;
  if (frmPrincipal.Acesso=1) then
    btnDeletar.Enabled := True
  else
    btnDeletar.Enabled := False;
  {habilitando os componentes}
  if (cmbTipo.Text = 'PESSOA F�SICA') then
    begin
    lbCPF.Visible      := True ;
    lbCNPJ.Visible     := False;
    lbRG.Visible       := True ;
    lbIE.Visible       := False;
    lbNome.Visible     := True ;
    lbRaz.Visible      := False;
    lbFan.Visible      := False;
    dbCpf.Visible      := True ;
    dbCnpj.Visible     := False;
    dbRg.Visible       := True ;
    dbIE.Visible       := False;
    dbNome.Visible     := True ;
    dbRaz.Visible      := False;
    dbFantasia.Visible := False;
    end
  else
    begin
    lbCPF.Visible      := False;
    lbCNPJ.Visible     := True ;
    lbRG.Visible       := False;
    lbIE.Visible       := True ;
    lbNome.Visible     := False;
    lbRaz.Visible      := True ;
    lbFan.Visible      := True ;
    dbCpf.Visible      := False;
    dbCnpj.Visible     := True ;
    dbRg.Visible       := False;
    dbIE.Visible       := True ;
    dbNome.Visible     := False;
    dbRaz.Visible      := True ;
    dbFantasia.Visible := True ;
    end;
  cmbTipo.Enabled     := False;
  dbCpf.Enabled       := False;
  dbCnpj.Enabled      := False;
  dbRg.Enabled        := False;
  dbIE.Enabled        := False;
  dbNome.Enabled      := False;
  dbRaz.Enabled       := False;
  dbFantasia.Enabled  := False;
  dbEnd.Enabled       := False;
  dbNum.Enabled       := False;
  dbCompl.Enabled     := False;
  dbBairro.Enabled    := False;
  dbCep.Enabled       := False;
  cmbLkCidade.Enabled := False;
  btnCadCid.Enabled   := False;
  cmbUf.Enabled       := False;
  dbEmail.Enabled     := False;
  dbDataCad.Enabled   := False;
  cmbTel1.Enabled     := False;
  dbTel1.Enabled      := False;
  cmbTel2.Enabled     := False;
  dbTel2.Enabled      := False;
  cmbTel3.Enabled     := False;
  dbTel3.Enabled      := False;
  dbObs.Enabled       := False;
  cmbUf.Visible       := False;
  cmbVisUF.Visible    := True ;
  dmDados.vTabStt     := True ;
  pnBotoes.SetFocus;
end;

procedure TfrmCadFornec.btnAlterarClick(Sender: TObject);
begin
  if (dmdados.tbFornecedor.RecordCount = 0) then
    MsgDlg.MsgError('Tabela vazia')
  else
    begin
    cmbLkCidade.LookupSource := dmDados.dsCidade              ;
    dmDados.tbEstado.Locate('EST_SIGLA', dmDados.tbFornecedorlkUF.Value, []);
    cmbUf.Value              := dmDados.tbFornecedorlkUF.Value;
    dmDados.tbFornecedor.Edit;
    NovoItem := True;
    cmbUf.Visible        := True ;
    cmbVisUF.Visible     := False;
    {habilitando os bot�es}
    btnCancelar.Enabled  := True ;
    btnGravar.Enabled    := True ;
    btnNovo.Enabled      := False;
    btnPrimeiro.Enabled  := False;
    btnAnterior.Enabled  := False;
    btnProximo.Enabled   := False;
    btnUltimo.Enabled    := False;
    btnAlterar.Enabled   := False;
    btndeletar.Enabled   := False;
    {habilitando os componentes}
    if (cmbTipo.Text = 'PESSOA F�SICA') then
      begin
      lbCPF.Visible      := True ;
      lbCNPJ.Visible     := False;
      lbRG.Visible       := True ;
      lbIE.Visible       := False;
      lbNome.Visible     := True ;
      lbRaz.Visible      := False;
      lbFan.Visible      := False;
      dbCpf.Visible      := True ;
      dbCnpj.Visible     := False;
      dbRg.Visible       := True ;
      dbIE.Visible       := False;
      dbNome.Visible     := True ;
      dbRaz.Visible      := False;
      dbFantasia.Visible := False;
      end
    else
      begin
      lbCPF.Visible      := False;
      lbCNPJ.Visible     := True ;
      lbRG.Visible       := False;
      lbIE.Visible       := True ;
      lbNome.Visible     := False;
      lbRaz.Visible      := True ;
      lbFan.Visible      := True ;
      dbCpf.Visible      := False;
      dbCnpj.Visible     := True ;
      dbRg.Visible       := False;
      dbIE.Visible       := True ;
      dbNome.Visible     := False;
      dbRaz.Visible      := True ;
      dbFantasia.Visible := True ;
      end;
    cmbTipo.Enabled      := True ;
    dbCpf.Enabled        := True ;
    dbCnpj.Enabled       := True ;
    dbRg.Enabled         := True ;
    dbIE.Enabled         := True ;
    dbNome.Enabled       := True ;
    dbRaz.Enabled        := True ;
    dbFantasia.Enabled   := True ;
    dbEnd.Enabled        := True ;
    dbNum.Enabled        := True ;
    dbCompl.Enabled      := True ;
    dbBairro.Enabled     := True ;
    dbCep.Enabled        := True ;
    cmbLkCidade.Enabled  := True ;
    btnCadCid.Enabled    := True ;
    cmbUf.Enabled        := True ;
    dbEmail.Enabled      := True ;
    dbDataCad.Enabled    := True ;
    cmbTel1.Enabled      := True ;
    dbTel1.Enabled       := True ;
    cmbTel2.Enabled      := True ;
    dbTel2.Enabled       := True ;
    cmbTel3.Enabled      := True ;
    dbTel3.Enabled       := True ;
    btnTel3.Enabled      := True ;
    dbObs.Enabled        := True ;
    dmDados.vTabStt      := False;
    cmbTipo.SetFocus;
    end;
end;

procedure TfrmCadFornec.btnDeletarClick(Sender: TObject);
var
  Flag : Boolean;
begin
  Flag := False;
  if (dmDados.tbFornecedor.RecordCount = 0) then
    MsgDlg.MsgError('Tabela vazia')
  else
    if MsgDlg.MsgConfirmation('Tem certeza que deseja excluir este registro?') = id_yes then
      begin
      if (Flag) then
        MsgDlg.MsgInformation('Conv�nio ativo, ou com registro de opera��es anteriores, n�o pode ser exclu�do !!!')
      else
        dmdados.tbFornecedor.Delete;
      end
    else
      dmdados.tbFornecedor.cancel;
end;

procedure TfrmCadFornec.FormActivate(Sender: TObject);
begin
  frmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [F9] Localizar [Esc] Cancelar ou Sair');
  if (frmPrincipal.Acesso=1) then
    btnDeletar.Enabled := True
  else
    btnDeletar.Enabled := False;  
end;

procedure TfrmCadFornec.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case (key) of
    // Teclas de a��o na tabela
    VK_Insert : if (dmDados.vTabStt)    then btnNovo.Click   ;
    VK_Home   : if (dmDados.vTabStt)    then btnAlterar.Click;
    VK_Delete : if ((dmDados.vTabStt) and (frmPrincipal.Acesso = 1))
                   then btnDeletar.Click;
    VK_End    : if not(dmDados.vTabStt) then btnGravar.Click ;
    VK_ESCAPE : if not(dmDados.vTabStt) then btnCancelar.Click
                else btnSair.Click;
  end;
end;

procedure TfrmCadFornec.FormShow(Sender: TObject);
begin
  dmDados.vTabStt := True;
  if (dmDados.tbFornecedor.State = dsInactive) then
    dmDados.tbFornecedor.Open;
  if (dmDados.tbPais.State     = dsInactive)   then
    dmDados.tbPais.Open;
  if (dmDados.tbEstado.State   = dsInactive)   then
    dmDados.tbEstado.Open;
  if (dmDados.tbCidade.State   = dsInactive)   then
    dmDados.tbCidade.Open;
  if (cmbTipo.Text = 'PESSOA F�SICA')          then
    begin
    lbCPF.Visible      := True ;
    lbCNPJ.Visible     := False;
    lbRG.Visible       := True ;
    lbIE.Visible       := False;
    lbNome.Visible     := True ;
    lbRaz.Visible      := False;
    lbFan.Visible      := False;
    dbCpf.Visible      := True ;
    dbCnpj.Visible     := False;
    dbRg.Visible       := True ;
    dbIE.Visible       := False;
    dbNome.Visible     := True ;
    dbRaz.Visible      := False;
    dbFantasia.Visible := False;
    end
  else
    begin
    lbCPF.Visible      := False;
    lbCNPJ.Visible     := True ;
    lbRG.Visible       := False;
    lbIE.Visible       := True ;
    lbNome.Visible     := False;
    lbRaz.Visible      := True ;
    lbFan.Visible      := True ;
    dbCpf.Visible      := False;
    dbCnpj.Visible     := True ;
    dbRg.Visible       := False;
    dbIE.Visible       := True ;
    dbNome.Visible     := False;
    dbRaz.Visible      := True ;
    dbFantasia.Visible := True ;
    end;
end;

procedure TfrmCadFornec.cmbTipoChange(Sender: TObject);
begin
  if (cmbTipo.Text = 'PESSOA F�SICA') then
    begin
    lbCPF.Visible      := True ;
    lbCNPJ.Visible     := False;
    lbRG.Visible       := True ;
    lbIE.Visible       := False;
    lbNome.Visible     := True ;
    lbRaz.Visible      := False;
    lbFan.Visible      := False;
    dbCpf.Visible      := True ;
    dbCnpj.Visible     := False;
    dbRg.Visible       := True ;
    dbIE.Visible       := False;
    dbNome.Visible     := True ;
    dbRaz.Visible      := False;
    dbFantasia.Visible := False;
    end
  else
    begin
    lbCPF.Visible      := False;
    lbCNPJ.Visible     := True ;
    lbRG.Visible       := False;
    lbIE.Visible       := True ;
    lbNome.Visible     := False;
    lbRaz.Visible      := True ;
    lbFan.Visible      := True ;
    dbCpf.Visible      := False;
    dbCnpj.Visible     := True ;
    dbRg.Visible       := False;
    dbIE.Visible       := True ;
    dbNome.Visible     := False;
    dbRaz.Visible      := True ;
    dbFantasia.Visible := True ;
    end;
end;

procedure TfrmCadFornec.cmbTipoExit(Sender: TObject);
begin
  if (cmbTipo.Text = '') then
    begin
    MsgDlg.MsgError('� necess�rio o TIPODE PESSOA');
    cmbTipo.SetFocus;
    end;
end;

end.
