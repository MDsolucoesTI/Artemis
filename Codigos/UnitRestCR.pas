//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit UnitRestCR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, SpeedBar, jpeg, ExtCtrls, StdCtrls, RackCtls, RXSplit,db,
  Mask, DBCtrls, RXCtrls, ToolEdit, RXDBCtrl, fcButton, fcImgBtn, ComCtrls,
  dbtables,variants, RxLookup, RxGrdCpt, fcImager;

type
  TFrmCancelCR = class(TForm)
    Panel1: TPanel;
    lbNumDoc: TRxLabel;
    lbCliente: TRxLabel;
    lbCodCliente: TRxLabel;
    btLocCliente: TfcImageBtn;
    RxSplitter1: TRxSplitter;
    edcodigo: TEdit;
    ednome: TEdit;
    RxDBGrid1: TRxDBGrid;
    edDoc: TEdit;
    edConta: TRxLookupEdit;
    RxLabel1: TRxLabel;
    data: TDateEdit;
    Edit1: TEdit;
    Panel2: TPanel;
    Image1: TImage;
    Panel4: TPanel;
    btnRestaurar: TfcImageBtn;
    btnSair: TfcImageBtn;
    btnBuscar: TfcImageBtn;
    RxGradientCaption2: TRxGradientCaption;
    fcImager1: TfcImager;
    fcImager2: TfcImager;
    fcImager3: TfcImager;
    RxLabel5: TRxLabel;
    procedure BtnSairClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure edcodigoExit(Sender: TObject);
    procedure edDocExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btLocClienteClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnRestaurarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edContaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCancelCR: TFrmCancelCR;
  rest : boolean;

implementation

uses unitDmDados, unitLocCliente, UnitPrincipal;

{$R *.DFM}

procedure TFrmCancelCR.BtnSairClick(Sender: TObject);
begin
Close;
end;

procedure TFrmCancelCR.btnBuscarClick(Sender: TObject);
var
  Campos:String;
  Vazio,Gravar:Boolean;
  s : string;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;

  If edcodigo.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
      Campos:=Campos+'C�digo do Cliente';
      Gravar:=False;
      Vazio:=True;
    end;

  If edDoc.Text= '' then
    begin
    If Length(Campos)>0 Then
      Campos:=Campos+', ';
      Campos:=Campos+'N� DOC';
      Gravar:=False;
      Vazio:=True;
    end;

If Gravar Then
    Begin
    s := trim(edDoc.text)+'*';{tira os espa�os em branco}
    dmdados.tbCreceber.Filtered:=False;
    dmdados.tbCreceber.Filter:='(NumDoc = '''+s+''' )and' +
                               '(codcli = '''+edcodigo.Text+''')';
    dmdados.tbCreceber.Filtered:=True;
    btnBuscar.Enabled:=false;
    if (dmdados.tbCreceber.RecordCount = 0) then
      btnRestaurar.Enabled:=false
    else
      btnRestaurar.Enabled:=true;
    end
else
Begin
    If Vazio Then
      ShowMessage('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      edcodigo.SetFocus;
    end;

end;

procedure TFrmCancelCR.edcodigoExit(Sender: TObject);
begin
if rest then
begin
   if edcodigo.Text='' then
       begin
       ShowMessage('Obrigat�rio o C�DIGO DO CLIENTE');
       edcodigo.SetFocus;
       end
   else
   BEGIN
    if dmdados.tbCliente.Locate('Codcli',StrToInt(edcodigo.text),[]) then
      begin
      ednome.Text:=dmdados.tbClienteNome.Value;
      edcodigo.text:=IntToStr(dmdados.tbClienteCodCli.Value);
      end
    else
      begin
      ShowMessage('Cliente n�o cadastrado');
      edcodigo.SetFocus;
      end;
   END;
end

 end;

procedure TFrmCancelCR.edDocExit(Sender: TObject);
begin
if rest then
begin
 if edDoc.Text='' then
    begin
    ShowMessage('Obrigat�rio o N�MERO do documento');
    edDoc.SetFocus;
    end
 else
    begin
    Panel4.SetFocus;
    btnBuscar.Enabled:=true;
    end;
end;    
end;

procedure TFrmCancelCR.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
FrmPrincipal.StatusTeclas(False,'');
rest:=false;
dmdados.tbCReceber.Filtered:=false;
action:=cafree;
end;

procedure TFrmCancelCR.btLocClienteClick(Sender: TObject);
begin
frmLocCliente:=tfrmLocCliente.create(application);
frmLocCliente.showModal;
edcodigo.Text:=IntToStr(frmLocCliente.resultado);
ednome.Text:=frmLocCliente.Nome;
frmLocCliente.Free;
end;

procedure TFrmCancelCR.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
If Key=#13 Then
      Begin
      Key:=#0;
      Perform(wm_nextdlgctl,0,0);
      End;

end;

procedure TFrmCancelCR.FormShow(Sender: TObject);
begin
FrmPrincipal.StatusTeclas(True,'[F2] Localizar Cliente [F3] Localizar Doc [F4] Restaurar [Esc] Sair');
rest:=true;
edcodigo.SetFocus;
end;

procedure TFrmCancelCR.btnRestaurarClick(Sender: TObject);
var
  custo : string;
  ano,mes,dia : word;
  mesCusto,anoCusto:string;
  PosReg:array[1..20] of integer;
  c,c1 : integer;

begin
  dmdados.tbCReceber.First;
  c:=0;
  While not dmdados.tbCReceber.Eof do
    begin
    c:=c+1;
    PosReg[c]:=dmDados.tbCreceber.RecNo;
    dmdados.tbCreceber.Next;
    end;

  for c1:=1 to c do
       begin
       if dmdados.tbCReceberNumDoc.Value=edDoc.Text then
          begin
          dmdados.tbCReceber.RecNo:=PosReg[c1];
          dmdados.tbCReceber.Edit;
          dmdados.tbCReceberDataPaga.value:=data.date;
          dmdados.tbCReceberValorPago.Value:=0;
          dmdados.tbCReceberPago.Value:='Aberto';
          dmdados.tbCReceberFormaPagto.Value:='  ';
          dmdados.tbCReceber.Post;
          {inserir inf de estorno no movimento de conta}
          dmdados.TbMovConta.Append;
          dmdados.TbMovContaDosNumero.Value:=dmdados.tbCReceberNumDoc.Value;
          dmdados.TbMovContaConta.Value:=edit1.Text;
          dmdados.TbMovContaDataMov.Value:=date;
          dmdados.tbMovContaDataReg.value:=date;
          dmdados.TbMovContaHoraReg.Value:=time;
          dmdados.TbMovContaTipoOper.Value:='S';
          dmdados.TbMovContaCodHist.Value:=dmdados.tbCReceberCodHist.Value;
          dmdados.TbMovContaCodDoc.Value:=dmdados.tbCReceberCodDoc.Value;
          dmdados.TbMovContaComplHist.Value:='Estorno do Documento N�'+' '+edDoc.Text;
          dmdados.TbMovContaValor.Value:=dmdados.tbCReceberValor.Value;
          dmdados.TbMovConta.Post;
          {atualizar conta corrente}
          if dmdados.TbCCorrente.Locate('Conta',edConta.Text,[]) then
            begin
            dmdados.TbCCorrente.Edit;
            dmdados.TbCCorrenteSaldo.Value:=
            dmdados.TbCCorrenteSaldo.Value-dmdados.tbCReceberValor.Value;
            dmdados.tbccorrenteUltMov.value:=date;
            dmdados.TbCCorrente.post;
            end;
          {atualizar centro de custo}
          decodedate(now,ano,mes,dia);
          mesCusto:=IntToStr(mes);
          anoCusto:=IntTostr(ano);
          custo:=dmdados.tbCReceberCodCCusto.Value;
          if dmdados.TbBalCusto.Locate('CodCcusto;Mes;Ano',VarArrayOf([Custo,mesCusto,anoCusto]),[]) then
            begin
            dmdados.tbBalcusto.edit;
            dmdados.tbBalcustoReceitas.value:=
            dmdados.tbBalcustoReceitas.value-dmdados.tbCReceberValor.Value;
            dmdados.tbBalCustoDespesas.Value:=0;
            dmdados.tbBalCusto.Post;
            end;
          end
          else {se o doc n~ = ao edDoc}
            begin
            dmdados.tbCReceber.Delete;
            dmdados.tbCReceber.Next;
            end;
       end;
ShowMessage('Baixa restaurada com sucesso');
btnRestaurar.Enabled:=false;
end;

procedure TFrmCancelCR.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if dmdados.HabilitaTeclado then
    case (key) of
      // Teclas de a��o na tabela
      VK_ESCAPE : if dmDados.vTabStt then BtnSair.Click;
      VK_F2     : btLocCliente.Click;
      VK_F3     : btnBuscar.Click;
      VK_F4     : btnRestaurar.Click;
end;
end;

procedure TFrmCancelCR.edContaExit(Sender: TObject);
begin
if edconta.Text='' then
   begin
   ShowMessage('Obrigat�rio informar a CONTA');
   edconta.SetFocus;
   end
else
   begin
   If Not(dmDados.TbCcorrente.Locate('Descricao',edconta.Text,[])) Then
        Begin
        Showmessage('CONTA n�o Cadastrada');
        edconta.Clear;
        edconta.setfocus;
        End
   else
       begin
       if dmdados.tbCcorrente.Locate('Descricao',edconta.Text,[]) then
       edit1.Text:=dmdados.tbCcorrenteConta.Value;
       Panel4.SetFocus;
       end;
end;

end;

end.
