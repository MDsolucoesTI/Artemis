//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Ultima modificacao: 03/2007
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untCargos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolEdit, RXDBCtrl, Grids, DBGrids, SpeedBar, jpeg, ExtCtrls, StdCtrls,
  RackCtls, fcButton, fcImgBtn, RXSplit, Mask, DBCtrls, RXCtrls, ComCtrls,
  db,dbutils, CurrEdit,dbTables, LMDCustomComponent, LMDCustomHint,
  LMDCustomShapeHint, LMDShapeHint, EFocCol, RxGrdCpt, fcImager, EMsgDlg,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDBackPanel, fcLabel, EGrad, JvComponent,
  JvTransBtn, JvLabel, JvEnterTab, JvDBCtrl;

type
  TfrmCargos = class(TForm)
    pnTop: TLMDBackPanel;
    pnCentro: TLMDBackPanel;
    pnBotoes: TLMDBackPanel;
    fcLabel1: TfcLabel;
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
    dbCargo: TDBEdit;
    JvLabel10: TJvLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    GridCargo: TJvDBGrid;
    MsgDlg: TEvMsgDlg;
    procedure BtnSairClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCargos  : TfrmCargos ;
  NovoItem   : Boolean    ;
  mudar      : Boolean    ;
  vAltera    : Boolean    ;

implementation

uses untDmDados, untPrincipal;

{$R *.DFM}

procedure TfrmCargos.BtnSairClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmCargos.btnPrimeiroClick(Sender: TObject);
begin
  dmdados.tbCargo.First;
  Btnprimeiro.Enabled := False;
  BtnAnterior.Enabled := False;
  BtnProximo.Enabled  := True ;
  BtnUltimo.Enabled   := True ;
end;

procedure TfrmCargos.btnAnteriorClick(Sender: TObject);
begin
  dmdados.tbCargo.Prior;
  BtnProximo.Enabled  := True ;
  BtnUltimo.Enabled   := True ;
  If dmdados.tbCargo.bof Then
  Begin
    BtnPrimeiro.Enabled := False;
    BtnAnterior.Enabled := False;
  End;
end;

procedure TfrmCargos.btnProximoClick(Sender: TObject);
begin
 dmdados.tbCargo.Next;
  BtnPrimeiro.Enabled := True ;
  BtnAnterior.Enabled := True ;
  If dmdados.tbCargo.Eof Then
  Begin
    BtnProximo.Enabled := False;
    BtnUltimo.Enabled  := False;
  End;
end;

procedure TfrmCargos.btnUltimoClick(Sender: TObject);
begin
  dmdados.tbCargo.Last;
  BtnPrimeiro.Enabled := True ;
  BtnAnterior.Enabled := True ;
  BtnProximo.Enabled  := False;
  BtnUltimo.Enabled   := False;
end;

procedure TfrmCargos.btnNovoClick(Sender: TObject);
begin
  dmDados.tbCargo.Append;
  NovoItem:=True;
  dmdados.vTabStt:=false;
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
  {habilitando os componentes}
  DBcargo.Enabled:=True;
  DBcargo.SetFocus;
end;

procedure TfrmCargos.FormActivate(Sender: TObject);
begin
  NovoItem:= false;
  if (dmDados.tbCargo.State = dsInactive)  then
    dmDados.tbCargo.Open;
  FrmPrincipal.StatusTeclas(True,'[Insert] Novo [Home] Alterar [End] Gravar [Delete] Excluir [Esc] Cancelar ou Sair');
end;

procedure TfrmCargos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmdados.tbCargo.Close;
  FrmPrincipal.StatusTeclas(False,'');
  Action := caFree;
end;

procedure TfrmCargos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case (key) of
    // Teclas de a��o na tabela
    VK_Insert : if (dmDados.vTabStt) then BtnNovo.Click;
    VK_Home   : if (dmDados.vTabStt) then BtnAlterar.Click;
    VK_Delete : if (dmDados.vTabStt) then BtnDeletar.Click;
    VK_End    : if not(dmDados.vTabStt) then BtnGravar.Click;
    VK_ESCAPE : if not(dmDados.vTabStt) then BtnCancelar.Click
                else BtnSair.Click;
  end;
end;

procedure TfrmCargos.btnGravarClick(Sender: TObject);
begin
  dmDados.tbCargo.Post;
  NovoItem            := False;
  dmdados.vTabStt     := True ;
  {habilitando os bot�es}
  BtnGravar.Enabled   := False ;
  BtnCancelar.Enabled := False ;
  BtnNovo.Enabled     := True  ;
  BtnPrimeiro.Enabled := True  ;
  BtnAnterior.Enabled := True  ;
  BtnProximo.Enabled  := True  ;
  BtnUltimo.Enabled   := True  ;
  BtnAlterar.Enabled  := True  ;
  BtnDeletar.Enabled  := True  ;
  {habilitando os componentes}
  DBcargo.Enabled     := False;
  MsgDlg.MsgInformation('Dados gravados com sucesso!');
  dmDados.tbCargo.Refresh;
  pnBotoes.SetFocus;
end;

procedure TfrmCargos.btnCancelarClick(Sender: TObject);
begin
  dmDados.tbCargo.Cancel;
  NovoItem            := False;
  dmdados.vTabStt     := True ;
  {habilitando os bot�es}
  BtnGravar.Enabled   := False ;
  BtnCancelar.Enabled := False ;
  BtnNovo.Enabled     := True  ;
  BtnPrimeiro.Enabled := True  ;
  BtnAnterior.Enabled := True  ;
  BtnProximo.Enabled  := True  ;
  BtnUltimo.Enabled   := True  ;
  BtnAlterar.Enabled  := True  ;
  BtnDeletar.Enabled  := True  ;
  {habilitando os componentes}
  DBcargo.Enabled     := False;
  pnBotoes.SetFocus;
end;

end.
