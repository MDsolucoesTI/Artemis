//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Ultima modificacao: 03/2007
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EMsgDlg, JvComponent, JvEnterTab, fcLabel, ExtCtrls, fcpanel,
  fcButton, fcImgBtn, StdCtrls, RxDBComb, DBCtrls, RxLookup, lmdstdcA,
  CurrEdit, RXDBCtrl, Mask, ToolEdit, JvPanel, JvTransparentPanel, RXCtrls,
  JvTransBtn, DB;

type
  TfrmCPagar = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    pnCentro: TfcPanel;
    pnDet: TfcPanel;
    RxLabel9: TRxLabel;
    RxLabel7: TRxLabel;
    RxLabel6: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel18: TRxLabel;
    RxLabel17: TRxLabel;
    RxLabel16: TRxLabel;
    RxLabel15: TRxLabel;
    RxLabel14: TRxLabel;
    RxLabel13: TRxLabel;
    RxLabel12: TRxLabel;
    RxLabel11: TRxLabel;
    RxLabel10: TRxLabel;
    JvTransparentPanel1: TJvTransparentPanel;
    dbVenc: TDBDateEdit;
    dbValor: TRxDBCalcEdit;
    dbSituacao: TDBEdit;
    dbPagamento: TDBText;
    cmblkTipoDoc: TRxDBLookupCombo;
    cmblkHist: TRxDBLookupCombo;
    cmblkFor: TRxDBLookupCombo;
    cmblkBanco: TDBLookupComboBox;
    dbIntervalo: TEdit;
    dbNumDoc: TDBEdit;
    dbEmissao: TDBDateEdit;
    cmbPortador: TRxDBComboBox;
    pnBotoes: TfcPanel;
    dbVlPago: TRxDBCalcEdit;
    RxLabel4: TRxLabel;
    RxLabel8: TRxLabel;
    dbDtPgto: TDBDateEdit;
    RxLabel1: TRxLabel;
    dbDesc: TRxDBCalcEdit;
    RxLabel2: TRxLabel;
    dbJuros: TRxDBCalcEdit;
    RxLabel3: TRxLabel;
    JvTransparentPanel2: TJvTransparentPanel;
    btnSim: TfcImageBtn;
    btnNao: TfcImageBtn;
    btnPrimeiro: TJvTransparentButton;
    btnAnterior: TJvTransparentButton;
    btnProximo: TJvTransparentButton;
    btnUltimo: TJvTransparentButton;
    btnNovo: TJvTransparentButton;
    btnGravar: TJvTransparentButton;
    btnCancelar: TJvTransparentButton;
    btnAlterar: TJvTransparentButton;
    btnDeletar: TJvTransparentButton;
    btnLocalizar: TJvTransparentButton;
    btnPagar: TJvTransparentButton;
    btnRestaurar: TJvTransparentButton;
    btnSair: TJvTransparentButton;
    dbParcela: TLMDSpinEdit;
    btnCadTipo: TfcImageBtn;
    dbComplHist: TDBEdit;
    MsgDlg: TEvMsgDlg;
    function GeraData(iData:TdateTime;iDias:integer):TDateTime;
    procedure btnSairClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbParcelaExit(Sender: TObject);
    procedure cmbPortadorExit(Sender: TObject);
    procedure dbValorExit(Sender: TObject);
    procedure dbDtPgtoExit(Sender: TObject);
    procedure dbDescExit(Sender: TObject);
    procedure dbJurosExit(Sender: TObject);
    procedure btnSimClick(Sender: TObject);
    procedure btnNaoClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnPagarClick(Sender: TObject);
    procedure btnRestaurarClick(Sender: TObject);
    procedure dbParcelaChange(Sender: TObject);
    procedure dbEmissaoExit(Sender: TObject);
    procedure btnCadTipoClick(Sender: TObject);
    procedure cmbPortadorChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCPagar: TfrmCPagar;
  NovoItem : Boolean   ;

implementation

uses untLocCPagar, untdmDados, untPrincipal, untTipoPagto, untCadTipoDoc;

{$R *.dfm}

function TFrmCPagar.GeraData(iData:TdateTime;iDias:integer):TDateTime;
var
  vVenc,vDia,vMes,vAno:Word;
  iDia,iMes,iAno:string;
  x:integer;
begin
  decodedate(iData,vAno,vMes,vDia);
  vVenc:=vDia;
  if iDias >= 30 then
    begin
    for x:=1 to (iDias div 30) do
      begin
      vMes:=vMes+1;
      if vMes=13 then
        begin
        vAno:=vAno+1;
        vMes:=1;
        end;
      end;
    if ((vDia<=31)and(vDia>=29))and(vMes=2) then
      begin
      if (vAno mod 4)=0 then
        vDia:=29
      else
        vDia:=28;
      end;
    if (vDia=31)and((vMes=4)or(vMes=6)or(vMes=9)or(vMes=11)) then
      vDia:=30;
    if vDia < vVenc then
      if vMes <> 2 then
        if (vMes=4)or(vMes=6)or(vMes=9)or(vMes=11) then
          if vVenc=31 Then
            vDia:=30
          else
            vDia:=vVenc
        else
          vDia:=vVenc;
    iDia:=IntToStr(vDia);
    iMes:=IntToStr(vMes);
    iAno:=IntToStr(vAno);
    GeraData:=StrToDate(iDia+'/'+iMes+'/'+iAno);
    end
  else
    GeraData:=iData+iDias;
end;

procedure TfrmCPagar.btnSairClick(Sender: TObject);
begin
  if (dmdados.tbCPagar.State=dsInsert) or (dmdados.tbCPagar.State=dsEdit) then
    dmdados.tbCPagar.Cancel;
  Close;
end;

procedure TfrmCPagar.btnLocalizarClick(Sender: TObject);
begin
  FrmLocCpagar:=TFrmLocCpagar.Create(Application);
  FrmLocCpagar.ShowModal;
  FrmLocCpagar.Free;
end;

procedure TfrmCPagar.FormActivate(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [F2] Tipo Doc [F3] Pagto [F4] Restaurar [Del] Excluir [Esc] Cancelar ou Sair');
    dmDados.vTabStt := True;
  if (dmDados.tbCPagar.State     = dsInactive)  then
    dmDados.tbCPagar.Open;
  if (dmDados.tbTipoDoc.State    = dsInactive)  then
    dmDados.tbTipoDoc.Open;
  if (dmDados.tbFornecedor.State = dsInactive)  then
    dmDados.tbFornecedor.Open;
  if (dmDados.tbBanco.State      = dsInactive)  then
    dmDados.tbBanco.Open;
  if (dmDados.tbCheque.State     = dsInactive)  then
    dmDados.tbCheque.Open;
  if (dmDados.TbMovConta.State   = dsInactive)  then
    dmDados.TbMovConta.Open;
  if (dmDados.TbCCorrente.State  = dsInactive)  then
    dmDados.TbCCorrente.Open;
  if (dmDados.tbChequePro.State  = dsInactive)  then
    dmDados.tbChequePro.Open;
  if (dmDados.tbCartao.State  = dsInactive)  then
    dmDados.tbCartao.Open;
  NovoItem := False;
  if dmdados.TbCpagar.RecordCount=0 then
    begin
    Btnprimeiro.Enabled := False;
    BtnAnterior.Enabled := False;
    BtnProximo.Enabled  := False;
    BtnUltimo.Enabled   := False;
    btnGravar.Enabled   := False;
    btnAlterar.Enabled  := False;
    btnCancelar.Enabled := False;
    btnDeletar.Enabled  := False;
    end;
  if (frmPrincipal.Acesso=1) then
    btnDeletar.Enabled := True
  else
    btnDeletar.Enabled := False;
end;

procedure TfrmCPagar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmdados.tbCPagar.Close;
  dmDados.tbTipoDoc.Close;
  dmdados.tbFornecedor.Close;
  dmDados.tbCheque.Close;
  dmdados.tbBanco.Close;
  dmdados.TbMovConta.Close;
  dmDados.TbCCorrente.Close;
  dmDados.tbChequePro.Close;
  dmDados.tbCartao.Close;
  FrmPrincipal.StatusTeclas(False,'');
  Action := Cafree;
end;

procedure TfrmCPagar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case (key) of
    // Teclas de a��o na tabela
    VK_Insert : if (dmDados.vTabStt) then BtnNovo.Click;
    VK_Home   : if (dmDados.vTabStt) then BtnAlterar.Click;
    VK_Delete : if ((dmDados.vTabStt) and (frmPrincipal.Acesso = 1))
                 then btnDeletar.Click;
    VK_End    : if not(dmDados.vTabStt) then btnGravar.Click;
    VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                else BtnSair.Click;
    VK_F2     : btnCadTipo.Click;
    VK_F3     : btnPagar.Click;
    VK_F4     : btnRestaurar.Click;
  end;
end;

procedure TfrmCPagar.dbParcelaExit(Sender: TObject);
begin
  if dbParcela.Value > 1 then
    begin
    dbIntervalo.Enabled := True;
    dbIntervalo.SetFocus;
    end
  else
    begin
    dbIntervalo.Enabled := False;
    dbEmissao.SetFocus;
    end;
end;

procedure TfrmCPagar.cmbPortadorExit(Sender: TObject);
begin
  if cmbPortador.Text='Cobran�a Banc�ria' then
    cmblkBanco.Enabled := True
  else
    cmblkBanco.Enabled := False;
end;

procedure TfrmCPagar.dbValorExit(Sender: TObject);
begin
  if NovoItem then
    if dbvalor.Text= '' then
      begin
      MsgDlg.MsgError('� obrigat�rio o Valor do documento');
      dbvalor.SetFocus;
      end;
  PnBotoes.SetFocus;
end;

procedure TfrmCPagar.dbDtPgtoExit(Sender: TObject);
begin
  if  (dbDtPgto.text ='  / /   ') then
    begin
    MsgDlg.MsgWarning('Data Vazia');
    dbDtPgto.SetFocus;
    end
  else
    try StrToDate(dbDtPgto.text)
    except on EConvertError do
      begin
      MsgDlg.MsgError('Data Inv�lida');
      dbDtPgto.SetFocus;
      end;
    end;
end;

procedure TfrmCPagar.dbDescExit(Sender: TObject);
begin
  if NovoItem then
    if (dbDesc.Value > 0) then
      begin
      dmDados.tbCPagarValorPago.Value := dmDados.tbCPagarValor.Value - dbDesc.Value;
      pnBotoes.SetFocus;
      end;
end;

procedure TfrmCPagar.dbJurosExit(Sender: TObject);
begin
  if NovoItem then
    dmDados.tbCPagarValorPago.Value := dmDados.tbCPagarValor.Value + dbJuros.Value;
  pnBotoes.SetFocus;
end;

procedure TfrmCPagar.btnSimClick(Sender: TObject);
begin
  FrmTipoPgto:=TFrmTipoPgto.create(application);
  FrmTipoPgto.showmodal;
  if frmTipoPgto.PagoStt = 'S' then
    begin
    FrmTipoPgto.Free;
    NovoItem := False;
    dmdados.vTabStt := True;
    dmDados.tbCPagarPago.Value :='PAGO';
    dmDados.tbCPagarTipoPago.Value :='Pagamento Total';
    dmdados.tbCPagar.Post;
    BtnGravar.enabled    := False;
    BtnCancelar.Enabled  := False;
    BtnNovo.Enabled      := True ;
    BtnPrimeiro.Enabled  := True ;
    BtnAnterior.Enabled  := True ;
    Btnproximo.Enabled   := True ;
    BtnUltimo.Enabled    := True ;
    BtnAlterar.Enabled   := True ;
    BtnDeletar.Enabled   := True ;
    btnLocalizar.Enabled := True ;
    btnPagar.Enabled     := True ;
    btnRestaurar.Enabled := True ;
    btnSim.Enabled       := False;
    btnNao.Enabled       := False;
    {desabilitando os objetos}
    dbDtPgto.Enabled := False;
    dbDesc.Enabled   := False;
    dbJuros.Enabled  := False;
    dbVlPago.Enabled := False;
    pnBotoes.SetFocus;
    end
  else
    begin
    FrmTipoPgto.Free;
    btnNao.Click;
    end;
end;

procedure TfrmCPagar.btnNaoClick(Sender: TObject);
begin
  NovoItem        := False;
  dmdados.vTabStt := True ;
  dmdados.tbCPagar.cancel;
  BtnGravar.Enabled    := False;
  BtnCancelar.Enabled  := False;
  BtnNovo.Enabled      := True ;
  BtnPrimeiro.Enabled  := True ;
  BtnAnterior.Enabled  := True ;
  Btnproximo.Enabled   := True ;
  BtnUltimo.Enabled    := True ;
  BtnAlterar.Enabled   := True ;
  BtnDeletar.Enabled   := True ;
  btnLocalizar.Enabled := True ;
  btnPagar.Enabled     := True ;
  btnRestaurar.Enabled := True ;
  btnSim.Enabled       := False;
  btnNao.Enabled       := False;
  {desabilitando os objetos}
  dbDtPgto.Enabled := False;
  dbDesc.Enabled   := False;
  dbJuros.Enabled  := False;
  dbVlPago.Enabled := False;
  pnBotoes.SetFocus;
end;

procedure TfrmCPagar.btnPrimeiroClick(Sender: TObject);
begin
  dmdados.tbCpagar.First;
  btnPrimeiro.Enabled := False;
  btnAnterior.Enabled := False;
  btnProximo.Enabled  := True ;
  btnUltimo.Enabled   := True ;
end;

procedure TfrmCPagar.btnAnteriorClick(Sender: TObject);
begin
  dmdados.tbCpagar.Prior;
  btnProximo.Enabled := True;
  btnUltimo.Enabled  := True;
  if dmdados.tbCpagar.bof then
    begin
    btnPrimeiro.Enabled := False;
    btnAnterior.Enabled := False;
    end;
end;

procedure TfrmCPagar.btnProximoClick(Sender: TObject);
begin
  dmdados.tbCpagar.next;
  btnPrimeiro.Enabled := True;
  btnAnterior.Enabled := True;
  if dmdados.tbCpagar.Eof then
    begin
    btnProximo.Enabled := False;
    btnUltimo.Enabled  := False;
    end;
end;

procedure TfrmCPagar.btnUltimoClick(Sender: TObject);
begin
  dmdados.tbCpagar.Last;
  btnPrimeiro.Enabled := True ;
  btnAnterior.Enabled := True ;
  btnProximo.Enabled  := False;
  btnUltimo.Enabled   := False;
end;

procedure TfrmCPagar.btnNovoClick(Sender: TObject);
begin
  novoItem       := True ;
  dmdados.vTabStt:= False;
  dmdados.tbCpagar.Append;
  {habilitando os bot�es}
  BtnGravar.Enabled   := True ; 
  BtnCancelar.Enabled := True ;
  BtnNovo.Enabled     := False;
  BtnPrimeiro.Enabled := False;
  BtnAnterior.Enabled := False;
  BtnProximo.Enabled  := False;
  BtnUltimo.Enabled   := False;
  BtnAlterar.Enabled  := False;
  BtnDeletar.Enabled  := False;
  {habilitando os componentes}
  dbNumDoc.Enabled     := True;
  cmblkTipoDoc.Enabled := True;
  cmblkFor.Enabled     := True;
  cmblkHist.Enabled    := True;
  dbComplHist.Enabled  := True;
  dbEmissao.Enabled    := True;
  dbVenc.Enabled       := True;
  dbvalor.Enabled      := True;
  dbParcela.Enabled    := True;
  dbIntervalo.Enabled  := True;
  cmbPortador.Enabled  := True;
  cmblkBanco.Enabled   := True;
  btnCadTipo.Enabled   := True;
  {desativar radio group}
  dbNumDoc.SetFocus;
end;

procedure TfrmCPagar.btnGravarClick(Sender: TObject);
var
  Campos    : String   ;
  NumDoc    : String   ;
  CodDoc    : String   ;
  CodHist   : String   ;
  CompHist  : String   ;
  CodcCusto : String   ;
  Portador  : String   ;
  NumBanco  : string   ;
  CodFor    : Integer  ;
  c         : Integer  ;
  f         : Integer  ;
  I         : Integer  ;
  DataEmis  : TDateTime;
  DataVenc  : TDateTime;
  Valor     : Real     ;
  Vazio     : Boolean  ;
  Gravar    : Boolean  ;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  if dbNumDoc.Text= '' then
    begin
    if Length(Campos)>0 then Campos:=Campos+', ';
    Campos:=Campos+'N�Doc';
    Gravar:=False;
    Vazio:=True;
    end;
  if dbEmissao.Text= '  /  /    ' then
    begin
    if Length(Campos)>0 then Campos:=Campos+', ';
    Campos:=Campos+'Emissao';
    Gravar:=False;
    Vazio:=True;
    end
  else
    try StrToDate(dbEmissao.text)
    except on EConvertError do
      begin
      MsgDlg.MsgError('Data de Emiss�o Inv�lida');
      gravar:= false;
      end;
    end;
  if dbVenc.Text= '  /  /    ' then
    begin
    if Length(Campos)>0 then Campos:=Campos+', ';
    Campos:=Campos+'Vencimento';
    Gravar:=False;
    Vazio:=True;
    end
  else
    try StrToDate(dbVenc.text)
    except on EConvertError do
      begin
      MsgDlg.MsgError('Data de Vencimento Inv�lida');
      gravar:= false;
      end;
    end;
  if dbValor.Text= '' then
    begin
    if dbvalor.value=0 then Campos:=Campos+', ';
    Campos:=Campos+'Valor(R$)';
    Gravar:=False;
    Vazio:=True;
    end;
  if Gravar then
    begin
    novoItem:=false;
    dmdados.vTabStt:= True;
    if dbParcela.Value > 1 then
      begin
      c:=1;
      f:=dbParcela.Value;
      I:=StrToInt(dbIntervalo.Text);
      CompHist:=dbComplHist.Text;
      dmdados.tbCPagarPago.Value:='ABERTO';
      dmDados.tbCPagarCompHist.Value:=IntToStr(c)+'/'+IntToStr(f)+' - '+dbcomplhist.Text;
      dmdados.tbCPagar.Post;
      NumDoc   :=dmDados.tbCPagarNumDoc.Value    ;
      CodDoc   :=dmDados.tbCPagarCodDoc.Value    ;
      CodFor   :=dmDados.tbCPagarCodFor.Value    ;
      DataEmis :=dmDados.tbCPagarDataEmis.Value  ;
      DataVenc :=dmDados.tbCPagarDataVenc.Value  ;
      CodHist  :=dmDados.tbCPagarCodHist.Value   ;
      Valor    :=dmDados.tbCPagarValor.Value     ;
      CodCCusto:=dmDados.tbCPagarCodCCusto.Value ;
      Portador :=dmDados.tbCPagarPortador.Value  ;
      NumBanco :=dmDados.tbCPagarNumBanco.Value  ;
      for c:=2 to f do
        begin
        dmDados.tbCPagar.Append;
        dmdados.tbCPagarPago.Value :='ABERTO';
        dmDados.tbCPagarCompHist.Value  := IntToStr(c)+'/'+IntToStr(f)+' - '+CompHist;
        dmDados.tbCPagarNumDoc.Value    := NumDoc;
        dmDados.tbCPagarCodDoc.Value    := CodDoc;
        dmDados.tbCPagarCodFor.Value    := CodFor;
        dmDados.tbCPagarDataEmis.Value  := DataEmis;
        dmDados.tbCPagarDataVenc.Value  := GeraData(DataVenc,(I*(c-1)));
        dmDados.tbCPagarCodHist.Value   := CodHist;
        dmDados.tbCPagarValor.Value     := Valor;
        dmDados.tbCPagarCodCCusto.Value := CodCCusto;
        dmDados.tbCPagarPortador.Value  := Portador;
        dmDados.tbCPagarNumBanco.Value  := NumBanco;
        dmDados.tbCPagar.Post;
        end;
      end
    else
      begin
      dmdados.tbCPagarPago.Value:='ABERTO';
      dmdados.tbCPagar.Post;
      end;
    BtnGravar.Enabled   := False;
    BtnCancelar.Enabled := False;
    BtnNovo.Enabled     := True ;
    BtnPrimeiro.Enabled := True ;
    BtnAnterior.Enabled := True ;
    BtnProximo.Enabled  := True ;
    BtnUltimo.Enabled   := True ;
    BtnAlterar.Enabled  := True ;
    Btndeletar.Enabled  := True ;
    if (frmPrincipal.Acesso=1) then
     btnDeletar.Enabled := True
    else
     btnDeletar.Enabled := False;
    {desabilitando os componentes}
    dbParcela.Enabled    := False;
    dbIntervalo.Enabled  := False;
    cmbPortador.Enabled  := False;
    cmblkBanco.Enabled   := False;
    cmblkTipoDoc.Enabled := False;
    cmblkFor.Enabled     := False;
    cmblkHist.Enabled    := False;
    dbComplHist.Enabled  := False;
    dbEmissao.Enabled    := False;
    dbVenc.Enabled       := False;
    dbvalor.Enabled      := False;
    dbNumDoc.Enabled     := False;
    btnCadTipo.Enabled   := False;
    MsgDlg.MsgInformation('Dados gravados com sucesso');
    end
  else
    begin
    if Vazio then
      begin
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      DbNumDoc.SetFocus;
      end;
    end;
end;

procedure TfrmCPagar.btnCancelarClick(Sender: TObject);
begin
  novoItem       := False;
  dmdados.vTabStt:= True ;
  dmdados.tbCpagar.cancel;
  BtnGravar.Enabled   := False;
  BtnCancelar.Enabled := False;
  BtnNovo.Enabled     := True ;
  BtnPrimeiro.Enabled := True ;
  BtnAnterior.Enabled := True ;
  Btnproximo.Enabled  := True ;
  BtnUltimo.Enabled   := True ;
  BtnAlterar.Enabled  := True ;
  BtnDeletar.Enabled  := True ;
  if (frmPrincipal.Acesso=1) then
    btnDeletar.Enabled := True
  else
    btnDeletar.Enabled := False;
  {desabilitando os objetos}
  dbParcela.Enabled    := False;
  dbIntervalo.Enabled  := False;
  cmbPortador.Enabled  := False;
  cmblkBanco.Enabled   := False;
  cmblkTipoDoc.Enabled := False;
  cmblkFor.Enabled     := False;
  cmblkHist.Enabled    := False;
  dbComplHist.Enabled  := False;
  dbEmissao.Enabled    := False;
  dbVenc.Enabled       := False;
  dbvalor.Enabled      := False;
  dbNumDoc.Enabled     := False;
  btnCadTipo.Enabled   := False;
  pnBotoes.SetFocus;
end;

procedure TfrmCPagar.btnAlterarClick(Sender: TObject);
begin
  if dmdados.tbCpagar.RecordCount=0 then
    MsgDlg.MsgInformation('Tabela sem registro')
  else
    begin
    novoItem        := True ;
    dmdados.vTabStt := False;
    dmdados.tbCpagar.Edit;
    BtnCancelar.Enabled := True ;
    BtnGravar.Enabled   := True ;
    BtnNovo.Enabled     := False;
    BtnPrimeiro.Enabled := False;
    BtnAnterior.Enabled := False;
    BtnProximo.Enabled  := False;
    BtnUltimo.Enabled   := False;
    BtnAlterar.Enabled  := False;
    Btndeletar.Enabled  := False;
    {habilitando os objetos}
    dbNumDoc.Enabled     := True;
    cmblkTipoDoc.Enabled := True;
    cmblkFor.Enabled     := True;
    cmblkHist.Enabled    := True;
    dbComplHist.Enabled  := True;
    dbParcela.Enabled    := True;
    cmbPortador.Enabled  := True;
    btnCadTipo.Enabled   := True;    
    //dbLookBanc.Enabled:=True;
    dbEmissao.Enabled := True;
    dbVenc.Enabled    := True;
    dbvalor.Enabled   := True;
    dbNumDoc.SetFocus;
    end;
end;

procedure TfrmCPagar.btnDeletarClick(Sender: TObject);
begin
  NovoItem        := False;
  dmdados.vTabStt := True ;
  if dmdados.tbCpagar.RecordCount=0 then
    MsgDlg.MsgInformation('Tabela sem registro')
  else
   if MsgDlg.MsgConfirmation('Tem certeza que deseja exluir esse registro?') = id_yes then
      dmdados.tbCpagar.Delete;
end;

procedure TfrmCPagar.btnPagarClick(Sender: TObject);
begin
  if dmdados.tbCPagarPago.value='PAGO' then
    MsgDlg.MsgInformation('T�tulo j� est� PAGO')
  else
    begin
    dmdados.tbCPagar.Edit;
    NovoItem := True;
    {habilitando os bot�es}
    BtnGravar.Enabled    := False;
    BtnCancelar.Enabled  := False;
    BtnNovo.Enabled      := False;
    BtnPrimeiro.Enabled  := False;
    BtnAnterior.Enabled  := False;
    BtnProximo.Enabled   := False;
    BtnUltimo.Enabled    := False;
    BtnAlterar.Enabled   := False;
    BtnDeletar.Enabled   := False;
    btnLocalizar.Enabled := False;
    btnPagar.Enabled     := False;
    btnRestaurar.Enabled := False;
    btnSim.Enabled       := True ;
    btnNao.Enabled       := True ;
    {habilitando os componentes}
    dbDtPgto.Enabled := True;
    dbDesc.Enabled   := True;
    dbJuros.Enabled  := True;
    dbVlPago.Enabled := True;
    dbDtPgto.SetFocus;
    end;
end;

procedure TfrmCPagar.btnRestaurarClick(Sender: TObject);
var
  ano,mes,dia : word;
  mesCusto,anoCusto,Conta,Custo : string;
begin
  if dmdados.tbCPagarPago.Value='ABERTO' then
    MsgDlg.MsgInformation('T�tulo j� est� ABERTO')
  else
    if (dmdados.tbCPagarPago.Value='PAGO') then
      If MsgDlg.MsgConfirmation('T�tulo est� em PAGO, voc� quer mesmo RESTAURAR?') = id_yes then
        begin
        if dmdados.TbMovConta.Locate('CodDoc;DataMov',VarArrayOf([dmDados.tbCPagarCodDoc.Value,dmDados.tbCPagarDataVenc.Value]),[]) then
          Conta:=dmDados.TbMovContaConta.Value
        else
          Conta:='000000000000001';
        {inserir inf de estorno no movimento de conta}
        dmdados.TbMovConta.Append;
        dmdados.TbMovContaDosNumero.Value:=dmdados.tbCPagarNumDoc.Value;
        dmdados.TbMovContaConta.Value     := Conta;
        dmdados.TbMovContaDataMov.Value   := date;
        dmdados.tbMovContaDataReg.value   := date;
        dmdados.TbMovContaHoraReg.Value   := time;
        dmdados.TbMovContaTipoOper.Value  := 'E';
        dmdados.TbMovContaCodHist.Value   := dmdados.tbCPagarCodHist.Value;
        dmdados.TbMovContaCodDoc.Value    := dmdados.tbCPagarCodDoc.Value;
        dmdados.TbMovContaComplHist.Value := 'Estorno do Pagamento';
        dmdados.TbMovContaValor.Value     := dmdados.tbCPagarValorPago.Value;
        dmdados.TbMovConta.Post;
        {atualizar conta corrente}
        if dmdados.TbCCorrente.Locate('Conta',Conta,[]) then
          begin
          dmdados.TbCCorrente.Edit;
          dmdados.TbCCorrenteSaldo.Value:=dmDados.TbCCorrenteSaldo.Value+dmdados.tbCPagarValorPago.Value;
          dmdados.tbccorrenteUltMov.value:=date;
          dmdados.TbCCorrente.post;
          end;
        dmdados.tbCPagar.Edit;
        dmdados.tbCPagarDataPaga.Clear;
        dmdados.tbCPagarValorPago.Clear;
        dmDados.tbCPagarDescPago.Clear;
        dmDados.tbCPagarMuJuPago.Clear;
        dmdados.tbCPagarPago.Value := 'ABERTO';
        dmDados.tbCPagarTipoPago.Value :='';
        dmdados.tbCPagar.Post;
        end;
end;

procedure TfrmCPagar.dbParcelaChange(Sender: TObject);
begin
  if dbParcela.Value > 1 then
    dbIntervalo.Enabled:=True
  else
    dbIntervalo.Enabled:=False;
end;

procedure TfrmCPagar.dbEmissaoExit(Sender: TObject);
begin
  if NovoItem then
    if dbemissao.Text= '  /  /    ' then
      begin
      MsgDlg.MsgError('� obrigat�rio a Data de Emiss�o');
      dbEmissao.SetFocus;
      end;
end;

procedure TfrmCPagar.btnCadTipoClick(Sender: TObject);
begin
  frmCadTipoDoc:=TfrmCadTipoDoc.create(application);
  frmCadTipoDoc.Show;
end;

procedure TfrmCPagar.cmbPortadorChange(Sender: TObject);
begin
  if cmbPortador.Text='Cobran�a Banc�ria' then
    cmblkBanco.Enabled := True
  else
    cmblkBanco.Enabled := False;
end;

end.
