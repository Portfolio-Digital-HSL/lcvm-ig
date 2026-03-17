// ============================================================
// LCVM.A1.Triagem — Questionnaire FSH
// DAK Componente 5 — v0.3.0
// Pacotes: br.gov.saude.br-core.fhir#1.0.0
//          br.gov.saude.terminologia.fhir#1.0.0
//          hl7.fhir.uv.sdc#current
// ============================================================

Alias: $calcExp    = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression
Alias: $constraint = http://hl7.org/fhir/StructureDefinition/questionnaire-constraint
Alias: $launch     = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext

Instance: LCVM-A1-Triagem
InstanceOf: http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire
Title: "LCVM — A1 Triagem"
Description: "Instrumento de Triagem da Linha de Cuidado de CombaATE Violência contra a Mulher (LCVM), etapa A1, para identificação de mulheres em situação de violência e encaminhamento para serviços de saúde ou de proteção às mulheres."
Usage: #definition
* url    = "https://mangara.hsl.org.br/fhir/Questionnaire/lcvm-a1-triagem"
* version = "0.3.0"
* status  = #draft
* language = #pt-BR
* subjectType = #Patient

// Launch context: paciente pré-carregado via CADSUS
* extension[+].url = $launch
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient
* extension[=].extension[+].url = "description"
* extension[=].extension[=].valueString = "Paciente pré-carregado da API CADSUS pelo CPF informado"

// ==============================================
//  CADASTRO  
// ==============================================
* item[+].linkId = "/cadastro"
* item[=].text   = "Cadastro"
* item[=].type   = #group
* item[=].required = true

* item[=].item[+].linkId = "/cadastro/cpf"
* item[=].item[=].text   = "CPF"
* item[=].item[=].definition = "Identificador pessoal da mulher, número do CPF. Informações cadastrais extraídas da API do CADSUS."
* item[=].item[=].type     = #string
* item[=].item[=].required = true








* item[=].item[=].extension[=].extension[=].valueString = "CPF deve conter exatamente 11 dígitos numéricos"

* item[=].item[+].linkId = "/cadastro/nome-completo"
* item[=].item[=].text   = "Nome completo"
* item[=].item[=].definition = "Nome completo da mulher, seguindo preenchimento do CADSUS."
* item[=].item[=].type     = #string
* item[=].item[=].required = true

* item[=].item[+].linkId = "/cadastro/nome-social"
* item[=].item[=].text   = "Nome Social"
* item[=].item[=].definition = "Nome social utilizado, devendo ser preenchido pela mulher."
* item[=].item[=].type     = #string
* item[=].item[=].required = true

* item[=].item[+].linkId = "/cadastro/nacionalidade"
* item[=].item[=].text   = "Nacionalidade"
* item[=].item[=].definition = "País de nacionalidade do paciente."
* item[=].item[=].type     = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/iso3166-1-2"

* item[=].item[+].linkId = "/cadastro/data-nascimento"
* item[=].item[=].text   = "Data de Nascimento"
* item[=].item[=].definition = "Data de Nascimento do Paciente."
* item[=].item[=].type     = #date
* item[=].item[=].required = true

* item[=].item[+].linkId = "/cadastro/identidade-genero"
* item[=].item[=].text   = "Identidade de Gênero"
* item[=].item[=].definition = "Como o paciente identifica o seu gênero sexual."
* item[=].item[=].type     = #choice
* item[=].item[=].required = true
* item[=].item[=].repeats  = false
* item[=].item[=].answerValueSet = "https://terminologia.saude.gov.br/fhir/ValueSet/BRIdentidadeGenero"

* item[=].item[+].linkId = "/cadastro/raca-cor"
* item[=].item[=].text   = "Raça/Cor"
* item[=].item[=].type     = #choice
* item[=].item[=].required = true
* item[=].item[=].repeats  = false
* item[=].item[=].answerValueSet ="https://terminologia.saude.gov.br/fhir/ValueSet/BRRacaCor"

* item[=].item[+].linkId = "/cadastro/etnia"
* item[=].item[=].text   = "Etnia"
* item[=].item[=].type     = #choice
* item[=].item[=].required = false
* item[=].item[=].repeats  = false
* item[=].item[=].answerValueSet = "https://terminologia.saude.gov.br/fhir/ValueSet/BREtniaIndigena"

* item[=].item[+].linkId = "/cadastro/telefone"
* item[=].item[=].text   = "Telefone"
* item[=].item[=].type     = #string
* item[=].item[=].required = true

* item[=].item[+].linkId = "/cadastro/cidade"
* item[=].item[=].text   = "Cidade"
* item[=].item[=].type     = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = "https://terminologia.saude.gov.br/fhir/ValueSet/BRMunicipio"

* item[=].item[+].linkId = "/cadastro/uf"
* item[=].item[=].text   = "UF"
* item[=].item[=].type     = #choice
* item[=].item[=].required = true
* item[=].item[=].repeats  = false
* item[=].item[=].answerValueSet = "https://terminologia.saude.gov.br/fhir/ValueSet/BRUnidadeFederativa"

// ============================================================
// SEÇÃO 1: TIPO DE VIOLÊNCIA  (DE12–DE13)
// ============================================================
* item[+].linkId = "/secao1-tipo-violencia"
* item[=].text   = "Seção 1 — Tipo de Violência"
* item[=].type   = #group

* item[=].item[+].linkId = "/secao1-tipo-violencia/afirmativas"
* item[=].item[=].text   = "Das afirmativas abaixo, quais representam algo que você já viveu ou vivencia?"
* item[=].item[=].definition = "Tipo de violência sofrida ou vivenciada."
* item[=].item[=].type     = #choice
* item[=].item[=].repeats  = true
* item[=].item[=].answerValueSet ="https://mangara.hsl.org.br/fhir/ValueSet/lcvm_tipoViolencia"

* item[=].item[+].linkId = "/secao1-tipo-violencia/escore"
* item[=].item[=].text   = "Escore do tipo de violência"
* item[=].item[=].type     = #integer
* item[=].item[=].readOnly = true
* item[=].item[=].extension[+].url = $calcExp
* item[=].item[=].extension[=].valueExpression.language    = #text/fhirpath
* item[=].item[=].extension[=].valueExpression.description =
    "Somar os pontos de cada uma das respostas à pergunta LCVM.A1.DE12"
* item[=].item[=].extension[=].valueExpression.expression  =
    "%resource.item.where(linkId='/secao1-tipo-violencia/afirmativas').answer.valueCoding.extension.where(url='http://hl7.org/fhir/StructureDefinition/ordinalValue').value.aggregate($total + $this, 0)"

// ============================================================
//  SEÇÃO 2: TRATAMENTO SERVIÇOS DE SAÚDE  (DE14–DE15)
// ============================================================
* item[+].linkId = "/secao2-tratamento-servicos"
* item[=].text   = "Seção 2 — Tratamento Serviços de Saúde"
* item[=].type   = #group

* item[=].item[+].linkId = "/secao2-tratamento-servicos/recebe-atendimento"
* item[=].item[=].text   = "Em relação às afirmações respondidas anteriormente, você está recebendo atendimento ou acompanhamento de algum serviço de saúde ou de proteção às mulheres?"
* item[=].item[=].type   = #boolean

* item[=].item[+].linkId = "/secao2-tratamento-servicos/qual-servico"
* item[=].item[=].text   = "Caso afirmativo, qual serviço?"
* item[=].item[=].definition = "Acompanhamento em Serviço de Saúde."
* item[=].item[=].type     = #choice
* item[=].item[=].repeats  = true
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = "https://mangara.hsl.org.br/fhir/ValueSet/lcvm_servicoSaude"
* item[=].item[=].enableWhen[+].question    = "/secao2-tratamento-servicos/recebe-atendimento"
* item[=].item[=].enableWhen[=].operator    = #=
* item[=].item[=].enableWhen[=].answerBoolean = true
* item[=].item[=].enableBehavior = #all
