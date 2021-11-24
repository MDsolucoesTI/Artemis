//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Ultima modificacao: 03/2007
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponent, JvTransBtn, ExtCtrls, fcpanel, ComCtrls, WinSkinData,
  Menus, EHintBal, jpeg, ELibFnc, EWall, fcImager, ImgList, EAppProt,
  ExtDlgs, EUserAcs, EPaswd, DB, DBTables, EMsgDlg, ECripto;

type
  TfrmPrincipal = class(TForm)
    fcPanel1: TfcPanel;
    btnCadFornec: TJvTransparentButton;
    fcPanel2: TfcPanel;
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Funcionrio2: TMenuItem;
    Cargo1: TMenuItem;
    Cadastro1: TMenuItem;
    Fornecedor1: TMenuItem;
    Sair1: TMenuItem;
    artemis1: TMenuItem;
    Histrico1: TMenuItem;
    ipodeDocumento1: TMenuItem;
    CartesConvnios1: TMenuItem;
    Bancos1: TMenuItem;
    ContaCorrente1: TMenuItem;
    Financeiro1: TMenuItem;
    ContasaPagar1: TMenuItem;
    Lanamento1: TMenuItem;
    RecebimentodeContas1: TMenuItem;
    CancelamentodeContas1: TMenuItem;
    ContasaReceber1: TMenuItem;
    Lanamento2: TMenuItem;
    RecebimentodeContas2: TMenuItem;
    CancelamentodeContas2: TMenuItem;
    CaixaBanco1: TMenuItem;
    Lanamento3: TMenuItem;
    Fechamento1: TMenuItem;
    N3: TMenuItem;
    ControleBancrio1: TMenuItem;
    Lanamento4: TMenuItem;
    Fechamento2: TMenuItem;
    ransferncia1: TMenuItem;
    N5: TMenuItem;
    Extratos1: TMenuItem;
    Saldos1: TMenuItem;
    SaldoConsolidado1: TMenuItem;
    ChequesRecebidos1: TMenuItem;
    Lanamento5: TMenuItem;
    Baixa1: TMenuItem;
    ChequesemFundos1: TMenuItem;
    RenegociarCheques1: TMenuItem;
    Consultar1: TMenuItem;
    Relatrio1: TMenuItem;
    Funcionrio3: TMenuItem;
    Fornecedor2: TMenuItem;
    N6: TMenuItem;
    Caixa1: TMenuItem;
    otaldeEntradas1: TMenuItem;
    otaldeSadas1: TMenuItem;
    LanamentonoCaixa1: TMenuItem;
    ChequesRecebidos2: TMenuItem;
    ContasaPagar2: TMenuItem;
    ContasaReceber2: TMenuItem;
    BalanoFinanceiro1: TMenuItem;
    SaldoseExtratos1: TMenuItem;
    Utilitrios1: TMenuItem;
    OpesdoSistema1: TMenuItem;
    MudarAparncia1: TMenuItem;
    Senhas1: TMenuItem;
    MudarUsurio1: TMenuItem;
    N1: TMenuItem;
    Backup1: TMenuItem;
    Calculadora1: TMenuItem;
    Ajuda1: TMenuItem;
    MenuItem5: TMenuItem;
    EnviesuaDvidapeloEmail1: TMenuItem;
    SobreoEROS1: TMenuItem;
    EvHintBalloon1: TEvHintBalloon;
    N11: TMenuItem;
    EnviarMensagem1: TMenuItem;
    N12: TMenuItem;
    Calendrio1: TMenuItem;
    EditordeTextos1: TMenuItem;
    ChequesEmitidos2: TMenuItem;
    N14: TMenuItem;
    ChequesEmitidos3: TMenuItem;
    ndicesFinanceiros1: TMenuItem;
    Configuraes1: TMenuItem;
    btnSair: TJvTransparentButton;
    btnCR: TJvTransparentButton;
    btnCP: TJvTransparentButton;
    btnBackup: TJvTransparentButton;
    btnAjuda: TJvTransparentButton;
    Funcoes: TEvLibFunctions;
    ConfigurarCabealhoeRodap1: TMenuItem;
    ConfigurarFichadeAnamnese1: TMenuItem;
    EvAppProtect1: TEvAppProtect;
    Opd1: TOpenPictureDialog;
    imgBarra: TImageList;
    EvPassword1: TEvPassword;
    evCripto: TEvCriptografa;
    UserAcess: TEvUserAccess;
    Table1: TTable;
    Table1Usuario: TStringField;
    Table1Senha: TStringField;
    Table1TipoAcesso: TStringField;
    UsuriodoSistema1: TMenuItem;
    ChequesemAberto1: TMenuItem;
    ChequesDevolvidos1: TMenuItem;
    ChequesDevolvidosporCliente1: TMenuItem;
    sd1: TSkinData;
    MsgDlg: TEvMsgDlg;
    Configuraes2: TMenuItem;
    Biblioteca1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    procedure StatusTeclas(vAcao:boolean;vTeclas:string);
    Function  CalcIdade(D1,D2:TDateTime):string;
    procedure btnSairClick(Sender: TObject);
    procedure btnCadFornecClick(Sender: TObject);
    procedure Cargo1Click(Sender: TObject);
    procedure Cadastro1Click(Sender: TObject);
    procedure Fornecedor1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Histrico1Click(Sender: TObject);
    procedure ipodeDocumento1Click(Sender: TObject);
    procedure Bancos1Click(Sender: TObject);
    procedure ContaCorrente1Click(Sender: TObject);
    procedure CartesConvnios1Click(Sender: TObject);
    procedure ndicesFinanceiros1Click(Sender: TObject);
    procedure Lanamento1Click(Sender: TObject);
    procedure RecebimentodeContas1Click(Sender: TObject);
    procedure Lanamento2Click(Sender: TObject);
    procedure RecebimentodeContas2Click(Sender: TObject);
    procedure CancelamentodeContas1Click(Sender: TObject);
    procedure CancelamentodeContas2Click(Sender: TObject);
    procedure MudarAparncia1Click(Sender: TObject);
    procedure Funcionrio3Click(Sender: TObject);
    procedure Fornecedor2Click(Sender: TObject);
    procedure EvPassword1AfterInput(Sender: TObject);
    procedure EvPassword1BeforeInput(Sender: TObject);
    procedure EvPassword1Error(Sender: TObject; Error: TEvPasswordError);
    procedure EvPassword1Validate(Sender: TObject; UserName,
      Password: String; var Valid: Boolean);
    procedure btnCRClick(Sender: TObject);
    procedure btnCPClick(Sender: TObject);
    procedure UsuriodoSistema1Click(Sender: TObject);
    procedure MudarUsurio1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Lanamento5Click(Sender: TObject);
    procedure Baixa1Click(Sender: TObject);
    procedure ChequesemFundos1Click(Sender: TObject);
    procedure RenegociarCheques1Click(Sender: TObject);
    procedure Consultar1Click(Sender: TObject);
    procedure ChequesemAberto1Click(Sender: TObject);
    procedure ChequesDevolvidos1Click(Sender: TObject);
    procedure ChequesDevolvidosporCliente1Click(Sender: TObject);
    procedure ContasaReceber2Click(Sender: TObject);
    procedure Lanamento4Click(Sender: TObject);
    procedure Fechamento2Click(Sender: TObject);
    procedure SaldoseExtratos1Click(Sender: TObject);
    procedure ContasaPagar2Click(Sender: TObject);
    procedure Configuraes2Click(Sender: TObject);
    procedure Calculadora1Click(Sender: TObject);
  private
    { Private declarations }
    fAcesso : integer;
    fUser : string;
  public
    { Public declarations }
    property Acesso : integer read fAcesso write fAcesso;
    property User : string read fUser write fUser;    
  end;

var
  frmPrincipal : TfrmPrincipal         ;
  ListaTeclas  : String                ;
  PilhaTeclas  : array[1..10] of string;
  Topo         : integer               ;
  Acao         : boolean               ;

implementation

uses untCargos, untCadFunc, untCadFornec, untdmDados, untCadTipoDoc, untCadBanco,
     untCadHistorico, untCadCCorrente, untCadCartao, untCadIndice, untCPagar,
     untBaixaLoteCP, untBaixaLoteCR, untCancelCP, untCancelCR, SkinGraphic,
     untRelFunc, untRelFornec, unitCreceber, unitLanCheque, unitBaixaCheque,
     unitLanChequeSF, unitRenCheque, unitConsultaCPF, unitRelCheAberto, untRelCheDev,
     untRelCheDevCli, UnitRelCReceber, UnitMovCaixa, UnitFechCC, unitRelMovConta,
     unitRelCpagar, untParametro;

{$R *.dfm}

procedure TfrmPrincipal.StatusTeclas(vAcao:boolean;vTeclas:string);
begin
  if vAcao then
    begin
    Topo:=Topo + 1;
    if Topo > 0 Then
      PilhaTeclas[Topo]:=StatusBar1.Panels[0].Text;
    StatusBar1.Panels[0].Text:=vTeclas;
    end
  else
    begin
    StatusBar1.Panels[0].Text:=PilhaTeclas[Topo];
    Topo:=Topo-1;
    end;
end;                                            

Function TfrmPrincipal.CalcIdade(D1,D2:TDateTime):string;
var
  Anos     : integer;
  Meses    : integer;
  Dias     : integer;
  Sobra    : integer;
begin
  Dias  := DaysBetween(D1,D2);
  Anos  := Dias div 365      ;
  Sobra := Dias mod 365      ;
  Meses := Sobra div 30      ;
  Dias  := Sobra mod 30      ;
  CalcIdade := IntToStr(Anos)+' a '+IntToStr(Meses)+' m ';
end;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.btnCadFornecClick(Sender: TObject);
begin
  frmCadFornec:= TfrmCadFornec.create(application);
  frmCadFornec.Show;
end;

procedure TfrmPrincipal.Cargo1Click(Sender: TObject);
begin
  frmCargos := TfrmCargos.create(application);
  frmCargos.Show;
end;

procedure TfrmPrincipal.Cadastro1Click(Sender: TObject);
begin
  frmCadFunc := TfrmCadFunc.create(application);
  frmCadFunc.Show;
end;

procedure TfrmPrincipal.Fornecedor1Click(Sender: TObject);
begin
  frmCadFornec := TfrmCadFornec.create(application);
  frmCadFornec.Show;
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case (key) of
    // Teclas de navega��o
    VK_F2     : btnCadFornec.Click;
    VK_F3     : btnCR.Click;
    VK_F4     : btnCP.Click;
    VK_ESCAPE : close;
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  Topo := 0;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDados.BaseDados.Connected := False;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  dmDados.BaseDados.Connected := True;
  Topo:= -1;
  ListaTeclas:='[F1] Ajuda [F2] Fornecedores [F3] Contas a Receber [F4] Contas a Pagar [ESC] Sai';
  StatusTeclas(True,ListaTeclas);
  dmDados.BaseDados.Connected := True;
  dmDados.tbSenha.Open;
  if table1.RecordCount=1 then  //obriga o cadastro de senha no 1� uso
    begin
    frmCadSenha:=tfrmCadSenha.create(application);
    frmCadSenha.showModal;
    end;
  evPassword1.Execute;
  UserAcess.UserID:=frmPrincipal.Acesso;
  UserAcess.ForceDefinitions;
end;

procedure TfrmPrincipal.Histrico1Click(Sender: TObject);
begin
  frmCadHistorico := tfrmCadHistorico.create(application);
  frmCadHistorico.show;
end;

procedure TfrmPrincipal.ipodeDocumento1Click(Sender: TObject);
begin
  frmCadTipoDoc := tfrmCadTipoDoc.create(application);
  frmCadTipoDoc.show;
end;

procedure TfrmPrincipal.Bancos1Click(Sender: TObject);
begin
  frmCadBanco := TfrmCadBanco.Create(application);
  frmCadBanco.Show;
end;

procedure TfrmPrincipal.ContaCorrente1Click(Sender: TObject);
begin
  frmCadCCorrente := TfrmCadCCorrente.Create(application);
  frmCadCCorrente.Show;
end;

procedure TfrmPrincipal.CartesConvnios1Click(Sender: TObject);
begin
  frmCadCartao := TfrmCadCartao.create(application);
  frmCadCartao.Show;
end;

procedure TfrmPrincipal.ndicesFinanceiros1Click(Sender: TObject);
begin
  frmCadIndice := TfrmCadIndice.create(application);
  frmCadIndice.Show;
end;

procedure TfrmPrincipal.Lanamento1Click(Sender: TObject);
begin
  frmCPagar := TfrmCPagar.create(application);
  frmCPagar.Show;
end;

procedure TfrmPrincipal.RecebimentodeContas1Click(Sender: TObject);
begin
  frmBaixaLoteCP := TfrmBaixaLoteCP.create(application);
  frmBaixaLoteCP.Show;
end;

procedure TfrmPrincipal.Lanamento2Click(Sender: TObject);
begin
  frmCReceber := TfrmCReceber.create(application);
  frmCReceber.Show;
end;

procedure TfrmPrincipal.RecebimentodeContas2Click(Sender: TObject);
begin
  frmBaixaLoteCR := TfrmBaixaLoteCR.create(application);
  frmBaixaLoteCR.Show;
end;

procedure TfrmPrincipal.CancelamentodeContas1Click(Sender: TObject);
begin
  frmCancelCP := TfrmCancelCP.create(application);
  frmCancelCP.Show;
end;

procedure TfrmPrincipal.CancelamentodeContas2Click(Sender: TObject);
begin
  frmCancelCR := TfrmCancelCR.create(application);
  frmCancelCR.Show;
end;

procedure TfrmPrincipal.MudarAparncia1Click(Sender: TObject);
begin
  opd1.InitialDir:='..\skins';//ExtractFilePath(ParamStr(0));
  opd1.Filter:= 'Text files (*.skn)|*.skn';
  if opd1.Execute then begin
     sd1.SkinFile:=opd1.FileName;
  end;
end;

procedure TfrmPrincipal.Funcionrio3Click(Sender: TObject);
begin
  frmRelFunc := TfrmRelFunc.create(application);
  frmRelFunc.Show;
end;

procedure TfrmPrincipal.Fornecedor2Click(Sender: TObject);
begin
  frmRelFornec := TfrmRelFornec.create(application);
  frmRelFornec.Show;
end;

procedure TfrmPrincipal.EvPassword1AfterInput(Sender: TObject);
begin
  Table1.Close;
end;

procedure TfrmPrincipal.EvPassword1BeforeInput(Sender: TObject);
begin
  table1.Open;
end;

procedure TfrmPrincipal.EvPassword1Error(Sender: TObject;
  Error: TEvPasswordError);
begin
  MsgDlg.MsgWarning('Nome de Usu�rio e Senha n�o correspondem!.|A aplica��o ser� terminada.');
  Application.Terminate;
end;

procedure TfrmPrincipal.EvPassword1Validate(Sender: TObject; UserName,
  Password: String; var Valid: Boolean);
begin
  if Table1.FindKey([username]) then
    begin
    Valid  := EvCripto.CriptoBinToText(Table1senha.AsString) = Password;
    Acesso := StrtoInt(Table1TipoAcesso.Value);
    User   := Table1Usuario.Value;
    end
  else
    ShowMessage('O nome de usu�rio e senha informado n�o s�o v�lidos.');
end;

procedure TfrmPrincipal.btnCRClick(Sender: TObject);
begin
  frmCReceber := TfrmCReceber.create(application);
  frmCReceber.Show;
end;

procedure TfrmPrincipal.btnCPClick(Sender: TObject);
begin
  frmCPagar := TfrmCPagar.create(application);
  frmCPagar.Show;
end;

procedure TfrmPrincipal.UsuriodoSistema1Click(Sender: TObject);
begin
  frmCadSenha := TfrmCadSenha.create(application);
  frmCadSenha.Show;
end;

procedure TfrmPrincipal.MudarUsurio1Click(Sender: TObject);
begin
  EvPassword1.Execute;
  UserAcess.UserID := frmPrincipal.Acesso;
  UserAcess.ForceDefinitions;
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
 { if (frmPrincipal.Acesso=1) then
    begin
    btnOdonto.Enabled    := True;
    btnOrcamento.Enabled := True;
    end
  else
    btnOdonto.Enabled    := False;
    btnOrcamento.Enabled := False;}
end;

procedure TfrmPrincipal.Lanamento5Click(Sender: TObject);
begin
  frmLanCheque := TfrmLanCheque.create(application);
  frmLanCheque.Show;
end;

procedure TfrmPrincipal.Baixa1Click(Sender: TObject);
begin
  FrmBaixaCheque:=TFrmbaixaCheque.create(application);
  FrmBaixaCheque.Show;
end;

procedure TfrmPrincipal.ChequesemFundos1Click(Sender: TObject);
begin
  FrmLanChequeSF:=TFrmLanChequeSF.create(application);
  FrmLanChequeSF.Show;
end;

procedure TfrmPrincipal.RenegociarCheques1Click(Sender: TObject);
begin
  FrmRengCheque:=TFrmRengCheque.create(application);
  FrmRengCheque.Show;
end;

procedure TfrmPrincipal.Consultar1Click(Sender: TObject);
begin
  FrmConsultaCPF:=TFrmConsultaCPF.create(application);
  FrmConsultaCPF.Show;
end;

procedure TfrmPrincipal.ChequesemAberto1Click(Sender: TObject);
begin
  frmRelCheAberto:=TfrmRelCheAberto.create(application);
  frmRelCheAberto.show;
end;

procedure TfrmPrincipal.ChequesDevolvidos1Click(Sender: TObject);
begin
  frmRelCheDev:=TfrmRelCheDev.create(application);
  frmRelCheDev.show;
end;

procedure TfrmPrincipal.ChequesDevolvidosporCliente1Click(Sender: TObject);
begin
  frmRelCheDevCli:=TfrmRelCheDevCli.create(application);
  frmRelCheDevCli.show;
end;

procedure TfrmPrincipal.ContasaReceber2Click(Sender: TObject);
begin
  frmRelCReceber := TfrmRelCReceber.Create(Application);
  frmRelCReceber.ShowModal;
end;

procedure TfrmPrincipal.Lanamento4Click(Sender: TObject);
begin
  FrmMovCaixa:=TFrmMovCaixa.create(application);
  FrmMovCaixa.Show;
end;

procedure TfrmPrincipal.Fechamento2Click(Sender: TObject);
begin
  FrmFechCC:=TFrmFechCC.create(application);
  FrmFechCC.show;
end;

procedure TfrmPrincipal.SaldoseExtratos1Click(Sender: TObject);
begin
  frmRelMovConta:=tfrmRelMovConta.create(application);
  frmRelMovConta.show;
end;

procedure TfrmPrincipal.ContasaPagar2Click(Sender: TObject);
begin
  FrmRelCpagar:=TFrmRelCpagar.create(application);
  FrmRelCpagar.showmodal;
end;

procedure TfrmPrincipal.Configuraes2Click(Sender: TObject);
begin
  frmParametro:=TfrmParametro.Create(Application);
  frmParametro.Show;
end;

procedure TfrmPrincipal.Calculadora1Click(Sender: TObject);
begin
  WinExec('Calc.exe',SW_SHOWNORMAL);
end;

end.
