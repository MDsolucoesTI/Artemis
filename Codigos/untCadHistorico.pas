//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Ultima modificacao: 03/2007
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadHistorico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EMsgDlg, JvComponent, JvEnterTab, fcLabel, ExtCtrls, fcpanel, DB,
  JvTransBtn, Grids, DBGrids, RXDBCtrl, StdCtrls, Mask, DBCtrls, JvLabel,
  DBTables;

type
  TfrmCadHistorico = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    pnBotoes: TfcPanel;
    pnCentro: TfcPanel;
    JvEnterAsTab2: TJvEnterAsTab;
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
    JvLabel1: TJvLabel;
    dbCod: TDBEdit;
    JvLabel10: TJvLabel;
    GridHist: TRxDBGrid;
    dbHist: TDBEdit;
    MsgDlg: TEvMsgDlg;
    procedure btnSairClick(Sender: TObject);
    procedure dbCodExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadHistorico : TfrmCadHistorico;
  NovoItem        : Boolean         ;

implementation

uses untdmDados, untPrincipal;

{$R *.dfm}

procedure TfrmCadHistorico.btnSairClick(Sender: TObject);
begin
  DmDados.tbHistorico.Close;
  Close;
end;

procedure TfrmCadHistorico.dbCodExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbHistorico.DatabaseName;
  Tabela.TableName    := dmDados.tbHistorico.TableName   ;
  Tabela.IndexName    := dmdados.tbHistorico.IndexName   ;
  Tabela.Open;
  if NovoItem then
    begin
    if dbcod.Text = '' Then
      begin
      MsgDlg.MsgError('� necess�rio Informar o C�digo');
      Dbcod.setfocus;
      end
    else
      begin
      if Tabela.Locate('CodHist',dbcod.Text,[]) then
        begin
        if not ((DmDados.tbHistorico.State=dsEdit) And (dmDados.tbHistorico.RecNo = Tabela.RecNo)) then
          begin
          MsgDlg.MsgWarning('C�digo j� cadastrado');
          dbcod.Clear;
          dbcod.setfocus;
          end;
        end;
      end;
    end;
  Tabela.Free;
end;

procedure TfrmCadHistorico.FormActivate(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,' [Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
    dmDados.vTabStt := True;
  if (dmDados.tbCReceber.State = dsInactive)  then
    dmDados.tbCReceber.Open;
  if (dmDados.tbCPagar.State   = dsInactive)  then
    dmDados.tbCPagar.Open;
end;

procedure TfrmCadHistorico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmDados.tbHistorico.Close;
  Action := Cafree;
end;

procedure TfrmCadHistorico.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case (key) of
      // Teclas de a��o na tabela
      VK_Insert : if (dmDados.vTabStt)    then BtnNovo.Click   ;
      VK_Home   : if (dmDados.vTabStt)    then BtnAlterar.Click;
      VK_Delete : if (dmDados.vTabStt)    then BtnDeletar.Click;
      VK_End    : if not(dmDados.vTabStt) then btnGravar.Click ;
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                  else BtnSair.Click;
    end;
end;

procedure TfrmCadHistorico.FormShow(Sender: TObject);
begin
  dmDados.HabilitaTeclado := True ;
  dmDados.vTabStt         := True ;
  NovoItem                := False;
 if (dmDados.tbHistorico.State  = dsInactive)  then
    dmDados.tbHistorico.Open;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
  if dmdados.tbHistorico.RecordCount=0 then
    begin
    Btnprimeiro.Enabled := False ;
    BtnAnterior.Enabled := False ;
    BtnProximo.Enabled  := False ;
    BtnUltimo.Enabled   := False ;
    btnGravar.Enabled   := False ;
    btnAlterar.Enabled  := False ;
    btnCancelar.Enabled := False ;
    btnDeletar.Enabled  := False ;
    end;
end;

procedure TfrmCadHistorico.btnPrimeiroClick(Sender: TObject);
begin
  dmdados.tbHistorico.First;
  Btnprimeiro.Enabled := False;
  BtnAnterior.Enabled := False;
  BtnProximo.Enabled  := True ;
  BtnUltimo.Enabled   := True ;
  dmdados.vTabStt     := True ;
end;

procedure TfrmCadHistorico.btnAnteriorClick(Sender: TObject);
begin
  dmdados.tbHistorico.Prior;
  BtnProximo.Enabled := True;
  BtnUltimo.Enabled  := True;
  if dmdados.tbHistorico.bof then
    begin
    BtnPrimeiro.Enabled := False;
    BtnAnterior.Enabled := False;
    end;
  dmdados.vTabStt := True ;
end;

procedure TfrmCadHistorico.btnProximoClick(Sender: TObject);
begin
  dmdados.tbHistorico.next;
  BtnPrimeiro.Enabled := True;
  BtnAnterior.Enabled := True;
  if dmdados.tbHistorico.Eof then
    begin
    BtnProximo.Enabled := False;
    BtnUltimo.Enabled  := False;
    end;
  dmdados.vTabStt := True ;
end;

procedure TfrmCadHistorico.btnUltimoClick(Sender: TObject);
begin
  dmdados.tbHistorico.last;
  BtnPrimeiro.Enabled := True ;
  BtnAnterior.Enabled := True ;
  BtnProximo.Enabled  := False;
  BtnUltimo.Enabled   := False;
  dmdados.vTabStt     := True ;
end;

procedure TfrmCadHistorico.btnNovoClick(Sender: TObject);
begin
  dmDados.tbHistorico.Append;
  NovoItem := True;
  dmdados.vTabStt := False;
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
  dbCod.Enabled   := True ;
  dbHist.Enabled  := True ;
  gridHist.Enabled:= True ;
  dbCod.SetFocus;
end;

procedure TfrmCadHistorico.btnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar:Boolean;
  tabela: ttable;
begin
  Campos:='';
  Gravar:=true;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbHistorico.DatabaseName;
  Tabela.TableName    := dmDados.tbHistorico.TableName   ;
  Tabela.IndexName    := dmdados.tbHistorico.IndexName   ;
  Tabela.Open;
  if dbCod.Text='' then
    begin
    if Length(Campos)>0 then Campos:=Campos+', ';
    Campos:=Campos+'C�digo';
    Gravar:=false;
    Vazio:=True;
    end
  else
    begin
    if Tabela.Locate('CodHist',dbCod.Text,[]) then
      if not((DmDados.tbHistorico.State=dsEdit) And (dmDados.tbHistorico.RecNo = Tabela.RecNo)) Then
        begin
        Gravar:=false;
        MsgDlg.MsgWarning('C�digo j� cadastrado');
        end;
    end;
  if dbHist.Text='' then
    begin
    if Length(Campos)>0 then Campos:=Campos+', ';
    Campos:=Campos+'Descri��o';
    Gravar:=False;
    Vazio:=True;
    end
  else
    begin
    if Tabela.Locate('Descricao',dbHist.Text,[]) then
      if not((DmDados.tbHistorico.State=dsEdit) And (dmDados.tbHistorico.RecNo = Tabela.RecNo)) Then
        begin
        Gravar:=False;
        MsgDlg.MsgWarning('Hist�rico j� cadastrado');
        end;
    end;
  if gravar then
    begin
    NovoItem:= False;
    dmdados.tbHistorico.Post;
    dmDados.vTabStt     := True ;
    BtnGravar.enabled   := False;
    BtnCancelar.Enabled := False;
    BtnNovo.Enabled     := True ;
    BtnPrimeiro.Enabled := True ;
    BtnAnterior.Enabled := True ;
    BtnProximo.Enabled  := True ;
    BtnUltimo.Enabled   := True ;
    BtnAlterar.Enabled  := True ;
    Btndeletar.Enabled  := True ;
    dbCod.Enabled       := False;
    dbHist.Enabled      := False;
    gridHist.Enabled    := False;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    pnBotoes.SetFocus;
    end
  else
    begin
    if Vazio then
      begin
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      dbCod.SetFocus;
      end;
    end;
  tabela.Free;
end;

procedure TfrmCadHistorico.btnCancelarClick(Sender: TObject);
begin
  dmdados.tbHistorico.cancel;
  NovoItem := False;
  dmdados.vTabStt := True ;
  {Desabilitando os bot�es}
  BtnGravar.Enabled   := False;
  BtnCancelar.Enabled := false;
  BtnNovo.Enabled     := True ;
  btnPrimeiro.Enabled := True ;
  BtnAnterior.Enabled := True ;
  Btnproximo.Enabled  := True ;
  BtnUltimo.Enabled   := True ;
  BtnAlterar.Enabled  := True ;
  BtnDeletar.Enabled  := True ;
  {Habilitando os componentes}
  gridHist.Enabled := False;
  DbCod.Enabled    := False;
  dbHist.enabled   := False;
  pnBotoes.SetFocus;
end;

procedure TfrmCadHistorico.btnAlterarClick(Sender: TObject);
begin
  if dmdados.tbHistorico.RecordCount=0 then
    MsgDlg.MsgInformation('Tabela vazia')
  else
    begin
    novoitem:= True ;
    dmdados.vTabStt := False;
    dmdados.tbHistorico.Edit;
    BtnCancelar.enabled := True ;
    BtnGravar.Enabled   := True ;
    BtnNovo.Enabled     := False;
    BtnPrimeiro.Enabled := False;
    BtnAnterior.Enabled := False;
    BtnProximo.Enabled  := False;
    BtnUltimo.Enabled   := False;
    BtnAlterar.Enabled  := False;
    Btndeletar.Enabled  := False;
    //habilitar objetos
    gridHist.Enabled := True;
    DbCod.Enabled    := True;
    dbHist.Enabled   := True;
    DbCod.SetFocus;
    end;
end;

procedure TfrmCadHistorico.btnDeletarClick(Sender: TObject);
var
   flag:boolean;
begin
  NovoItem := False;
  flag     := False;
  if dmdados.tbHistorico.RecordCount=0 then
    MsgDlg.MsgInformation('Tabela vazia')
  else
    If MsgDlg.MsgConfirmation('Tem certeza que deseja excluir esse registro?') = id_yes then
      begin
      if dmdados.tbCReceber.Locate('CodHist',dmdados.tbHistoricoCodHist.Value,[]) then
        flag:=true;
      if dmdados.tbCPagar.Locate('CodHist',dmdados.tbHistoricoCodHist.Value,[]) then
        flag:=true;
      if flag then
        MsgDlg.MsgWarning('Hist�rico ativo, ou com registro de opera��es anteriores, n�o pode ser exclu�do !!!')
      else
        dmdados.tbHistorico.Delete;
      end
    else
      dmdados.tbHistorico.Cancel;
end;

end.
