Alias: $sdc = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire
Alias: $constraint = http://hl7.org/fhir/StructureDefinition/questionnaire-constraint

Instance: LCVM-B0-Acolhimento
InstanceOf: $sdc
Usage: #definition

* url = "https://mangara.hsl.org.br/fhir/Questionnaire/lcvm-b0-acolhimento"
* version = "0.1.0"
* status = #draft
* language = #pt-BR
* subjectType[+] = #Patient
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









