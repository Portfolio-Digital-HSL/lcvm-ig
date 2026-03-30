Alias: $sdc = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire
Alias: $constraint = http://hl7.org/fhir/StructureDefinition/questionnaire-constraint

Instance: LCVM-B1-Acolhimento
InstanceOf: $sdc
Usage: #definition

* url = "https://mangara.hsl.org.br/fhir/Questionnaire/lcvm-b1-acolhimento"
* version = "0.2.0"
* status = #draft
* language = #pt-BR
* subjectType[+] = #Patient

// ================= CADASTRO =================

* item[+].linkId = "/cadastro"
* item[=].text = "Dados do Paciente"
* item[=].type = #group
* item[=].required = true

* item[=].item[+].linkId = "/cadastro/cpf"
* item[=].item[=].text = "CPF"
* item[=].item[=].type = #string
* item[=].* item[=].item[=].extension[=].extension[=].valueString = "answer.value.matches('^[0-9]{11}$')"
* item[=].item[=].extension[=].extension[=].valueString = "CPF deve conter exatamente 11 dígitos numéricos"


* item[=].item[+].linkId = "/cadastro/nome-completo"
* item[=].item[=].text = "Nome completo"
* item[=].item[=].type = #string
* item[=].item[=].required = true

* item[=].item[+].linkId = "/cadastro/nome-social"
* item[=].item[=].text = "Nome social"
* item[=].item[=].type = #string
* item[=].item[=].required = true

* item[=].item[+].linkId = "/cadastro/nacionalidade"
* item[=].item[=].text = "Nacionalidade"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/iso3166-1-2"

* item[=].item[+].linkId = "/cadastro/data-nascimento"
* item[=].item[=].text = "Data de nascimento"
* item[=].item[=].type = #date
* item[=].item[=].required = true

* item[=].item[+].linkId = "/cadastro/identidade-genero"
* item[=].item[=].text = "Identidade de gênero"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = "https://terminologia.saude.gov.br/fhir/ValueSet/BRIdentidadeGenero"

* item[=].item[+].linkId = "/cadastro/raca-cor"
* item[=].item[=].text = "Raça/Cor"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = "https://terminologia.saude.gov.br/fhir/ValueSet/BRRacaCor"

* item[=].item[+].linkId = "/cadastro/etnia"
* item[=].item[=].text = "Etnia"
* item[=].item[=].type = #choice
* item[=].item[=].answerValueSet = "https://terminologia.saude.gov.br/fhir/ValueSet/BREtniaIndigena"

* item[=].item[+].linkId = "/cadastro/telefone"
* item[=].item[=].text = "Telefone"
* item[=].item[=].type = #string
* item[=].item[=].required = true

* item[=].item[+].linkId = "/cadastro/cidade"
* item[=].item[=].text = "Cidade"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = "https://terminologia.saude.gov.br/fhir/ValueSet/BRMunicipio"

* item[=].item[+].linkId = "/cadastro/uf"
* item[=].item[=].text = "UF"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = "https://terminologia.saude.gov.br/fhir/ValueSet/BRUnidadeFederativa"


// ================= ATENDIMENTO================//

•⁠  ⁠item[+].linkId = "/atendimento"
•⁠  ⁠item[=].text = "Dados do Atendimento"
•⁠  ⁠item[=].type = #group

•⁠  ⁠item[=].item[+].linkId = "/atendimento/data"
•⁠  ⁠item[=].item[=].text = "Data da consulta"
•⁠  ⁠item[=].item[=].type = #date
•⁠  ⁠item[=].item[=].required = true
•⁠  ⁠item[=].item[=].code[=].code = #DataAtendimento

•⁠  ⁠item[=].item[+].linkId = "/atendimento/estabelecimento"
•⁠  ⁠item[=].item[=].text = "Estabelecimento"
•⁠  ⁠item[=].item[=].type = #string
•⁠  ⁠item[=].item[=].initial.valueString = "Hospital Sírio Libanês"
•⁠  ⁠item[=].item[=].readOnly = true

•⁠  ⁠item[=].item[+].linkId = "/atendimento/cnes"
•⁠  ⁠item[=].item[=].text = "CNES"
•⁠  ⁠item[=].item[=].type = #string
•⁠  ⁠item[=].item[=].initial.valueString = "2079127"
•⁠  ⁠item[=].item[=].readOnly = true

// ================= PROFISSIONAL================//

* item[+].linkId = "/profissional"
* item[=].text = "Dados do Profissional"
* item[=].type = #group

* item[=].item[+].linkId = "/profissional/nome"
* item[=].item[=].text = "Nome do profissional"
* item[=].item[=].type = #string
* item[=].item[=].code[0].code = "ProfissionalNome"

* item[=].item[+].linkId = "/profissional/conselho-uf"
* item[=].item[=].text = "Conselho profissional UF"
* item[=].item[=].type = #string
* item[=].item[=].code[0].code = "ConselhoProfissionalNomeUF"

* item[=].item[+].linkId = "/profissional/conselho-numero"
* item[=].item[=].text = "Número do conselho"
* item[=].item[=].type = #string
* item[=].item[=].code[0].code = "ConselhoProfissionalNumero"

* item[=].item[+].linkId = "/profissional/ocupacao"
* item[=].item[=].text = "Ocupação"
* item[=].item[=].type = #choice
* item[=].item[=].answerValueSet = "https://terminologia.saude.gov.br/fhir/ValueSet/BROcupacao"

// ==========================
//      SOAP - SUBJETIVO
// ==========================

* item[+].linkId = "/soap/subjetivo"
* item[=].text = "Subjetivo"
* item[=].type = #group

* item[=].item[+].linkId = "/soap/subjetivo/texto"
* item[=].item[=].text = "Subjetivo"
* item[=].item[=].type = #string
* item[=].item[=].required = true

* item[=].item[+].linkId = "/soap/subjetivo/orientacao"
* item[=].item[=].text = "Orientação sexual"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = "https://terminologia.saude.gov.br/fhir/ValueSet/OrientacaoSexual"

* item[=].item[+].linkId = "/soap/subjetivo/estado-civil"
* item[=].item[=].text = "Estado Civil"
* item[=].item[=].type = #choice
* item[=].item[=].answerValueSet = "https://terminologia.saude.gov.br/fhir/ValueSet/BREstadoCivil"

* item[=].item[+].linkId = "/soap/subjetivo/deficiencia"
* item[=].item[=].text = "Possui deficiência?"
* item[=].item[=].type = #choice
* item[=].item[=].answerValueSet = "https://mangara.hsl.org.br/fhir/ValueSet/LCVM_Deficiencia"

* item[=].item[+].linkId = "/soap/subjetivo/tipo-deficiencia"
* item[=].item[=].text = "Tipo de deficiência"
* item[=].item[=].type = #choice
* item[=].item[=].repeats = true
* item[=].item[=].answerValueSet = "https://mangara.hsl.org.br/fhir/ValueSet/BRTipoDeficiencia"

// ==========================
// SOAP - OBJETIVO
// ==========================

* item[+].linkId = "/soap/objetivo"
* item[=].text = "Objetivo"
* item[=].type = #string
* item[=].required = true

// ==========================
// SOAP - AVALIAÇÃO / PROBLEMAS
// ==========================

* item[+].linkId = "/soap/avaliacao"
* item[=].text = "Avaliação / Problemas"
* item[=].type = #group

* item[=].item[+].linkId = "/soap/avaliacao/ciap2"
* item[=].item[=].text = "CIAP2"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].repeats = true
* item[=].item[=].answerValueSet = "https://terminologia.saude.gov.br/fhir/ValueSet/BRCIAP2"

* item[=].item[+].linkId = "/soap/avaliacao/severidade-ciap2"
* item[=].item[=].text = "Severidade CIAP2"
* item[=].item[=].type = #choice
* item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/condition-severity"

* item[=].item[+].linkId = "/soap/avaliacao/cid10"
* item[=].item[=].text = "CID10"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].repeats = true
* item[=].item[=].answerValueSet = "https://terminologia.saude.gov.br/fhir/ValueSet/BRCID10"

* item[=].item[+].linkId = "/soap/avaliacao/severidade-cid10"
* item[=].item[=].text = "Severidade CID10"
* item[=].item[=].type = #choice
* item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/condition-severity"


// ==========================
// SOAP-PLANO
// ==========================

* item[+].linkId = "/soap/plano"
* item[=].text = "Plano"
* item[=].type = #group

* item[=].item[+].linkId = "/soap/plano/cuidados"
* item[=].item[=].text = "Plano de cuidados"
* item[=].item[=].type = #string

* item[=].item[+].linkId = "/soap/plano/desfecho"
* item[=].item[=].text = "Desfecho"
* item[=].item[=].type = #choice
* item[=].item[=].answerValueSet = "https://mangara.hsl.org.br/fhir/ValueSet/tipo-desfecho_mangara"









