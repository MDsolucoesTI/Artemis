//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Ultima modificacao: 03/2007
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCadTipoDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EMsgDlg, JvTransBtn, Grids, DBGrids, RXDBCtrl, StdCtrls, Mask,
  DBCtrls, JvLabel, JvComponent, JvEnterTab, fcLabel, ExtCtrls, fcpanel, DB,
  DBTables;

type
  TfrmCadTipoDoc = class(TForm)
    pnTop: TfcPanel;
    fcLabel2: TfcLabel;
    JvEnterAsTab2: TJvEnterAsTab;
    pnCentro: TfcPanel;
    JvLabel1: TJvLabel;
    JvLabel10: TJvLabel;
    dbCod: TDBEdit;
    GridTipoDoc: TRxDBGrid;
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
    dbTipoDoc: TDBEdit;
    MsgDlg: TEvMsgDlg;
    procedure btnSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure dbCodExit(Sender: TObject);
    procedure dbTipoDocExit(Sender: TObject);
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
  frmCadTipoDoc : TfrmCadTipoDoc;
  NovoItem      : Boolean       ;

implementation

uses untdmDados, untPrincipal;

{$R *.dfm}

procedure TfrmCadTipoDoc.btnSairClick(Sender: TObject);
begin
  DmDados.tbTipoDoc.Close;
  Close;
end;

procedure TfrmCadTipoDoc.FormActivate(Sender: TObject);
begin
  FrmPrincipal.StatusTeclas(True,' [Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
    dmDados.vTabStt := True;
  if (dmDados.tbTipoDoc.State  = dsInactive)  then
    dmDados.tbTipoDoc.Open;
  if (dmDados.tbCReceber.State = dsInactive)  then
    dmDados.tbCReceber.Open;
  if (dmDados.tbCPagar.State   = dsInactive)  then
    dmDados.tbCPagar.Open;
end;

procedure TfrmCadTipoDoc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmPrincipal.StatusTeclas(False,'');
  dmDados.tbTipoDoc.Close;
  dmDados.tbCReceber.Close;
  dmDados.tbCPagar.Close;
  Action := Cafree;
end;

procedure TfrmCadTipoDoc.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case (key) of
      // Teclas de a��o na tabela
      VK_Insert : if (dmDados.vTabStt) then BtnNovo.Click;
      VK_Home   : if (dmDados.vTabStt) then BtnAlterar.Click;
      VK_Delete : if (dmDados.vTabStt) then BtnDeletar.Click;
      VK_End    : if not(dmDados.vTabStt) then btnGravar.Click;
      VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                  else BtnSair.Click;
    end;
end;

procedure TfrmCadTipoDoc.FormShow(Sender: TObject);
begin
  dmDados.HabilitaTeclado := True ;
  dmDados.vTabStt         := True ;
  NovoItem                := False;
  if (dmDados.tbTipoDoc.State  = dsInactive)  then
    dmDados.tbCReceber.Open;
  if (dmDados.tbCReceber.State = dsInactive)  then
    dmDados.tbCReceber.Open;
  if (dmDados.tbCPagar.State     = dsInactive)  then
    dmDados.tbCPagar.Open;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
  if dmdados.TbTipoDoc.RecordCount=0 then
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
end;

procedure TfrmCadTipoDoc.dbCodExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbTipoDoc.DatabaseName;
  Tabela.TableName    := dmDados.TbTipoDoc.TableName   ;
  Tabela.Open;
  if NovoItem then
    begin
    if dbCod.Text = '' then
      begin
      MsgDlg.MsgError('� necess�rio Informar o C�DIGO');
      dbCod.setfocus;
      end
    else
      begin
      if Tabela.Locate('CodDoc',dbCod.Text,[]) then
        begin
        if not ((DmDados.tbTipoDoc.State=dsEdit) And (dmDados.tbTipoDoc.RecNo = Tabela.RecNo)) then
          begin
          MsgDlg.MsgWarning('C�DIGO j� Cadastrado');
          dbCod.Clear;
          dbCod.setfocus;
          end;
        end;
      end;
    end;
  Tabela.Free;
end;

procedure TfrmCadTipoDoc.dbTipoDocExit(Sender: TObject);
Var
  Tabela: TTable;
begin
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.TbTipoDoc.DatabaseName;
  Tabela.TableName    := dmDados.TbTipoDoc.TableName   ;
  Tabela.Open;
  if NovoItem then
    begin
    if dbTipoDoc.Text = '' then
      begin
      MsgDlg.MsgError('� necess�rio Informar o DOCUMENTO');
      dbTipoDoc.setfocus;
      end
    else
      begin
      if Tabela.Locate('DESCRICAO',dbTipoDoc.Text,[]) then
        begin
        if not ((DmDados.tbTipoDoc.State=dsEdit) And (dmDados.tbTipoDoc.RecNo = Tabela.RecNo)) then
          begin
          MsgDlg.MsgWarning('DOCUMENTO j� Cadastrado');
          dbTipoDoc.Clear;
          dbTipoDoc.setfocus;
          end;
        end;
      end;
    end;
  Tabela.Free;
end;

procedure TfrmCadTipoDoc.btnPrimeiroClick(Sender: TObject);
begin
  dmdados.tbTipoDoc.First;
  Btnprimeiro.Enabled := False;
  BtnAnterior.Enabled := False;
  BtnProximo.Enabled  := True ;
  BtnUltimo.Enabled   := True ;
  dmdados.vTabStt     := True ;
end;

procedure TfrmCadTipoDoc.btnAnteriorClick(Sender: TObject);
begin
  dmdados.tbTipoDoc.Prior;
  BtnProximo.Enabled := True;
  BtnUltimo.Enabled  := True;
  if dmdados.TbTipoDoc.bof then
    begin
    BtnPrimeiro.Enabled := False;
    BtnAnterior.Enabled := False;
    end;
  dmdados.vTabStt := True;
end;

procedure TfrmCadTipoDoc.btnProximoClick(Sender: TObject);
begin
  dmdados.tbTipoDoc.next;
  BtnPrimeiro.Enabled := True;
  BtnAnterior.Enabled := True;
  if dmdados.TbTipoDoc.Eof then
    begin
    BtnProximo.Enabled := False;
    BtnUltimo.Enabled  := False;
    end;
  dmdados.vTabStt := True;
end;

procedure TfrmCadTipoDoc.btnUltimoClick(Sender: TObject);
begin
  dmdados.tbTipoDoc.last;
  BtnPrimeiro.Enabled := True ;
  BtnAnterior.Enabled := True ;
  BtnProximo.Enabled  := False;
  BtnUltimo.Enabled   := False;
  dmdados.vTabStt     := True ;
end;

procedure TfrmCadTipoDoc.btnNovoClick(Sender: TObject);
begin
  dmDados.tbTipoDoc.Append;
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
  gridTipoDoc.Enabled := True;
  dbTipoDoc.Enabled      := True;
  dbCod.Enabled       := True;
  dbCod.SetFocus;
end;

procedure TfrmCadTipoDoc.btnGravarClick(Sender: TObject);
Var
  Campos:String;
  Vazio,Gravar:Boolean;
  tabela: ttable;
begin
  Campos:='';
  Gravar:=True;
  Vazio:=False;
  Tabela := TTable.Create(Application);
  Tabela.DatabaseName := dmDados.tbTipoDoc.DatabaseName;
  Tabela.TableName    := dmDados.tbTipoDoc.TableName   ;
  Tabela.IndexName    := dmdados.tbTipoDoc.IndexName   ;
  Tabela.Open;
	if dbCod.Text='' then
  	begin
    if Length(Campos)>0 then
    	Campos:=Campos+', ';
    Campos:=Campos+'C�digo';
    Gravar:=False;
    Vazio:=True;
  	end
   else
     begin
     if Tabela.Locate('CodDoc',dbCod.Text,[]) then
       if not((DmDados.tbTipoDoc.State=dsEdit) And (dmDados.tbTipoDoc.RecNo = Tabela.RecNo)) then
          begin
          Gravar:=False;
          MsgDlg.MsgWarning('C�DIGO j� cadastrado');
          end;
     end;
	if dbTipoDoc.Text='' then
  	begin
    if Length(Campos)>0 then
    	Campos:=Campos+', ';
    Campos:=Campos+'Documento';
    Gravar:=False;
    Vazio:=True;
  	end
   else
     begin
     if Tabela.Locate('Descricao',dbTipoDoc.Text,[]) then
       if not((DmDados.tbTipoDoc.State=dsEdit) And (dmDados.tbTipoDoc.RecNo = Tabela.RecNo)) then
          begin
          Gravar:=False;
          MsgDlg.MsgWarning('DOCUMENTO j� cadastrado');
          end;
     end;
  if gravar then
    begin
    NovoItem := False;
    dmdados.tbTipoDoc.Post;
    dmDados.vTabStt     := True ;
    BtnGravar.enabled   := False;
    BtnCancelar.Enabled := False;
    BtnNovo.Enabled     := True ;
    BtnPrimeiro.Enabled := True ;
    BtnAnterior.Enabled := True ;
    BtnProximo.Enabled  := True ;
    BtnUltimo.Enabled   := True ;
    {if (frmPrincipal.Acesso=1) or (frmPrincipal.Acesso=2) then
      BtnAlterar.Enabled := True;
    if (frmPrincipal.Acesso=1) then
      Btndeletar.Enabled := True ;}
    gridTipoDoc.Enabled  := False;
    dbTipoDoc.Enabled    := False;
    dbCod.Enabled        := False;
    MsgDlg.MsgInformation('Dados gravados com sucesso!');
    pnBotoes.SetFocus;
    end
  else
    begin
    if Vazio then
      MsgDlg.MsgWarning('O(s) Campo(s) '+Campos+' n�o tem Valor(es) ');
      dbCod.Enabled:=true;
    end;
  Tabela.Free;
end;

procedure TfrmCadTipoDoc.btnCancelarClick(Sender: TObject);
begin
  dmdados.tbTipoDoc.cancel;
  NovoItem       := False;
  dmdados.vTabStt:= True ;
  {Desabilitando os bot�es}
  BtnGravar.enabled   := False;
  BtnCancelar.Enabled := False;
  BtnNovo.Enabled     := True ;
  btnPrimeiro.Enabled := True ;
  BtnAnterior.Enabled := True ;
  Btnproximo.Enabled  := True ;
  BtnUltimo.Enabled    := True;
  {if (frmPrincipal.Acesso=1) or (frmPrincipal.Acesso=2) then
    BtnAlterar.Enabled := True;
  if (frmPrincipal.Acesso=1) then
    Btndeletar.Enabled := True; }
  {Habilitando os componentes}
  dbTipoDoc.enabled      := False;
  dbCod.Enabled       := False;
  gridTipoDoc.Enabled := False;
  pnBotoes.SetFocus;
end;

procedure TfrmCadTipoDoc.btnAlterarClick(Sender: TObject);
begin
  if dmdados.tbTipoDoc.RecordCount=0 then
    MsgDlg.MsgInformation('Tabela vazia')
  else
    begin
    novoitem        := True ;
    dmdados.vTabStt := False;
    dmdados.tbTipoDoc.Edit;
    //habilitar bot�es
    BtnCancelar.Enabled := True;
    BtnGravar.Enabled   := True;
    BtnNovo.Enabled     := False;
    BtnPrimeiro.Enabled := False;
    BtnAnterior.Enabled := False;
    BtnProximo.Enabled  := False;
    BtnUltimo.Enabled   := False;
    BtnAlterar.Enabled  := False;
    Btndeletar.Enabled  := False;
    //habilitar objetos
    dbTipoDoc.Enabled      := True;
    dbCod.Enabled       := True;
    gridTipoDoc.Enabled := True;
    dbCod.SetFocus;
    end;
end;

procedure TfrmCadTipoDoc.btnDeletarClick(Sender: TObject);
var
  flag:boolean;
begin
  NovoItem := False;
  Flag     := False;
  if dmdados.tbTipoDoc.RecordCount=0 then
    MsgDlg.MsgInformation('Tabela vazia')
  else
  if MsgDlg.MsgConfirmation('Tem certeza que deseja exluir esse registro?') = id_yes then
    begin
      if dmDados.tbCReceber.Locate('CodDoc',dmDados.tbTipoDocCodDoc.Value,[]) then
        Flag:=True;
      if dmDados.tbCPagar.Locate('CodDoc',dmDados.tbTipoDocCodDoc.Value,[]) then
        Flag:=True;
      if Flag then
        MsgDlg.MsgWarning('Documento ativo, ou com registro de opera��es anteriores, n�o pode ser exclu�do !!!')
      else
        dmdados.TbTipoDoc.Delete;
    end
  else
    dmdados.tbTipoDoc.Cancel;
end;

end.
