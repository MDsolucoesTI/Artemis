//////////////////////////////////////////////////////////////////////////
// Criacao...........: 02/2001
// Ultima modificacao: 03/2007
// Sistema...........: Artemis - Controle de Financeiro
// Integracao........: Olimpo - Automacao Comercial
// Analistas.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Desenvolvedores...: Marilene Esquiavoni & Denny Paulista Azevedo Filho
// Copyright.........: Marilene Esquiavoni & Denny Paulista Azevedo Filho
//////////////////////////////////////////////////////////////////////////

unit untdmDados;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBDatabase, IBTable, IBSQL,
  IBQuery, DBTables;

type
  TdmDados = class(TDataModule)
    dsPais: TDataSource;
    dsVisEstado: TDataSource;
    dsVisCidade: TDataSource;
    dsCargo: TDataSource;
    dsFuncionario: TDataSource;
    dsConvenio: TDataSource;
    dsPaciente: TDataSource;
    dsProfissional: TDataSource;
    dsProtetico: TDataSource;
    dsFornecedor: TDataSource;
    dsCidade: TDataSource;
    dsEstado: TDataSource;
    dsGrupo: TDataSource;
    dsSubGrupo: TDataSource;
    dsUnidade: TDataSource;
    dsMarca: TDataSource;
    dsMovEstoque: TDataSource;
    dsMaterial: TDataSource;
    dsAgenda: TDataSource;
    dsHorario: TDataSource;
    dsSalaEspera: TDataSource;
    dsAgendamento: TDataSource;
    dsTipoAtende: TDataSource;
    BaseDados: TDatabase;
    tbPais: TTable;
    tbEstado: TTable;
    tbCidade: TTable;
    tbPaisPAI_SIGLA: TStringField;
    tbPaisPAI_NOME: TStringField;
    tbEstadoEST_SIGLA: TStringField;
    tbEstadoEST_NOME: TStringField;
    tbEstadoPAI_SIGLA: TStringField;
    tbCidadeCID_CODIGO: TAutoIncField;
    tbCidadeCID_NOME: TStringField;
    tbCidadeEST_SIGLA: TStringField;
    tbVisEstado: TTable;
    tbVisCidade: TTable;
    tbVisCidadeCID_CODIGO: TAutoIncField;
    tbVisCidadeCID_NOME: TStringField;
    tbVisCidadeEST_SIGLA: TStringField;
    tbVisEstadoEST_SIGLA: TStringField;
    tbVisEstadoEST_NOME: TStringField;
    tbVisEstadoPAI_SIGLA: TStringField;
    tbCargo: TTable;
    tbCargoCAR_CODIGO: TAutoIncField;
    tbCargoCAR_CARGO: TStringField;
    tbFuncionario: TTable;
    tbFuncionarioFUN_CODIGO: TAutoIncField;
    tbFuncionarioFUN_NOME: TStringField;
    tbFuncionarioFUN_DTADMIS: TDateField;
    tbFuncionarioCAR_CODIGO: TIntegerField;
    tbFuncionarioFUN_SALFIXO: TCurrencyField;
    tbFuncionarioFUN_DTNASC: TDateField;
    tbFuncionarioFUN_CPF: TStringField;
    tbFuncionarioFUN_RG: TStringField;
    tbFuncionarioFUN_RUA: TStringField;
    tbFuncionarioFUN_NUM: TSmallintField;
    tbFuncionarioFUN_COMPLE: TStringField;
    tbFuncionarioFUN_BAIRRO: TStringField;
    tbFuncionarioFUN_CEP: TStringField;
    tbFuncionarioCID_CODIGO: TIntegerField;
    tbFuncionarioFUN_TIPOTEL1: TStringField;
    tbFuncionarioFUN_TEL1: TStringField;
    tbFuncionarioFUN_TIPOTEL2: TStringField;
    tbFuncionarioFUN_TEL2: TStringField;
    tbFuncionarioFUN_TIPOTEL3: TStringField;
    tbFuncionarioFUN_TEL3: TStringField;
    tbFuncionarioFUN_FOTO: TGraphicField;
    tbFuncionarioFUN_OBS: TMemoField;
    tbFuncionarioFUN_DATACAD: TDateField;
    tbFuncionariolkUF: TStringField;
    tbFuncionarioIdade: TStringField;
    tbGrupo: TTable;
    tbGrupoGRU_CODIGO: TAutoIncField;
    tbGrupoGRU_NOME: TStringField;
    tbSubGrupo: TTable;
    tbUnidade: TTable;
    tbUnidadeUNI_SIGLA: TStringField;
    tbUnidadeUNI_NOME: TStringField;
    tbMarca: TTable;
    tbMaterial: TTable;
    tbMarcaMAR_CODIGO: TAutoIncField;
    tbMarcaMAR_NOME: TStringField;
    tbMaterialMAT_CODIGO: TStringField;
    tbMaterialMAT_NOME: TStringField;
    tbMaterialSBG_CODIGO: TIntegerField;
    tbMaterialMAR_CODIGO: TIntegerField;
    tbMaterialUNI_SIGLA: TStringField;
    tbMaterialMAT_ESTOMIN: TFloatField;
    tbMaterialMAT_ESTOMAX: TFloatField;
    tbMaterialMAT_ESTOATUAL: TFloatField;
    tbMaterialMAT_PRECOMPRA: TCurrencyField;
    tbMaterialMAT_FOTO: TGraphicField;
    tbMaterialMAT_DATACAD: TDateField;
    tbMaterialMAT_ULTIMACOMP: TDateField;
    tbMateriallkGrupo: TStringField;
    tbSubGrupoSBG_CODIGO: TIntegerField;
    tbSubGrupoGRU_CODIGO: TIntegerField;
    tbSubGrupoSBG_NOME: TStringField;
    tbSubGrupolkGrupo: TStringField;
    tbMovEstoque: TTable;
    tbMovEstoqueMVE_CODIGO: TAutoIncField;
    tbMovEstoqueMAT_CODIGO: TStringField;
    tbMovEstoqueFUN_CODIGO: TIntegerField;
    tbMovEstoqueMVE_QTD: TFloatField;
    tbMovEstoqueMVE_TIPO: TStringField;
    tbMovEstoqueMVE_MOTIVO: TMemoField;
    tbMovEstoqueMVE_DATA: TDateField;
    tbMovEstoqueMVE_HORA: TTimeField;
    tbConvenio: TTable;
    tbConvenioCON_CODIGO: TAutoIncField;
    tbConvenioCON_DESCRICAO: TStringField;
    tbConvenioCON_RETORNO: TStringField;
    tbConvenioCON_RUA: TStringField;
    tbConvenioCON_NUM: TSmallintField;
    tbConvenioCON_COMPLE: TStringField;
    tbConvenioCON_BAIRRO: TStringField;
    tbConvenioCON_CEP: TStringField;
    tbConvenioCID_CODIGO: TIntegerField;
    tbConvenioCON_EMAIL: TStringField;
    tbConvenioCON_CONTATO: TStringField;
    tbConvenioCON_TIPOTEL1: TStringField;
    tbConvenioCON_TEL1: TStringField;
    tbConvenioCON_TIPOTEL2: TStringField;
    tbConvenioCON_TEL2: TStringField;
    tbConvenioCON_TIPOTEL3: TStringField;
    tbConvenioCON_TEL3: TStringField;
    tbConvenioCON_OBS: TMemoField;
    tbConvenioCON_INDPROCED: TFloatField;
    tbConvenioCON_TABPROCED: TStringField;
    tbConvenioCON_INDMATE: TFloatField;
    tbConvenioCON_TABMATE: TStringField;
    tbConvenioCON_INDTAXA: TFloatField;
    tbConvenioCON_TABTAXA: TStringField;
    tbConvenioCON_DATACAD: TDateField;
    tbConveniolkUF: TStringField;
    tbPaciente: TTable;
    tbPacientePAC_CODIGO: TAutoIncField;
    tbPacientePAC_NOME: TStringField;
    tbPacientePAC_PAI: TStringField;
    tbPacientePAC_MAE: TStringField;
    tbPacientePAC_COR: TStringField;
    tbPacientePAC_NASC: TDateField;
    tbPacientePAC_ARCADA: TStringField;
    tbPacientePAC_INDICADO: TStringField;
    tbPacientePAC_ESTCIVIL: TStringField;
    tbPacienteCON_CODIGO: TIntegerField;
    tbPacientePAC_PROFISSAO: TStringField;
    tbPacientePAC_RUA: TStringField;
    tbPacientePAC_NUM: TSmallintField;
    tbPacientePAC_COMPLE: TStringField;
    tbPacientePAC_BAIRRO: TStringField;
    tbPacientePAC_CEP: TStringField;
    tbPacienteCID_CODIGO: TIntegerField;
    tbPacientePAC_EMAIL: TStringField;
    tbPacientePAC_TIPOTEL1: TStringField;
    tbPacientePAC_TEL1: TStringField;
    tbPacientePAC_TIPOTEL2: TStringField;
    tbPacientePAC_TEL2: TStringField;
    tbPacientePAC_TIPOTEL3: TStringField;
    tbPacientePAC_TEL3: TStringField;
    tbPacientePAC_RG: TStringField;
    tbPacientePAC_CPF: TStringField;
    tbPacientePAC_ULTCONS: TDateField;
    tbPacientePAC_FOTO: TGraphicField;
    tbPacientePAC_OBS: TMemoField;
    tbPacientePAC_DATACAD: TDateField;
    tbPacientelkUF: TStringField;
    tbPacienteIdade: TStringField;
    tbPacienteConvenio: TStringField;
    tbProfissional: TTable;
    tbProfissionalPRO_CODIGO: TAutoIncField;
    tbProfissionalPRO_NOME: TStringField;
    tbProfissionalPRO_REGISTRO: TStringField;
    tbProfissionalPRO_ESPE1: TStringField;
    tbProfissionalPRO_ESPE2: TStringField;
    tbProfissionalPRO_ESPE3: TStringField;
    tbProfissionalPRO_RUA: TStringField;
    tbProfissionalPRO_NUM: TSmallintField;
    tbProfissionalPRO_COMPLE: TStringField;
    tbProfissionalPRO_BAIRRO: TStringField;
    tbProfissionalPRO_CEP: TStringField;
    tbProfissionalCID_CODIGO: TIntegerField;
    tbProfissionalPRO_EMAIL: TStringField;
    tbProfissionalPRO_TIPOTEL1: TStringField;
    tbProfissionalPRO_TEL1: TStringField;
    tbProfissionalPRO_TIPOTEL2: TStringField;
    tbProfissionalPRO_TEL2: TStringField;
    tbProfissionalPRO_TIPOTEL3: TStringField;
    tbProfissionalPRO_TEL3: TStringField;
    tbProfissionalPRO_RG: TStringField;
    tbProfissionalPRO_CPF: TStringField;
    tbProfissionalPRO_FOTO: TGraphicField;
    tbProfissionalPRO_OBS: TMemoField;
    tbProfissionalPRO_DATACAD: TDateField;
    tbProfissionallkUF: TStringField;
    tbProtetico: TTable;
    tbProteticoPRT_CODIGO: TAutoIncField;
    tbProteticoPRT_NOME: TStringField;
    tbProteticoPRT_RUA: TStringField;
    tbProteticoPRT_NUM: TSmallintField;
    tbProteticoPRT_COMPLE: TStringField;
    tbProteticoPRT_BAIRRO: TStringField;
    tbProteticoPRT_CEP: TStringField;
    tbProteticoCID_CODIGO: TIntegerField;
    tbProteticoPRT_EMAIL: TStringField;
    tbProteticoPRT_TIPOTEL1: TStringField;
    tbProteticoPRT_TEL1: TStringField;
    tbProteticoPRT_TIPOTEL2: TStringField;
    tbProteticoPRT_TEL2: TStringField;
    tbProteticoPRT_TIPOTEL3: TStringField;
    tbProteticoPRT_TEL3: TStringField;
    tbProteticoPRT_RG: TStringField;
    tbProteticoPRT_CPF: TStringField;
    tbProteticoPRT_FOTO: TGraphicField;
    tbProteticoPRT_OBS: TMemoField;
    tbProteticoPRT_DATACAD: TDateField;
    tbProteticolkUF: TStringField;
    tbFornecedor: TTable;
    tbFornecedorFOR_CODIGO: TAutoIncField;
    tbFornecedorFOR_TIPO: TStringField;
    tbFornecedorFOR_NOME: TStringField;
    tbFornecedorFOR_FANTASIA: TStringField;
    tbFornecedorFOR_CNPJ: TStringField;
    tbFornecedorFOR_CPF: TStringField;
    tbFornecedorFOR_INSESTADO: TStringField;
    tbFornecedorFOR_RG: TStringField;
    tbFornecedorFOR_RUA: TStringField;
    tbFornecedorFOR_NUM: TSmallintField;
    tbFornecedorFOR_COMPLE: TStringField;
    tbFornecedorFOR_BAIRRO: TStringField;
    tbFornecedorFOR_CEP: TStringField;
    tbFornecedorCID_CODIGO: TIntegerField;
    tbFornecedorFOR_EMAIL: TStringField;
    tbFornecedorFOR_TIPOTEL1: TStringField;
    tbFornecedorFOR_TEL1: TStringField;
    tbFornecedorFOR_TIPOTEL2: TStringField;
    tbFornecedorFOR_TEL2: TStringField;
    tbFornecedorFOR_TIPOTEL3: TStringField;
    tbFornecedorFOR_TEL3: TStringField;
    tbFornecedorFOR_OBS: TMemoField;
    tbFornecedorFOR_DATACAD: TDateField;
    tbFornecedorlkUF: TStringField;
    tbTipoAtende: TTable;
    tbTipoAtendeTIP_SIGLA: TStringField;
    tbTipoAtendeTIP_TIPO: TStringField;
    tbTipoAtendeTIP_COR: TStringField;
    tbSalaEspera: TTable;
    tbSalaEsperaSAL_DATACHEGA: TDateField;
    tbSalaEsperaSAL_HORACHEGA: TTimeField;
    tbSalaEsperaPRO_CODIGO: TIntegerField;
    tbSalaEsperaHOR_CODIGO: TIntegerField;
    tbSalaEsperaAGE_DATA: TDateField;
    tbSalaEsperaAGE_HORARIO: TStringField;
    tbHorario: TTable;
    tbHorarioPRO_CODIGO: TIntegerField;
    tbHorarioHOR_CODIGO: TAutoIncField;
    tbHorarioHOR_DIASEMANA: TStringField;
    tbHorarioHOR_PERIODO: TStringField;
    tbHorarioHOR_HORAINICIO: TTimeField;
    tbHorarioHOR_HORAFINAL: TTimeField;
    tbHorarioHOR_INTERVALO: TIntegerField;
    tbHorarioHOR_DTLIMITA: TDateField;
    tbAgenda: TTable;
    tbAgendaPRO_CODIGO: TSmallintField;
    tbAgendaHOR_CODIGO: TSmallintField;
    tbAgendaAGE_DATA: TDateField;
    tbAgendaAGE_HORARIO: TStringField;
    tbAgendaPAC_CODIGO: TIntegerField;
    tbAgendaTIP_SIGLA: TStringField;
    tbAgendaAGE_STATUS: TStringField;
    tbAgendaAGE_OBS: TMemoField;
    tbAgendaPaciente: TStringField;
    tbAgendaTele1: TStringField;
    tbAgendaTele2: TStringField;
    tbAgendaUltCons: TDateField;
    tbAgendaConvenio: TStringField;
    tbAgendaTipo: TStringField;
    tbAgendaCor: TStringField;
    qyAgenda: TQuery;
    qyAgendaPRO_CODIGO: TSmallintField;
    qyAgendaHOR_CODIGO: TSmallintField;
    qyAgendaAGE_DATA: TDateField;
    qyAgendaAGE_HORARIO: TStringField;
    qyAgendaPAC_CODIGO: TIntegerField;
    qyAgendaTIP_SIGLA: TStringField;
    qyAgendaAGE_STATUS: TStringField;
    qyAgendaAGE_OBS: TMemoField;
    qyAgendaPaciente: TStringField;
    qyAgendaTele1: TStringField;
    qyAgendaTele2: TStringField;
    qyAgendaUltCons: TDateField;
    qyAgendaConvenio: TStringField;
    qyAgendaTipo: TStringField;
    qyAgendaCor: TStringField;
    tbPacientePAC_SEXO: TStringField;
    tbTipoAtendeTIP_CADRAP: TStringField;
    tbFuncionarioFUN_SITUACAO: TStringField;
    tbEntrada: TTable;
    tbEntradalkDescriProd: TStringField;
    dsEntrada: TDataSource;
    dsSaida: TDataSource;
    tbSaida: TTable;
    tbSaidalkDescriProd: TStringField;
    tbMovDia: TTable;
    tbMovDiaDataMov: TDateField;
    tbMovDiaCodMerc: TStringField;
    tbMovDiaDescricao: TStringField;
    tbMovDiaQuantidade: TFloatField;
    tbMovDiaValor: TCurrencyField;
    dsMovDia: TDataSource;
    dsCompras: TDataSource;
    tbCompras: TTable;
    tbComprasCodComp: TAutoIncField;
    tbComprasDataComp: TDateField;
    tbComprasHoraComp: TTimeField;
    tbComprasCodFor: TIntegerField;
    tbComprasValor: TCurrencyField;
    tbComprasDesconto: TCurrencyField;
    tbComprasCodForPag: TStringField;
    tbComprasNumParcelas: TSmallintField;
    tbComprasUserName: TStringField;
    tbComprasCodIndex: TIntegerField;
    tbComprasPedidoPen: TStringField;
    tbComprasLkFornec: TStringField;
    tbDetCompras: TTable;
    tbDetComprasCodMerc: TStringField;
    tbDetComprasCodComp: TIntegerField;
    tbDetComprasPrecoUnit: TCurrencyField;
    tbDetComprasQuant: TFloatField;
    tbDetComprasTotal: TFloatField;
    tbDetComprasLkProduto: TStringField;
    tbDetComprasDataComp: TDateField;
    dsDetCompras: TDataSource;
    dsVisDetCompra: TDataSource;
    tbVisDetCompra: TTable;
    tbVisDetCompraLkProduto: TStringField;
    tbVisDetCompraCodMerc: TStringField;
    tbVisDetCompraCodComp: TIntegerField;
    tbVisDetCompraPrecoUnit: TCurrencyField;
    tbVisDetCompraQuant: TFloatField;
    tbVisDetCompraTotal: TFloatField;
    tbVisDetCompraDataComp: TDateField;
    tbVisDetCompraLknomeforc: TStringField;
    tbEntradaMVE_CODIGO: TAutoIncField;
    tbEntradaMAT_CODIGO: TStringField;
    tbEntradaFUN_CODIGO: TIntegerField;
    tbEntradaMVE_QTD: TFloatField;
    tbEntradaMVE_TIPO: TStringField;
    tbEntradaMVE_MOTIVO: TMemoField;
    tbEntradaMVE_DATA: TDateField;
    tbEntradaMVE_HORA: TTimeField;
    tbSaidaMVE_CODIGO: TAutoIncField;
    tbSaidaMAT_CODIGO: TStringField;
    tbSaidaFUN_CODIGO: TIntegerField;
    tbSaidaMVE_QTD: TFloatField;
    tbSaidaMVE_TIPO: TStringField;
    tbSaidaMVE_MOTIVO: TMemoField;
    tbSaidaMVE_DATA: TDateField;
    tbSaidaMVE_HORA: TTimeField;
    tbTipoDoc: TTable;
    tbTipoDocCodDoc: TStringField;
    tbTipoDocDescricao: TStringField;
    dsTipoDoc: TDataSource;
    tbCPagar: TTable;
    tbCPagarNomeFornec: TStringField;
    tbCPagarLkTipoDoc: TStringField;
    tbCPagarLkHistorico: TStringField;
    dsCPagar: TDataSource;
    tbCPagarCodCPagar: TAutoIncField;
    tbCPagarNumDoc: TStringField;
    tbCPagarNumBanco: TStringField;
    tbCPagarCodDoc: TStringField;
    tbCPagarCodFor: TIntegerField;
    tbCPagarCodComp: TIntegerField;
    tbCPagarDataEmis: TDateField;
    tbCPagarDataVenc: TDateField;
    tbCPagarCodHist: TStringField;
    tbCPagarCompHist: TStringField;
    tbCPagarValor: TCurrencyField;
    tbCPagarDataPaga: TDateField;
    tbCPagarValorPago: TCurrencyField;
    tbCPagarDescPago: TCurrencyField;
    tbCPagarMuJuPago: TCurrencyField;
    tbCPagarPago: TStringField;
    tbCPagarTipoPago: TStringField;
    tbCPagarCodCCusto: TStringField;
    tbCPagarPortador: TStringField;
    tbRelEsto: TTable;
    dsRelEsto: TDataSource;
    tbRelEstoMAT_CODIGO: TStringField;
    tbRelEstoMAT_NOME: TStringField;
    tbRelEstoSBG_CODIGO: TIntegerField;
    tbRelEstoMAR_CODIGO: TIntegerField;
    tbRelEstoUNI_SIGLA: TStringField;
    tbRelEstoMAT_ESTOMIN: TFloatField;
    tbRelEstoMAT_ESTOMAX: TFloatField;
    tbRelEstoMAT_ESTOATUAL: TFloatField;
    tbRelEstoMAT_PRECOMPRA: TCurrencyField;
    tbRelEstoMAT_FOTO: TGraphicField;
    tbRelEstoMAT_DATACAD: TDateField;
    tbRelEstoMAT_ULTIMACOMP: TDateField;
    tbBanco: TTable;
    tbBancoNada: TAutoIncField;
    tbBancoNumBanco: TStringField;
    tbBancoNomeBanco: TStringField;
    dsBanco: TDataSource;
    TbCCorrente: TTable;
    TbCCorrenteNada: TAutoIncField;
    TbCCorrenteConta: TStringField;
    TbCCorrenteDataAbert: TDateField;
    TbCCorrenteDescricao: TStringField;
    TbCCorrenteNumBanco: TStringField;
    TbCCorrenteNumAgencia: TStringField;
    TbCCorrenteTel1: TStringField;
    TbCCorrenteFax: TStringField;
    TbCCorrenteGerente: TStringField;
    TbCCorrenteTitular: TStringField;
    TbCCorrenteLimite: TCurrencyField;
    TbCCorrenteSaldo: TCurrencyField;
    TbCCorrenteUltMov: TDateField;
    TbCCorrenteHoraMov: TTimeField;
    TbCCorrenteEMail: TStringField;
    TbCCorrenteDataCad: TDateField;
    TbCCorrenteLkNomeBanco: TStringField;
    TbCCorrenteInternet: TStringField;
    DsCCorrente: TDataSource;
    tbCReceber: TTable;
    tbCReceberCodCRec: TAutoIncField;
    tbCReceberNumDoc: TStringField;
    tbCReceberCodDoc: TStringField;
    tbCReceberCodCli: TIntegerField;
    tbCReceberCodVen: TSmallintField;
    tbCReceberDataVen: TDateField;
    tbCReceberCodCServ: TIntegerField;
    tbCReceberDataEmis: TDateField;
    tbCReceberDataVenc: TDateField;
    tbCReceberCodHist: TStringField;
    tbCReceberValor: TCurrencyField;
    tbCReceberValorMulta: TCurrencyField;
    tbCReceberValorDesc: TCurrencyField;
    tbCReceberValorJuros: TCurrencyField;
    tbCReceberDataPaga: TDateField;
    tbCReceberValorPago: TCurrencyField;
    tbCReceberPago: TStringField;
    tbCReceberCodCCusto: TStringField;
    tbCReceberMultaDia: TDateField;
    tbCReceberPercMulta: TFloatField;
    tbCReceberDescDia: TDateField;
    tbCReceberPercDesc: TFloatField;
    tbCReceberJurosDia: TDateField;
    tbCReceberPercJuros: TFloatField;
    tbCReceberlkCliente: TStringField;
    tbCReceberLkTipoDoc: TStringField;
    tbCReceberCompHist: TStringField;
    tbCReceberlknome: TStringField;
    tbCReceberlkcpf: TStringField;
    tbCReceberLkEndereco: TStringField;
    tbCReceberlknumero: TStringField;
    tbCReceberlkbairro: TStringField;
    tbCReceberlkcidade: TStringField;
    tbCReceberlkuf: TStringField;
    tbCReceberlkcep: TStringField;
    tbCReceberPortador: TStringField;
    tbCReceberTipoPago: TStringField;
    tbCReceberNumBanco: TStringField;
    tbCReceberDescPago: TCurrencyField;
    tbCReceberMuJuPago: TCurrencyField;
    dsCReceber: TDataSource;
    tbCheque: TTable;
    tbChequeNumBanco: TStringField;
    tbChequeNumCheque: TFloatField;
    tbChequeAgencia: TStringField;
    tbChequeValor: TCurrencyField;
    tbChequeVencimento: TDateField;
    tbChequeDataVen: TDateField;
    tbChequeCodVen: TIntegerField;
    tbChequeCodCli: TIntegerField;
    tbChequeConta: TStringField;
    tbChequeNomeCli: TStringField;
    tbChequeObs: TMemoField;
    tbChequeStatus: TStringField;
    tbChequeNomeBanco: TStringField;
    tbChequeJuros: TFloatField;
    tbChequeValorJuros: TCurrencyField;
    tbChequeNovoVenc: TDateField;
    tbChequeValorTotal: TCurrencyField;
    tbChequePreDatado: TStringField;
    dsCheque: TDataSource;
    tbHistorico: TTable;
    tbHistoricoCodHist: TStringField;
    tbHistoricoDescricao: TStringField;
    dsHistorico: TDataSource;
    tbCReceberLkHistorico: TStringField;
    TbMovConta: TTable;
    TbMovContaCodMov: TAutoIncField;
    TbMovContaTipoOper: TStringField;
    TbMovContaDataMov: TDateField;
    TbMovContaCodDoc: TStringField;
    TbMovContaDosNumero: TStringField;
    TbMovContaNumAgencia: TStringField;
    TbMovContaConta: TStringField;
    TbMovContaCodHist: TStringField;
    TbMovContaComplHist: TStringField;
    TbMovContaValor: TCurrencyField;
    TbMovContaDataReg: TDateField;
    TbMovContaHoraReg: TTimeField;
    TbMovContaUserName: TStringField;
    TbMovContaCodBanco: TIntegerField;
    TbMovContalkBanco: TStringField;
    DsMovConta: TDataSource;
    tbChequePro: TTable;
    tbChequeProConta: TStringField;
    tbChequeProNumCheque: TFloatField;
    tbChequeProValor: TCurrencyField;
    tbChequeProVencimento: TDateField;
    tbChequeProDataCompra: TDateField;
    tbChequeProCodCompra: TIntegerField;
    tbChequeProCodFor: TIntegerField;
    tbChequeProObs: TMemoField;
    tbChequeProStatus: TStringField;
    tbChequeProJuros: TFloatField;
    tbChequeProValorJuros: TCurrencyField;
    tbChequeProNovoVenc: TDateField;
    tbChequeProPreDatado: TStringField;
    tbChequeProValorTotal: TCurrencyField;
    dsChequePro: TDataSource;
    dsCartao: TDataSource;
    tbCartao: TTable;
    tbCartaoCodCar: TAutoIncField;
    tbCartaoCartao: TStringField;
    tbCartaoAnual: TCurrencyField;
    tbCartaoDiaVenc: TFloatField;
    tbCartaoLimite: TCurrencyField;
    tbCartaoInternet: TStringField;
    tbCartaoDtCad: TDateField;
    tbCartaoTipoTel1: TStringField;
    tbCartaoTel1: TStringField;
    tbCartaoTipoTel2: TStringField;
    tbCartaoTel2: TStringField;
    tbCartaoTipoTel3: TStringField;
    tbCartaoTel3: TStringField;
    tbCartaoObs: TMemoField;
    tbIndice: TTable;
    dsIndice: TDataSource;
    tbIndiceCodIndice: TAutoIncField;
    tbIndiceMoeda: TStringField;
    tbIndiceValor: TCurrencyField;
    tbIndiceData: TDateField;
    tbTipoMed: TTable;
    dsTipoMed: TDataSource;
    dsUsoMed: TDataSource;
    tbUsoMed: TTable;
    tbTipoMedCodTipo: TAutoIncField;
    tbTipoMedTipoMed: TStringField;
    tbUsoMedCodUso: TAutoIncField;
    tbUsoMedUso: TStringField;
    tbMedicamento: TTable;
    dsMedicamento: TDataSource;
    tbMedicamentoCodMedic: TAutoIncField;
    tbMedicamentoNome: TStringField;
    tbMedicamentoNomeCom: TStringField;
    tbMedicamentoApres: TStringField;
    tbMedicamentoQtd: TFloatField;
    tbMedicamentoObs: TMemoField;
    tbMedicamentoCodUso: TIntegerField;
    tbMedicamentoCodTipo: TIntegerField;
    tbMedicamentolkTipo: TStringField;
    tbMedicamentolkUso: TStringField;
    tbMedicamentoTexto: TMemoField;
    procedure tbFuncionarioCalcFields(DataSet: TDataSet);
    procedure tbPacienteCalcFields(DataSet: TDataSet);
    procedure tbRelEstoFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure tbChequeCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    fHabilitaTeclado : boolean;
    fvTabStt         : boolean;
    fRelEstoque      : string ;
    fCRecCli         : boolean;
    fBaixaLote       : boolean;
    fValorReceb      : real   ;
    
  public
    { Public declarations }
    property HabilitaTeclado : boolean read fHabilitaTeclado write fHabilitaTeclado;
    property vTabStt         : boolean read fvTabStt         write fvTabStt        ;
    property RelEstoque      : string  read fRelEstoque      write fRelEstoque     ;
    property CRecCli         : boolean read fCRecCli         write fCRecCli        ;
    property BaixaLote       : boolean read fBaixaLote       write fBaixaLote      ;
    property ValorReceb      : real    read fValorReceb      write fValorReceb     ;

  end;

var
  dmDados: TdmDados;

implementation

uses untPrincipal;

//uses untPrincipal;

{$R *.dfm}

procedure TdmDados.tbFuncionarioCalcFields(DataSet: TDataSet);
begin
  //dmDados.tbFuncionarioIdade.Value := frmPrincipal.CalcIdade(dmDados.tbFuncionarioFUN_DTNASC.Value, Now);
end;

procedure TdmDados.tbPacienteCalcFields(DataSet: TDataSet);
begin
  //dmDados.tbPacienteIdade.Value := frmPrincipal.CalcIdade(dmDados.tbPacientePAC_NASC.Value, Now);
end;

procedure TdmDados.tbRelEstoFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if (RelEstoque = 'Abaixo do M�nimo') then
    if (tbRelEstoMAT_ESTOATUAL.Value < tbRelEstoMAT_ESTOMIN.Value) then
      Accept := True
    else
      Accept := False;
  if (RelEstoque = 'Acima do M�ximo') then
    if (tbRelEstoMAT_ESTOATUAL.Value > tbRelEstoMAT_ESTOMAX.Value) then
      Accept := True
    else
      Accept := False;
end;

procedure TdmDados.tbChequeCalcFields(DataSet: TDataSet);
begin
   tbChequeValorTotal.Value := tbChequeValorJuros.Value + tbChequeValor.Value;
end;

end.
