// ============================================================
// Aliases
// ============================================================
Alias: $loinc                 = http://loinc.org
Alias: $LCVMTipoViolenciaCS   = https://mangara.hsl.org.br/fhir/CodeSystem/lcvm_tipoViolencia
Alias: $qCalculatedExpression = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression


// ============================================================
// Questionnaire
// ============================================================

Instance: consulta-acolhimento-lcvm
InstanceOf: Questionnaire
Usage: #definition

* url            = "https://mangara.hsl.org.br/fhir/Questionnaire/consulta-acolhimento-lcvm"
* name           = "ConsultaAcolhimentoLCVM"
* title          = "Consulta de Acolhimento  Linha de cuidado Contra a Violência à Mulher (LCVM)"
* status         = #draft
* version        = "1.0.0"
* experimental   = false
* subjectType[+] = #Patient


// ======================================================
// [LCVM.Acolhimento] Seção 1 — Triagem de Violência
// ======================================================

* item[+].linkId   = "Secao1-Triagem-Violencia"
* item[=].text     = "Seção 1 – Triagem de Violência"
* item[=].type     = #group
* item[=].required = false
* item[=].code     = $loinc#76501-6 "Violence type Reported"

// ── LCVM.A1.DE1 ──────────────────────────────────────────────
* item[=].item[+].linkId   = "LCVM.A1.DE1"
* item[=].item[=].text     = "Das afirmativas abaixo, quais representam algo que você já viveu ou vivencia?"
* item[=].item[=].type     = #choice
* item[=].item[=].required = true
* item[=].item[=].repeats  = true
* item[=].item[=].definition = "Tipo de violência. Os atributos de ranking (ordinalValue) estão definidos nos conceitos da source OCL /orgs/HSL/sources/lcvm_tipoViolencia/."
* item[=].item[=].answerValueSet = "https://mangara.hsl.org.br/fhir/ValueSet/lcvm_tipoViolencia"


// ── LCVM.A1.DE1.ESCORE — Cálculo automático ──────────────────
* item[=].item[+].linkId   = "LCVM.A1.DE1.ESCORE"
* item[=].item[=].text     = "Pontuação de Triagem de Violência"
* item[=].item[=].type     = #decimal
* item[=].item[=].required = false
* item[=].item[=].readOnly = true
* item[=].item[=].repeats  = false
* item[=].item[=].definition = "Soma dos ordinalValues (atributos de ranking do CS lcvm_tipoViolencia) das afirmativas selecionadas em LCVM.A1.DE1."
* item[=].item[=].extension[+].url = $qCalculatedExpression
* item[=].item[=].extension[=].valueExpression.language    = #text/fhirpath
* item[=].item[=].extension[=].valueExpression.description = "Soma os ordinalValues dos conceitos selecionados em LCVM.A1.DE1"
* item[=].item[=].extension[=].valueExpression.expression  = "%resource.item.where(linkId='LCVM.A1.DE1').answer.valueCoding.extension('http://hl7.org/fhir/StructureDefinition/ordinalValue').valueDecimal.sum()"


// ======================================================
// [LCVM.Acolhimento] Seção 2 — Acompanhamento em Serviço de Saúde
// ======================================================

* item[+].linkId   = "Secao2-Acompanhamento"
* item[=].text     = "Seção 2 – Acompanhamento em Serviço de Saúde ou Proteção"
* item[=].type     = #group
* item[=].required = false
* item[=].code[0].system  = "https://hl7.org/fhir/R4/codesystem-observation-category"
* item[=].code[0].code    = #social-history
* item[=].code[0].display = "Social History"


// ── LCVM.A1.DE2 ──────────────────────────────────────────────
* item[=].item[+].linkId   = "LCVM.A1.DE2"
* item[=].item[=].text     = "Em relação às afirmações respondidas anteriormente, você está recebendo atendimento ou acompanhamento de algum serviço de saúde ou de proteção às mulheres?"
* item[=].item[=].type     = #choice
* item[=].item[=].required = true
* item[=].item[=].repeats  = true
* item[=].item[=].definition = "Acompanhamento em Serviço de Saúde ou de Proteção. Permite múltiplas seleções."
* item[=].item[=].answerValueSet = "https://mangara.hsl.org.br/fhir/ValueSet/lcvm_servicoSaude"