// ============================================================
// LCVM.A1.Triagem — Questionnaire FSH
// Pacotes: br.gov.saude.br-core.fhir#1.0.0
//          br.gov.saude.terminologia.fhir#1.0.0
//          hl7.fhir.uv.sdc#current
// ============================================================

Alias: $calcExp = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression
Alias: $launch  = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext

Instance: LCVM-A1-Triagem
// FIX 1: InstanceOf deve usar o tipo base; profile SDC declarado via meta.profile
InstanceOf: Questionnaire
Title: "LCVM — A1 Triagem"
Description: "Instrumento de Triagem da Linha de Cuidado de Combate à Violência contra a Mulher (LCVM), etapa A1, para identificação de mulheres em situação de violência e encaminhamento para serviços de saúde ou de proteção às mulheres."
Usage: #definition

* meta.profile[+]  = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire"
* url              = "https://mangara.hsl.org.br/fhir/Questionnaire/lcvm-a1-triagem"
* name             = "LCVM-A1-Triagem"
* version          = "0.3.0"
* status           = #draft
* language         = #pt-BR
* subjectType      = #Patient

// ============================================================
// CADASTRO
// ============================================================
* item[+].linkId = "Cadastro"
* item[=].text   = "Cadastro"
* item[=].type   = #group

// LCVM.A1.DE.001 — CPF
* item[=].item[+].linkId     = "LCVM.A1.DE.001"
* item[=].item[=].text       = "CPF"
* item[=].item[=].definition = "Identificador pessoal da mulher, número do CPF. Informações cadastrais extraídas da API do CADSUS."
* item[=].item[=].type       = #string
* item[=].item[=].required   = true

// LCVM.A1.DE.002 — Nome completo
* item[=].item[+].linkId     = "LCVM.A1.DE.002"
* item[=].item[=].text       = "Nome completo"
* item[=].item[=].definition = "Nome completo da mulher, seguindo preenchimento do CADSUS."
* item[=].item[=].type       = #string
* item[=].item[=].required   = true

// LCVM.A1.DE.003 — Nome Social
* item[=].item[+].linkId     = "LCVM.A1.DE.003"
* item[=].item[=].text       = "Nome Social"
* item[=].item[=].definition = "Nome social utilizado, devendo ser preenchido pela mulher."
* item[=].item[=].type       = #string
* item[=].item[=].required   = true

// LCVM.A1.DE.004 — Nacionalidade
* item[=].item[+].linkId         = "LCVM.A1.DE.004"
* item[=].item[=].text           = "Nacionalidade"
* item[=].item[=].definition     = "País de nacionalidade do paciente."
* item[=].item[=].type           = #choice
* item[=].item[=].required       = true
* item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/iso3166-1-2"

// LCVM.A1.DE.005 — Data de Nascimento
* item[=].item[+].linkId     = "LCVM.A1.DE.005"
* item[=].item[=].text       = "Data de Nascimento"
* item[=].item[=].definition = "Data de Nascimento do Paciente."
* item[=].item[=].type       = #date
* item[=].item[=].required   = true

// LCVM.A1.DE.006 — Identidade de Gênero
* item[=].item[+].linkId         = "LCVM.A1.DE.006"
* item[=].item[=].text           = "Identidade de Gênero"
* item[=].item[=].definition     = "Como o paciente identifica o seu gênero sexual."
* item[=].item[=].type           = #choice
* item[=].item[=].required       = true
* item[=].item[=].repeats        = false
* item[=].item[=].answerValueSet = "https://mangara.hsl.org.br/fhir/ValueSet/IdentidadeGenero_LCVM"

// LCVM.A1.DE.008 — Raça/Cor
* item[=].item[+].linkId         = "LCVM.A1.DE.008"
* item[=].item[=].text           = "Raça/Cor"
* item[=].item[=].type           = #choice
* item[=].item[=].required       = true
* item[=].item[=].repeats        = false
* item[=].item[=].answerValueSet = "https://terminologia.saude.gov.br/fhir/ValueSet/BRRacaCor"

// LCVM.A1.DE.009 — Etnia
* item[=].item[+].linkId         = "LCVM.A1.DE.009"
* item[=].item[=].text           = "Etnia"
* item[=].item[=].type           = #choice
* item[=].item[=].required       = false
* item[=].item[=].repeats        = false
* item[=].item[=].answerValueSet = "https://terminologia.saude.gov.br/fhir/ValueSet/BREtniaIndigena"

// LCVM.A1.DE.010 — Telefone
* item[=].item[+].linkId   = "LCVM.A1.DE.010"
* item[=].item[=].text     = "Telefone"
* item[=].item[=].type     = #string
* item[=].item[=].required = true

// LCVM.A1.DE.011 — CEP
* item[=].item[+].linkId   = "LCVM.A1.DE.011"
* item[=].item[=].text     = "CEP"
* item[=].item[=].type     = #string
* item[=].item[=].required = true

// LCVM.A1.DE.012 — Cidade
* item[=].item[+].linkId   = "LCVM.A1.DE.012"
* item[=].item[=].text     = "Cidade"
* item[=].item[=].type     = #string
* item[=].item[=].required = true

// LCVM.A1.DE.013 — UF
* item[=].item[+].linkId   = "LCVM.A1.DE.013"
* item[=].item[=].text     = "UF"
// FIX 2: faltava o prefixo '#' no tipo
* item[=].item[=].type     = #string
* item[=].item[=].required = true

// LCVM.A1.DE.013A — Reside em área rural?
* item[=].item[+].linkId         = "LCVM.A1.DE.013A"
* item[=].item[=].text           = "Reside em área rural ?"
* item[=].item[=].type           = #choice
* item[=].item[=].required       = true
* item[=].item[=].repeats        = false
* item[=].item[=].answerValueSet = "https://mangara.hsl.org.br/fhir/ValueSet/SimNaoNaoSabe"


// ============================================================
// SEÇÃO 0 — Deficiência
// ============================================================
* item[+].linkId = "Seção 0 - Deficiência"
* item[=].text   = "Seção 0 — Tipo de Deficiencia"
* item[=].type   = #group

// LCVM.A1.DE014 — Possui algum tipo de deficiência?
* item[=].item[+].linkId         = "LCVM.A1.DE014"
* item[=].item[=].text           = "Você possui algum tipo de deficiência?"
* item[=].item[=].definition     = "Informa se possui algum tipo de deficiência"
* item[=].item[=].type           = #choice
* item[=].item[=].repeats        = false
* item[=].item[=].answerValueSet = "https://mangara.hsl.org.br/fhir/ValueSet/LCVM_Deficiencia"

// LCVM.A1.DE015 — Tipo de deficiência (Select all that apply)
* item[=].item[+].linkId         = "LCVM.A1.DE015"
* item[=].item[=].text           = "Qual o tipo de deficiência que você tem?"
* item[=].item[=].definition     = "Tipo de deficiência que a pessoa tem."
* item[=].item[=].type           = #choice
* item[=].item[=].repeats        = true
* item[=].item[=].answerValueSet = "https://mangara.hsl.org.br/fhir/ValueSet/BRTipoDeficiencia"
// FIX 3: operador estava malformado (#=") e sintaxe de enableWhen corrigida para [+]/[=]
//        answerCoding usado pois DE014 é do tipo #choice
* item[=].item[=].enableWhen[+].question           = "LCVM.A1.DE014"
* item[=].item[=].enableWhen[=].operator           = #=
* item[=].item[=].enableWhen[=].answerCoding.code  = "Y"


// ============================================================
// SEÇÃO 1 — TIPO DE VIOLÊNCIA
// ============================================================
* item[+].linkId = "LCVM.A1.Secao1"
* item[=].text   = "Seção 1 — Tipo de Violência"
* item[=].type   = #group

// LCVM.A1.DE001 — Afirmativas (Select all that apply)
* item[=].item[+].linkId         = "LCVM.A1.DE001"
* item[=].item[=].text           = "Das afirmativas abaixo, quais representam algo que você já viveu ou vivencia?"
* item[=].item[=].definition     = "Tipo de violência sofrida ou vivenciada."
* item[=].item[=].type           = #choice
* item[=].item[=].repeats        = true
* item[=].item[=].answerValueSet = "https://mangara.hsl.org.br/fhir/ValueSet/lcvm_tipoViolencia"

// LCVM.A1.DE1E — Escore (calculado)
* item[=].item[+].linkId                            = "LCVM.A1.DE1E"
* item[=].item[=].text                              = "Escore do tipo de violência"
* item[=].item[=].type                              = #integer
* item[=].item[=].readOnly                          = true
* item[=].item[=].extension[+].url                  = $calcExp
* item[=].item[=].extension[=].valueExpression.language    = #text/fhirpath
* item[=].item[=].extension[=].valueExpression.description = "Somar os pontos de cada uma das respostas à pergunta LCVM.A1.DE001"
// FIX 4: linkId na expressão FHIRPath corrigido de 'LCVM.A1.DE12' para 'LCVM.A1.DE001'
* item[=].item[=].extension[=].valueExpression.expression  = "%resource.item.where(linkId='LCVM.A1.DE001').answer.valueCoding.extension.where(url='http://hl7.org/fhir/StructureDefinition/ordinalValue').value.aggregate($total + $this, 0)"


// ============================================================
// SEÇÃO 2 — TRATAMENTO SERVIÇOS DE SAÚDE
// ============================================================
* item[+].linkId = "LCVM.A1.Secao2"
* item[=].text   = "Seção 2 — Tratamento Serviços de Saúde"
* item[=].type   = #group

// LCVM.A1.DE14 — Recebe atendimento?
* item[=].item[+].linkId = "LCVM.A1.DE14"
* item[=].item[=].text   = "Em relação às afirmações respondidas anteriormente, você está recebendo atendimento ou acompanhamento de algum serviço de saúde ou de proteção às mulheres?"
* item[=].item[=].type   = #boolean

// LCVM.A1.DE15 — Qual serviço? (enableWhen DE14 = true)
* item[=].item[+].linkId              = "LCVM.A1.DE15"
* item[=].item[=].text                = "Caso afirmativo, qual serviço?"
* item[=].item[=].definition          = "Acompanhamento em Serviço de Saúde."
* item[=].item[=].type                = #choice
* item[=].item[=].required            = true
* item[=].item[=].repeats             = true
* item[=].item[=].answerValueSet      = "https://mangara.hsl.org.br/fhir/ValueSet/lcvm_servicoSaude"
* item[=].item[=].enableWhen[+].question      = "LCVM.A1.DE14"
* item[=].item[=].enableWhen[=].operator      = #=
* item[=].item[=].enableWhen[=].answerBoolean = true
* item[=].item[=].enableBehavior              = #all
