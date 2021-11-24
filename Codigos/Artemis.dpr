//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Ultima modificacao: 03/2007
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

program Artemis;

uses
  Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  untdmDados in 'untdmDados.pas' {dmDados: TDataModule},
  UnitCadBanco in 'UnitCadBanco.pas' {FrmCadBanco},
  UnitCartao in 'UnitCartao.pas' {FrmCartao},
  UnitCCorrente in 'UnitCCorrente.pas' {FrmCCorrente},
  unitFunc in 'unitFunc.pas' {FrmFuncionario},
  UnitLocFunc in 'UnitLocFunc.pas' {FrmLocFunc},
  untLocFornec in 'untLocFornec.pas' {frmLocFornec},
  untCargos in 'untCargos.pas' {frmCargos},
  untCadFornec in 'untCadFornec.pas' {frmCadFornec},
  untCadHistorico in 'untCadHistorico.pas' {frmCadHistorico},
  untCadTipoDoc in 'untCadTipoDoc.pas' {frmCadTipoDoc},
  untCadIndice in 'untCadIndice.pas' {frmCadIndice},
  untCPagar in 'untCPagar.pas' {frmCPagar},
  unitCreceber in 'UnitCReceber.pas' {frmCReceber};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TFrmCadBanco, FrmCadBanco);
  Application.CreateForm(TFrmCartao, FrmCartao);
  Application.CreateForm(TFrmCCorrente, FrmCCorrente);
  Application.CreateForm(TFrmFuncionario, FrmFuncionario);
  Application.CreateForm(TFrmLocFunc, FrmLocFunc);
  Application.CreateForm(TfrmLocFornec, frmLocFornec);
  Application.CreateForm(TfrmCargos, frmCargos);
  Application.CreateForm(TfrmCadFornec, frmCadFornec);
  Application.CreateForm(TfrmCadHistorico, frmCadHistorico);
  Application.CreateForm(TfrmCadTipoDoc, frmCadTipoDoc);
  Application.CreateForm(TfrmCadIndice, frmCadIndice);
  Application.CreateForm(TfrmCPagar, frmCPagar);
  Application.CreateForm(TfrmCReceber, frmCReceber);
  Application.Run;
end.
