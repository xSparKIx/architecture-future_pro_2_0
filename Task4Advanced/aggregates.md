# Ключевые агрегаты доменов

Все агрегаты следуют принципам DDD: инварианты защищены, идентификаторы уникальны в рамках контекста, изменения происходят только через корень агрегата.

## Patient Management

### Patient (корень)
- **ID**: patient_uuid
- **Поля**: firstName, lastName, birthDate, gender, consentSigned (boolean), lastModified
- **Инварианты**: пациента нельзя удалить, только деактивировать; consent не может быть отозван задним числом для уже проведённых исследований.
- **События**: PatientRegistered, ConsentChanged, DemographicUpdated

## Clinical Services

### MedicalEncounter (корень)
- **ID**: encounter_uuid
- **Поля**: patientId, startTime, endTime, type (приём, исследование), status (planned, ongoing, completed)
- **Инварианты**: приём не может быть завершён без подписанного врачом заключения; исследование не может быть начато без назначения.
- **События**: EncounterPlanned, EncounterStarted, EncounterCompleted

### Study (под-агрегат в рамках Encounter)
- **ID**: study_uuid
- **Поля**: encounterId, type (X-Ray, MRI, Blood Work), status, result (ссылка на AI-предикт)
- **Инварианты**: результат исследования не может быть переписан, только добавлен addendum.
- **События**: StudyRequested, StudyResultReady

## Financial Services

### CreditAgreement (корень)
- **ID**: agreement_uuid
- **Поля**: patientId, amount, rate, term, status (draft, active, closed, defaulted)
- **Инварианты**: сумма не может быть отрицательной; перевод в default возможен только при просрочке > 90 дней.
- **События**: CreditAgreementCreated, CreditAgreementActivated, PaymentOverdue

### Invoice (корень)
- **ID**: invoice_uuid
- **Поля**: encounterId, amount, dueDate, status (pending, paid, overdue)
- **Инварианты**: оплата не может быть зафиксирована раньше даты счёта.
- **События**: InvoiceGenerated, InvoicePaid

## AI Diagnostics

### DiagnosticRequest (корень)
- **ID**: request_uuid
- **Поля**: studyId, modelId, inputData (DICOM, FHIR), status, confidence
- **Инварианты**: запрос не может быть выполнен дважды с одним и тем же id (идемпотентность).
- **События**: DiagnosisReady, PredictionFailed

## Identity & Access

### User (корень)
- **ID**: user_uuid
- **Поля**: login, role, permissions[], status
- **События**: UserCreated, UserOnboarded