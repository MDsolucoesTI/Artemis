//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Ultima modificacao: 03/2007
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit unitCreceber;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  SpeedBar, jpeg, ExtCtrls, fcButton, fcImgBtn, ToolWin, ComCtrls, RXCtrls,
  RXSplit, StdCtrls, DBCtrls, Mask, ToolEdit, RXDBCtrl, CurrEdit, SRColBtn,
  TFlatCheckBoxUnit, Spin, RackCtls, RxLookup, TFlatHintUnit,db, Variants,
  LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint, LMDShapeHint,
  RxGrdCpt, fcImager, TFlatSplitterUnit, lmdstdcA, RxDBComb, EMsgDlg,
  fcLabel, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel, JvComponent, JvTransBtn, JvPanel,
  JvTransparentPanel, JvEnterTab, JvMaskEdit, JvSpin;

type
  TfrmCReceber = class(TForm)
    LMDBackPanel2: TLMDBackPanel;
    fcLabel1: TfcLabel;
    LMDBackPanel1: TLMDBackPanel;
    dbeNumDoc: TDBEdit;
    dblookTipo: TRxDBLookupCombo;
    dblookCli: TRxDBLookupCombo;
    dblookhist: TRxDBLookupCombo;
    dbemissao: TDBDateEdit;
    dbvenc: TDBDateEdit;
    dbvalor: TRxDBCalcEdit;
    dbSituacao: TDBEdit;
    dbLookBanc: TDBLookupComboBox;
    cmbPortador: TRxDBComboBox;
    dbIntervalo: TEdit;
    RxLabel5: TRxLabel;
    RxLabel1: TRxLabel;
    RxLabel7: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel16: TRxLabel;
    RxLabel19: TRxLabel;
    RxLabel20: TRxLabel;
    RxLabel21: TRxLabel;
    RxLabel22: TRxLabel;
    RxLabel23: TRxLabel;
    RxLabel24: TRxLabel;
    RxLabel25: TRxLabel;
    dbRecebimento: TDBText;
    LMDBackPanel4: TLMDBackPanel;
    RxLabel10: TRxLabel;
    RxLabel8: TRxLabel;
    dbDtReceb: TDBDateEdit;
    RxLabel4: TRxLabel;
    dbDesc: TRxDBCalcEdit;
    RxLabel6: TRxLabel;
    dbJuros: TRxDBCalcEdit;
    RxLabel9: TRxLabel;
    dbVlReceb: TRxDBCalcEdit;
    btnSim: TfcImageBtn;
    btnNao: TfcImageBtn;
    LMDBackPanel3: TLMDBackPanel;
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
    rbValor: TRadioButton;
    rbPerc: TRadioButton;
    RxLabel11: TRxLabel;
    RxLabel12: TRxLabel;
    RxLabel14: TRxLabel;
    RxLabel13: TRxLabel;
    RxLabel15: TRxLabel;
    RxLabel17: TRxLabel;
    RxLabel31: TRxLabel;
    dbdiadesc: TDBDateEdit;
    dbeperc: TDBEdit;
    dbevalordesc: TDBEdit;
    Bevel1: TBevel;
    dbdiamulta: TDBDateEdit;
    dbepercmulta: TDBEdit;
    dbevalormulta: TDBEdit;
    dbdiajuros: TDBDateEdit;
    dbepercjuros: TDBEdit;
    dbevalorjuros: TDBEdit;
    RxLabel26: TRxLabel;
    RxLabel27: TRxLabel;
    RxLabel28: TRxLabel;
    RxLabel29: TRxLabel;
    RxLabel30: TRxLabel;
    RxLabel32: TRxLabel;
    RxLabel33: TRxLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    btnLocCli: TfcImageBtn;
    JvTransparentPanel1: TJvTransparentPanel;
    JvTransparentPanel2: TJvTransparentPanel;
    RxLabel18: TRxLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    MsgDlg: TEvMsgDlg;
    dbComplHist: TDBEdit;
    dbParcela: TLMDSpinEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeNumDocExit(Sender: TObject);
    procedure dbemissaoExit(Sender: TObject);
    procedure dbvalorExit(Sender: TObject);
    procedure dbvencExit(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbValorClick(Sender: TObject);
    procedure rbPercClick(Sender: TObject);
    procedure dbdiadescExit(Sender: TObject);
    procedure dbdiamultaExit(Sender: TObject);
    procedure dbdiajurosExit(Sender: TObject);
    procedure btnSimClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnPagarClick(Sender: TObject);
    procedure btnRestaurarClick(Sender: TObject);
    function GeraData(iData:TdateTime;iDias:integer):TDateTime;
    procedure cmbPortadorExit(Sender: TObject);
    procedure cmbPortadorChange(Sender: TObject);
    procedure btnNaoClick(Sender: TObject);
    procedure dbDtRecebExit(Sender: TObject);
    procedure dbDescExit(Sender: TObject);
    procedure dbJurosExit(Sender: TObject);
    procedure btnlocCliClick(Sender: TObject);
    procedure btnLocDocClick(Sender: TObject);
    procedure dbParcelaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCReceber : TfrmCReceber;
  NovoItem    : Boolean     ;

implementation

uses UnitLocCR, UntDmdados,UnitLocTipoDoc, UntLocPac,
     untPrincipal, UnitTipoReceb;

{$R *.DFM}

function TfrmCReceber.GeraData(iData:TdateTime;iDias:integer):TDateTime;
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

procedure TfrmCReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmPrincipal.statusteclas(False,'');
  dmDados.tbCReceber.Close;
  dmDados.tbHistorico.Close;
  dmDados.tbCheque.Close;
  dmdados.TbMovConta.Close;
  dmDados.TbCCorrente.Close;
  dmDados.tbTipoDoc.Close;
  dmDados.tbPaciente.Close;
  dmDados.tbBanco.Close;
  Action:= Cafree;
end;

procedure TfrmCReceber.dbeNumDocExit(Sender: TObject);
begin
  if NovoItem then
    if dbeNumDoc.Text='' then
      begin
      MsgDlg.MsgError('Necess�rio informar o N�mero do Documento');
      dbeNumDoc.SetFocus;
      end;
end;

procedure TfrmCReceber.dbemissaoExit(Sender: TObject);
begin
  if NovoItem then
    if dbemissao.Text= '  /  /    ' then
      begin
      MsgDlg.MsgError('� obrigat�rio a Data de Emiss�o');
      dbEmissao.SetFocus;
      end;
end;

procedure TfrmCReceber.dbvalorExit(Sender: TObject);
begin
  if NovoItem then
    if dbvalor.Text= '' then
      begin
      MsgDlg.MsgError('� obrigat�rio o Valor do documento');
      dbvalor.SetFocus;
      end;
end;

procedure TfrmCReceber.dbvencExit(Sender: TObject);
var
  diasDesc : LongInt;
  diasMulta : LongInt;
  diasJuros : LongInt;
begin
  if dbVenc.text <> '  /  /    ' then
    begin
    {diasDesc:=dmdados.TbParametroDescDia.Value;
    diasMulta:=dmdados.TbParametroMultaDia.Value;
    diasJuros:=dmdados.TbParametroJurosDia.Value;
    dmdados.tbCReceberDescDia.Value:=dmdados.tbCReceberDataVenc.Value - diasDesc;
    dmdados.tbCReceberMultaDia.Value:=dmdados.tbCReceberDataVenc.Value + diasMulta;
    dmdados.tbCReceberJurosDia.Value:=dmdados.tbCReceberDataVenc.Value + diasJuros; }
    end;
end;

procedure TfrmCReceber.BtnLocalizarClick(Sender: TObject);
begin
  FrmLocCReceber:=TFrmLocCReceber.create(application);
  FrmLocCReceber.showmodal;
  FrmLocCReceber.Free;
end;

procedure TfrmCReceber.BtnPrimeiroClick(Sender: TObject);
begin
  dmdados.tbCReceber.First;
  btnPrimeiro.Enabled:=False;
  btnAnterior.Enabled:=False;
  btnProximo.Enabled:=True;
  btnUltimo.Enabled:=True;
  dmDados.vTabStt:=True;
end;

procedure TfrmCReceber.BtnAnteriorClick(Sender: TObject);
begin
  dmdados.tbCreceber.Prior;
  btnProximo.Enabled:=True;
  btnUltimo.Enabled:=True;
  if dmdados.TbCreceber.bof then
    begin
    btnPrimeiro.Enabled:=False;
    btnAnterior.Enabled:=False;
    end;
  dmDados.vTabStt:=True;
end;

procedure TfrmCReceber.BtnProximoClick(Sender: TObject);
begin
  dmdados.tbCReceber.next;
  btnPrimeiro.Enabled:=True;
  btnAnterior.Enabled:=True;
  if dmdados.tbCReceber.Eof then
    begin
    btnProximo.Enabled:=False;
    btnUltimo.Enabled:=False;
    end;
  dmDados.vTabStt:=True;
end;

procedure TfrmCReceber.BtnUltimoClick(Sender: TObject);
begin
  dmdados.tbCReceber.Last;
  btnPrimeiro.Enabled:=True;
  btnAnterior.Enabled:=True;
  btnProximo.Enabled:=False;
  btnUltimo.Enabled:=False;
  dmDados.vTabStt:=True;
end;

procedure TfrmCReceber.BtnNovoClick(Sender: TObject);
begin
  dmdados.tbCReceber.Append;
  NovoItem:=True;
  {habilitando os bot�es}
  BtnGravar.Enabled := true;
  BtnCancelar.Enabled:=true;
  BtnNovo.Enabled:=False;
  BtnPrimeiro.Enabled:=False;
  BtnAnterior.Enabled:=False;
  BtnProximo.Enabled:=False;
  BtnUltimo.Enabled:=False;
  BtnAlterar.Enabled:=False;
  BtnDeletar.Enabled:=False;
  btnLocalizar.Enabled:=False;
  btnPagar.Enabled:=False;
  btnRestaurar.Enabled:=False;
  {habilitando os componentes}
  dbeNumDoc.Enabled:=true;
  DblookTipo.Enabled:= True;
  dblookCli.Enabled:=True;
  dblookhist.Enabled:=true;
  dbComplHist.Enabled:=True;
  dbEmissao.Enabled:=True;
  dbVenc.Enabled:=true;
  dbvalor.Enabled:=True;
  dbParcela.Enabled:=True;
  cmbPortador.Enabled:=True;
  DBDiaDesc.Enabled:=true;
  dbDiaMulta.Enabled:=true;
  dbDiajuros.Enabled:=true;
  dmdados.vTabStt:=False;
  rbValor.Enabled:=True;
  rbPerc.Enabled:=True;
  rbValor.Checked:=false;
  rbPerc.Checked:=false;
  dbeNumDoc.SetFocus;
end;

procedure TfrmCReceber.BtnGravarClick(Sender: TObject);
Var
  Campos:String;
  NumDoc,CodDoc,CodHist,CompHist,CodcCusto,Portador,NumBanco : string;
  CodCli,c,f,I : integer;
  DataEmis,DataVenc,MultaDia,DescDia,JurosDia : TDateTime;
  Valor,ValorMulta,PercMulta,ValorDesc,PercDesc,ValorJuros,PercJuros : Real;
  Vazio,Gravar:Boolean;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  if dbeNumDoc.Text= '' then
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
    begin
    try StrToDate(dbemissao.text)
     except on EConvertError do
       begin
       MsgDlg.MsgError('Data de Emiss�o Inv�lida');
       Gravar:=false;
       end;
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
    begin
    try StrToDate(dbVenc.text)
     except on EConvertError do
       begin
       MsgDlg.MsgError('Data de Vencimento Inv�lida');
       Gravar:=false;
       end;
     end;
    end;
  if dbValor.Text= '' then
    begin
    if dbvalor.value=0 then Campos:=Campos+', ';
    Campos:=Campos+'Valor(R$)';
    Gravar:=False;
    Vazio:=True;
    end;
  if (dbDiadesc.text <> '  /  /    ') then
    try StrToDate(dbdiadesc.text)
    except on EConvertError do
      begin
      MsgDlg.MsgError('Data de Desconto Inv�lida');
      gravar:=false;
      end;
    end;
  if (dbdiamulta.text <> '  /  /    ') then
    try StrToDate(dbdiamulta.text)
    except on EConvertError do
      begin
      MsgDlg.MsgError('Data da Multa Inv�lida');
      gravar:=false;
      end;
    end;
  if (dbdiajuros.text <> '  /  /    ') then
    try StrToDate(dbdiajuros.text)
    except on EConvertError do
      begin
      MsgDlg.MsgError('Data de Juros Inv�lida');
      gravar:=false;
      end;
    end;
  if Gravar then
    begin
    NovoItem:=False;
    dmdados.vTabStt:=True;
    if dbParcela.Value > 1 then
      begin
      c:=1;
      f:=dbParcela.Value;
      I:=StrToInt(dbIntervalo.Text);
      CompHist:=dbComplHist.Text;
      dmdados.tbCReceberPago.Value:='ABERTO';
      dmDados.tbCReceberCompHist.Value:=IntToStr(c)+'/'+IntToStr(f)+' - '+dbcomplhist.Text;
      dmdados.tbCReceber.Post;
      NumDoc:=dmDados.tbCReceberNumDoc.Value;
      CodDoc:=dmDados.tbCReceberCodDoc.Value;
      CodCli:=dmDados.tbCReceberCodCli.Value;
      DataEmis:=dmDados.tbCReceberDataEmis.Value;
      DataVenc:=dmDados.tbCReceberDataVenc.Value;
      CodHist:=dmDados.tbCReceberCodHist.Value;
      Valor:=dmDados.tbCReceberValor.Value;
      MultaDia:=dmDados.tbCReceberMultaDia.Value;
      ValorMulta:=dmDados.tbCReceberValorMulta.Value;
      PercMulta:=dmDados.tbCReceberPercMulta.Value;
      DescDia:=dmDados.tbCReceberDescDia.Value;
      ValorDesc:=dmDados.tbCReceberValorDesc.Value;
      PercDesc:=dmDados.tbCReceberPercDesc.Value;
      JurosDia:=dmDados.tbCReceberJurosDia.Value;
      ValorJuros:=dmDados.tbCReceberValorJuros.Value;
      PercJuros:=dmDados.tbCReceberPercJuros.Value;
      CodCCusto:=dmDados.tbCReceberCodCCusto.Value;
      Portador:=dmDados.tbCReceberPortador.Value;
      NumBanco:=dmDados.tbCReceberNumBanco.Value;
      for c:=2 to f do
        begin
        dmDados.tbCReceber.Append;
        dmdados.tbCReceberPago.Value:='ABERTO';
        dmDados.tbCReceberCompHist.Value:=IntToStr(c)+'/'+IntToStr(f)+' - '+CompHist;
        dmDados.tbCReceberNumDoc.Value:=NumDoc;
        dmDados.tbCReceberCodDoc.Value:=CodDoc;
        dmDados.tbCReceberCodCli.Value:=CodCli;
        dmDados.tbCReceberDataEmis.Value:=DataEmis;
        dmDados.tbCReceberDataVenc.Value:=GeraData(DataVenc,(I*(c-1)));
        dmDados.tbCReceberCodHist.Value:=CodHist;
        dmDados.tbCReceberValor.Value:=Valor;
        dmDados.tbCReceberMultaDia.Value:=MultaDia;
        dmDados.tbCReceberValorMulta.Value:=ValorMulta;
        dmDados.tbCReceberPercMulta.Value:=PercMulta;
        dmDados.tbCReceberDescDia.Value:=DescDia;
        dmDados.tbCReceberValorDesc.Value:=ValorDesc;
        dmDados.tbCReceberPercDesc.Value:=PercDesc;
        dmDados.tbCReceberJurosDia.Value:=JurosDia;
        dmDados.tbCReceberValorJuros.Value:=ValorJuros;
        dmDados.tbCReceberPercJuros.Value:=PercJuros;
        dmDados.tbCReceberCodCCusto.Value:=CodCCusto;
        dmDados.tbCReceberPortador.Value:=Portador;
        dmDados.tbCReceberNumBanco.Value:=NumBanco;
        dmDados.tbCReceber.Post;
        end;
      end
    else
      begin
      dmdados.tbCReceberPago.Value:='ABERTO';
      dmdados.tbCReceber.Post;
      end;
    BtnGravar.enabled := False;
    BtnCancelar.Enabled := False;
    BtnNovo.Enabled:=True;
    BtnPrimeiro.Enabled:=True;
    BtnAnterior.Enabled:=True;
    BtnProximo.Enabled:=True;
    BtnUltimo.Enabled:=True;
    BtnAlterar.Enabled:=True;
    Btndeletar.Enabled:=True;
    btnLocalizar.Enabled:=True;
    btnPagar.Enabled:=True;
    btnRestaurar.Enabled:=True;
    if (frmPrincipal.Acesso=1) then
      btnDeletar.Enabled := True
    else
      btnDeletar.Enabled := False;
    {desabilitando os componentes}
    dbParcela.Value := 1;
    dbeNumDoc.Enabled:=false;
    DblookTipo.Enabled:= false;
    dblookcli.Enabled:=false;
    dblookhist.Enabled:=false;
    dbComplHist.Enabled:=false;
    dbEmissao.Enabled:=false;
    dbVenc.Enabled:=false;
    dbvalor.Enabled:=false;
    dbParcela.Enabled:=False;
    dbIntervalo.Enabled:=False;
    cmbPortador.Enabled:=False;
    dbLookBanc.Enabled:=False;
    DBDiaDesc.Enabled:=false;
    dbeValorDesc.Enabled:=False;
    dbeValorMulta.Enabled:=false;
    dbeValorJuros.Enabled:=False;
    dbDiaMulta.Enabled:=false;
    dbDiajuros.Enabled:=false;
    dbePerc.Enabled:=False;
    dbePercMulta.Enabled:=False;
    dbePercJuros.Enabled:=False;
    rbValor.Enabled:=False;
    rbPerc.Enabled:=False;
    MsgDlg.MsgInformation('Dados gravados com sucesso');
    end
  else
    begin
    if Vazio then
      begin
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      DbeNumDoc.SetFocus;
      end;
    end;
end;

procedure TfrmCReceber.BtnCancelarClick(Sender: TObject);
begin
  NovoItem:=False;
  dmdados.vTabStt:=True;
  dmdados.tbCReceber.cancel;
  BtnGravar.enabled := false;
  BtnCancelar.Enabled := false;
  BtnNovo.Enabled:=True;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  Btnproximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  BtnAlterar.Enabled:=True;
  BtnDeletar.Enabled:=True;
  btnLocalizar.Enabled:=True;
  btnPagar.Enabled:=True;
  btnRestaurar.Enabled:=True;
  if (frmPrincipal.Acesso=1) then
    btnDeletar.Enabled := True
  else
    btnDeletar.Enabled := False;
  {desabilitando os objetos}
  dbeNumDoc.Enabled:=False;
  DblookTipo.Enabled:= false;
  dblookcli.Enabled:=false;
  dblookhist.Enabled:=false;
  dbComplHist.Enabled:=false;
  dbEmissao.Enabled:=false;
  dbVenc.Enabled:=false;
  dbvalor.Enabled:=false;
  dbParcela.Enabled:=False;
  dbIntervalo.Enabled:=False;
  cmbPortador.Enabled:=False;
  dbLookBanc.Enabled:=False;
  DBDiaDesc.Enabled:=false;
  dbDiaMulta.Enabled:=false;
  dbDiajuros.Enabled:=false;
  dbeValorDesc.Enabled:=False;
  dbeValorMulta.Enabled:=false;
  dbeValorJuros.Enabled:=False;
  dbDiaMulta.Enabled:=false;
  dbDiajuros.Enabled:=false;
  dbePerc.Enabled:=False;
  dbePercMulta.Enabled:=False;
  dbePercJuros.Enabled:=False;
  rbValor.Enabled:=false;
  rbPerc.Enabled:=false;
  LMDBackPanel3.SetFocus;
end;

procedure TfrmCReceber.BtnAlterarClick(Sender: TObject);
begin
  if dmdados.tbCReceber.RecordCount=0 then
    MsgDlg.MsgInformation('Tabela sem registro')
  else
    begin
    NovoItem:=True;
    dmDados.tbCReceber.Edit;
    {habilitando os bot�es}
    BtnGravar.Enabled := true;
    BtnCancelar.Enabled:=true;
    BtnNovo.Enabled:=False;
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    BtnAlterar.Enabled:=False;
    BtnDeletar.Enabled:=False;
    btnLocalizar.Enabled:=False;
    btnPagar.Enabled:=False;
    btnRestaurar.Enabled:=False;
    {habilitando os componentes}
    dbeNumDoc.Enabled:=true;
    DblookTipo.Enabled:= True;
    dblookCli.Enabled:=True;
    dblookhist.Enabled:=true;
    dbComplHist.Enabled:=True;
    dbEmissao.Enabled:=True;
    dbVenc.Enabled:=true;
    dbvalor.Enabled:=True;
    cmbPortador.Enabled:=True;
    //dbLookBanc.Enabled:=True;
    DBDiaDesc.Enabled:=true;
    dbDiaMulta.Enabled:=true;
    dbDiajuros.Enabled:=true;
    dmdados.vTabStt:=False;
    rbValor.Enabled:=True;
    rbPerc.Enabled:=True;
    rbValor.Checked:=false;
    rbPerc.Checked:=false;
    dbeNumDoc.SetFocus;
    end;
end;

procedure TfrmCReceber.BtnDeletarClick(Sender: TObject);
begin
  if dmdados.tbCReceber.RecordCount=0 then
    MsgDlg.MsgInformation('Tabela sem registro')
  else
    If MsgDlg.MsgConfirmation('Tem certeza que deseja exluir esse registro?') = id_yes then
      dmdados.tbCReceber.Delete
end;

procedure TfrmCReceber.FormShow(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,'[F2] Loc.Doc [F3] Loc.Cliente [F6] Baixa [F7] Restaurar [F9] Localizar [Esc] Cancelar ou Sair');
  dmDados.HabilitaTeclado := True;
  dmDados.vTabStt := True;
  dmDados.tbHistorico.Open;
  dmDados.tbCheque.Open;
  dmdados.TbMovConta.Open;
  dmDados.TbCCorrente.Open;
  dmDados.tbTipoDoc.Open;
  dmDados.tbPaciente.Open;
  dmDados.tbCReceber.Open;
  dmDados.tbBanco.Open;
  if dmdados.TbCreceber.RecordCount=0 then
    begin
    Btnprimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    BtnProximo.Enabled:=false;
    BtnUltimo.Enabled:=false;
    btnGravar.Enabled:=false;
    btnAlterar.Enabled:=false;
    btnCancelar.Enabled:=false;
    btnDeletar.Enabled:=false;
    btnPagar.Enabled:=False;
    btnRestaurar.Enabled:=False;
    end;
  if (frmPrincipal.Acesso=1) then
    btnDeletar.Enabled := True
  else
    btnDeletar.Enabled := False;
end;

procedure TfrmCReceber.FormKeyDown(Sender: TObject; var Key: Word;
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
      VK_F3     : btnlocCli.Click;
      VK_F6     : if (dmDados.vTabStt) then btnPagar.Click;
      VK_F7     : if (dmDados.vTabStt) then btnRestaurar.Click;
    end;
end;

procedure TfrmCReceber.rbValorClick(Sender: TObject);
begin
  dbeValorDesc.Enabled:=true;
  dbeValorMulta.Enabled:=true;
  dbeValorJuros.Enabled:=true;
  //dmDados.tbCReceberDescDia.Value    := dbvenc.Date - dmDados.TbParametroDescDia.Value ;
  //dmDados.tbCReceberMultaDia.Value   := dbvenc.Date + dmDados.TbParametroMultaDia.Value;
  //dmDados.tbCReceberJurosDia.Value   := dbvenc.Date + dmDados.TbParametroJurosDia.Value;
  //dmdados.tbCReceberValorMulta.Value := dmdados.TbParametroValorMulta.Value            ;
  //dmdados.tbCReceberValorDesc.Value  := dmdados.TbParametroValorDesc.Value             ;
  //dmdados.tbCReceberValorJuros.Value := dmdados.TbParametroValorJuros.Value            ;
  dmdados.tbCReceberPercMulta.Value  := 0                                              ;
  dmdados.tbCReceberPercDesc.Value   := 0                                              ;
  dmdados.tbCReceberPercJuros.Value  := 0                                              ;
  dbePerc.Enabled:=false;
  dbePercMulta.Enabled:=false;
  dbePercjuros.Enabled:=false;
end;

procedure TfrmCReceber.rbPercClick(Sender: TObject);
begin
  dbePerc.Enabled:=true;
  dbePercMulta.Enabled:=true;
  dbePercjuros.Enabled:=true;
  //dmDados.tbCReceberDescDia.Value    := dbvenc.Date - dmDados.TbParametroDescDia.Value ;
  //dmDados.tbCReceberMultaDia.Value   := dbvenc.Date + dmDados.TbParametroMultaDia.Value;
  //dmDados.tbCReceberJurosDia.Value   := dbvenc.Date + dmDados.TbParametroJurosDia.Value;
  //dmdados.tbCReceberPercDesc.Value   := dmdados.TbParametroPercDesc.Value              ;
  //dmdados.tbCReceberPercMulta.Value  := dmdados.TbParametroPercMulta.Value             ;
  //dmdados.tbCReceberPercJuros.Value  := dmdados.TbParametroPercMulta.Value             ;
  dmdados.tbCReceberValorMulta.Value := 0                                              ;
  dmdados.tbCReceberValorDesc.Value  := 0                                              ;
  dmdados.tbCReceberValorJuros.Value := 0                                              ;
  dbeValorDesc.Enabled:=false;
  dbeValorMulta.Enabled:=false;
  dbeValorJuros.Enabled:=false;
end;

procedure TfrmCReceber.dbdiadescExit(Sender: TObject);
begin
  try StrToDate(dbdiadesc.text)
  except on EConvertError do
    begin
    MsgDlg.MsgError('Data Inv�lida');
    dbdiadesc.SetFocus;
    end;
  end;
end;

procedure TfrmCReceber.dbdiamultaExit(Sender: TObject);
begin
  try StrToDate(dbdiamulta.text)
  except on EConvertError do
    begin
    MsgDlg.MsgError('Data Inv�lida');
    dbdiamulta.SetFocus;
    end;
  end;
end;

procedure TfrmCReceber.dbdiajurosExit(Sender: TObject);
begin
  try StrToDate(dbdiajuros.text)
  except on EConvertError do
    begin
    MsgDlg.MsgError('Data Inv�lida');
    dbdiajuros.SetFocus;
    end;
  end;
end;

procedure TfrmCReceber.btnSimClick(Sender: TObject);
begin
  FrmTipoReceb:=TFrmTipoReceb.create(application);
  FrmTipoReceb.showmodal;
  if frmTipoReceb.PagoStt = 'S' then
    begin
    frmTipoReceb.Free;
    NovoItem:=False;
    dmdados.vTabStt:=True;
    dmDados.tbCReceberPago.Value:='PAGO';
    dmDados.tbCReceberTipoPago.Value:='Pagamento Total';
    dmdados.tbCReceber.Post;
    BtnGravar.enabled := false;
    BtnCancelar.Enabled := false;
    BtnNovo.Enabled:=True;
    BtnPrimeiro.Enabled:=True;
    BtnAnterior.Enabled:=True;
    Btnproximo.Enabled:=True;
    BtnUltimo.Enabled:=True;
    BtnAlterar.Enabled:=True;
    BtnDeletar.Enabled:=True;
    btnLocalizar.Enabled:=True;
    btnPagar.Enabled:=True;
    btnRestaurar.Enabled:=True;
    btnSim.Enabled:=False;
    btnNao.Enabled:=False;
    {desabilitando os objetos}
    dbDtReceb.Enabled:=False;
    dbDesc.Enabled:=False;
    dbJuros.Enabled:=False;
    dbVlReceb.Enabled:=False;
    LMDBackPanel3.SetFocus;
    end
  else
    begin
    frmTipoReceb.Free;
    btnNao.Click;
    end;
end;

procedure TfrmCReceber.btnSairClick(Sender: TObject);
begin
  if (dmdados.tbCReceber.State=dsedit)or(dmdados.tbCReceber.State=dsInsert) then
    dmDados.tbCReceber.Cancel;
  Close;
end;

procedure TfrmCReceber.btnPagarClick(Sender: TObject);
begin
  if dmdados.tbCReceberPago.value='PAGO' then
    MsgDlg.MsgInformation('T�tulo j� est� PAGO')
  else
    begin
    dmdados.tbCReceber.Edit;
    NovoItem:=True;
    {habilitando os bot�es}
    BtnGravar.Enabled := False;
    BtnCancelar.Enabled:=False;
    BtnNovo.Enabled:=False;
    BtnPrimeiro.Enabled:=False;
    BtnAnterior.Enabled:=False;
    BtnProximo.Enabled:=False;
    BtnUltimo.Enabled:=False;
    BtnAlterar.Enabled:=False;
    BtnDeletar.Enabled:=False;
    btnLocalizar.Enabled:=False;
    btnPagar.Enabled:=False;
    btnRestaurar.Enabled:=False;
    btnSim.Enabled:=True;
    btnNao.Enabled:=True;
    {habilitando os componentes}
    dbDtReceb.Enabled:=True;
    dbDesc.Enabled:=True;
    dbJuros.Enabled:=True;
    dbVlReceb.Enabled:=True;
    dbDtReceb.SetFocus;
    end;
end;

procedure TfrmCReceber.btnRestaurarClick(Sender: TObject);
var
  ano,mes,dia : word;
  mesCusto,anoCusto,Conta,Custo : string;
begin
  if dmdados.tbCReceberPago.value='ABERTO' then
    MsgDlg.MsgInformation('T�tulo j� est� ABERTO')
  else
    if (dmdados.tbCReceberPago.Value='PAGO') then
      If MsgDlg.MsgConfirmation('T�tulo est� em PAGO, voc� quer mesmo RESTAURAR?') = id_yes then
        begin
        if dmdados.TbMovConta.Locate('CodDoc;DataMov',VarArrayOf([dmDados.tbCReceberCodDoc.Value,dmDados.tbCReceberDataVenc.Value]),[]) then
          Conta:=dmDados.TbMovContaConta.Value
        else
          Conta:='000000000000001';
        {inserir inf de estorno no movimento de conta}
        dmdados.TbMovConta.Append;
        dmdados.TbMovContaDosNumero.Value:=dmdados.tbCReceberNumDoc.Value;
        dmdados.TbMovContaConta.Value:=Conta;
        dmdados.TbMovContaDataMov.Value:=date;
        dmdados.tbMovContaDataReg.value:=date;
        dmdados.TbMovContaHoraReg.Value:=time;
        dmdados.TbMovContaTipoOper.Value:='S';
        dmdados.TbMovContaCodHist.Value:=dmdados.tbCReceberCodHist.Value;
        dmdados.TbMovContaCodDoc.Value:=dmdados.tbCReceberCodDoc.Value;
        dmdados.TbMovContaComplHist.Value:='Estorno do Recebimento';
        dmdados.TbMovContaValor.Value:=dmdados.tbCReceberValorPago.Value;
        dmdados.TbMovConta.Post;
        {atualizar conta corrente}
        if dmdados.TbCCorrente.Locate('Conta',Conta,[]) then
          begin
          dmdados.TbCCorrente.Edit;
          dmdados.TbCCorrenteSaldo.Value:=dmDados.TbCCorrenteSaldo.Value-dmdados.tbCReceberValorPago.Value;
          dmdados.tbccorrenteUltMov.value:=date;
          dmdados.TbCCorrente.post;
          end;
        {atualizar centro de custo}
        DecodeDate(now,ano,mes,dia);
        mesCusto:=IntToStr(mes);
        anoCusto:=IntTostr(ano);
        Custo:=dmdados.tbCReceberCodCCusto.Value;
        dmdados.tbCReceber.Edit;
        dmdados.tbCReceberDataPaga.Clear;
        dmdados.tbCReceberValorPago.Clear;
        dmDados.tbCReceberDescPago.Clear;
        dmDados.tbCReceberMuJuPago.Clear;
        dmdados.tbCReceberPago.Value:='ABERTO';
        dmDados.tbCReceberTipoPago.Value:='';
        dmdados.tbCReceber.Post;
        end;
end;

procedure TfrmCReceber.cmbPortadorExit(Sender: TObject);
begin
  if cmbPortador.Text='Cobran�a Banc�ria' then
    dbLookBanc.Enabled:=True
  else
    dbLookBanc.Enabled:=False;
end;

procedure TfrmCReceber.cmbPortadorChange(Sender: TObject);
begin
  if cmbPortador.Text='Cobran�a Banc�ria' then
    dbLookBanc.Enabled:=True
  else
    dbLookBanc.Enabled:=False;
end;

procedure TfrmCReceber.btnNaoClick(Sender: TObject);
begin
  NovoItem:=False;
  dmdados.vTabStt:=True;
  dmdados.tbCReceber.cancel;
  BtnGravar.enabled := false;
  BtnCancelar.Enabled := false;
  BtnNovo.Enabled:=True;
  BtnPrimeiro.Enabled:=True;
  BtnAnterior.Enabled:=True;
  Btnproximo.Enabled:=True;
  BtnUltimo.Enabled:=True;
  BtnAlterar.Enabled:=True;
  BtnDeletar.Enabled:=True;
  btnLocalizar.Enabled:=True;
  btnPagar.Enabled:=True;
  btnRestaurar.Enabled:=True;
  btnSim.Enabled:=False;
  btnNao.Enabled:=False;
  {desabilitando os objetos}
  dbDtReceb.Enabled:=False;
  dbDesc.Enabled:=False;
  dbJuros.Enabled:=False;
  dbVlReceb.Enabled:=False;
  LMDBackPanel3.SetFocus;
end;

procedure TfrmCReceber.dbDtRecebExit(Sender: TObject);
Var
  VlAtual, Multa, Juros, Desco, VlDesc, VlMu, VlJu,PJu : Real;
  DtVen, DtDesc, DtMu, DtJu, DtPg : TDateTime;
  PDesc, Pmu : Real;
  Dias:longint;
  flag:boolean;
begin
if NovoItem then
  begin
  flag:=true;
  if  (dbDtReceb.text ='  / /   ') then
    begin
    MsgDlg.MsgWarning('Data Vazia');
    flag:=false;
    dbDtReceb.SetFocus;
    end
  else
    try StrToDate(dbDtReceb.text)
    except on EConvertError do
      begin
      MsgDlg.MsgError('Data Inv�lida');
      flag:=false;
      dbDtReceb.SetFocus;
      end;
    end;
  if flag then
    begin
    Multa:= 0;
    Juros:= 0;
    Desco:=0;
    VlAtual:= Dmdados.tbCReceberValor.Value;
    DtVen:= Dmdados.tbCReceberDataVenc.Value;
    DtPg:= dbDtReceb.Date;
    DtDesc:= dmdados.tbCReceberDescDia.Value;
    DtMu:= Dmdados.tbCReceberMultaDia.Value;
    DtJu:= Dmdados.tbCReceberJurosDia.Value;
    VlDesc:= Dmdados.tbCReceberValorDesc.Value;
    VlMu:= Dmdados.tbCReceberValorMulta.Value;
    VlJu:= Dmdados.tbCReceberValorJuros.Value;
    Pdesc:= Dmdados.tbCReceberPercDesc.value;
    Pmu:= Dmdados.tbCReceberPercMulta.value;
    Pju:= Dmdados.tbCReceberPercJuros.Value;
    if Dtpg < DtVen then
      if Dtpg <= DtDesc then
        if PDesc > 0 then
          Desco:=VlAtual*(PDesc/100)
        else
      	  Desco:= VlDesc;
    if Dtpg > DtVen then
      begin
      if Dtpg >= DtMu then
        if Pmu > 0 then
          Multa:= VlAtual*(Pmu/100)
        else
          Multa:= VlMu;
      if Dtpg >= DtJu then
        begin
        Dias:= trunc(Dtpg - DtVen);
        if Pju >0 then
          Juros:= (VlAtual*(Pju/100))*dias
        else
          Juros:= VlJu*dias;
        end;
      end;
    VlAtual:= VlAtual-Desco+Multa+Juros;
    dmDados.tbCReceberDescPago.Value:=Desco;
    dmDados.tbCReceberMuJuPago.Value:=Multa+Juros;
    Dmdados.tbCReceberValorPago.Value:= VlAtual;
    end;
  end;
end;

procedure TfrmCReceber.dbDescExit(Sender: TObject);
begin
  if NovoItem then
    dmDados.tbCReceberValorPago.Value:=dmDados.tbCReceberValor.Value-dbDesc.Value;
end;

procedure TfrmCReceber.dbJurosExit(Sender: TObject);
begin
  if NovoItem then
    dmDados.tbCReceberValorPago.Value:=dmDados.tbCReceberValor.Value+dbJuros.Value;
end;

procedure TfrmCReceber.btnlocCliClick(Sender: TObject);
begin
  if (dmdados.tbCReceber.State=dsedit)or(dmdados.tbCReceber.State=dsInsert) then
    begin
    frmLocPac:=tfrmLocPac.Create(application);
    frmLocPac.ShowModal;
    dmdados.tbCReceberCodCli.Value:=frmLocPac.Resultado;
    frmLocPac.Free;
    end;
end;

procedure TfrmCReceber.btnLocDocClick(Sender: TObject);
begin
  if (dmdados.tbCReceber.State=dsedit)or(dmdados.tbCReceber.State=dsInsert) then
    begin
    frmLocTipoDoc:=tfrmLocTipoDoc.create(application);
    frmLocTipoDoc.showmodal;
    dmdados.tbCReceberCodDoc.value:=frmlocTipoDoc.resultado;
    frmLocTipoDoc.Free;
    end;
end;

procedure TfrmCReceber.dbParcelaExit(Sender: TObject);
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

end.
