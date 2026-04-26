# Каталог доменных событий (минимальный контракт)

Каждое событие содержит: `eventId`, `timestamp`, `source`, `specVersion`, и специфичную `payload`.

| Название события | Контекст‑источник | Подписчики | Описание / Семантика | Ключевые поля контракта |
| :--- | :--- | :--- | :--- | :--- |
| `PatientRegistered` | Patient Management | Clinical, Reporting, Identity | Пациент впервые зарегистрирован в системе. | `patientId`, `firstName`, `birthDate`, `timestamp` |
| `ConsentChanged` | Patient Management | Clinical | Изменение или отзыв согласия на обработку мед. данных. | `patientId`, `consentType`, `status`, `changedAt` |
| `DemographicUpdated` | Patient Management | Reporting | Обновление адреса, телефона и т.п. | `patientId`, `changedFields[]` |
| `EncounterPlanned` | Clinical | Patient (уведомление) | Запланирован приём или исследование. | `encounterId`, `patientId`, `scheduledAt` |
| `StudyRequested` | Clinical | AI | Врач назначил исследование, требующее AI-обработки. | `studyId`, `patientId`, `dicomRef`, `requestedAt` |
| `DiagnosisReady` | AI | Clinical, Reporting | AI-модель завершила анализ, готово заключение. | `studyId`, `requestId`, `diagnosis`, `confidence` |
| `PredictionFailed` | AI | DLQ, Ops | Ошибка валидации модели или входных данных. | `requestId`, `errorCode`, `message` |
| `ServiceProvided` | Clinical | Financial | Оказана услуга, можно выставлять счёт. | `encounterId`, `serviceCode`, `cost` |
| `InvoiceGenerated` | Financial | Notification | Создан счёт для пациента. | `invoiceId`, `patientId`, `amount`, `dueDate` |
| `PaymentOverdue` | Financial | Notification, Credit | Платёж не поступил вовремя. | `invoiceId`, `daysOverdue` |
| `CreditAgreementCreated` | Financial | Reporting | Оформлен кредитный договор. | `agreementId`, `patientId`, `amount` |
| `TransactionCompleted` | Financial | Reporting | Успешное проведение финансовой операции. | `transactionId`, `agreementId`, `amount`, `type` |
| `DrugRecalled` | Pharma | Clinical, Patient | Отзыв партии препарата. | `batchId`, `reason`, `validFrom` |
| `UserCreated` | Identity | Patient | Создан аккаунт пациента или сотрудника. | `userId`, `role`, `linkedPatientId` |
| `UserOnboarded` | Identity | Financial | Пользователь прошёл верификацию для финансовых операций. | `userId`, `kycStatus` |