# Роадмап внедрения Data Mesh в «Будущем 2.0»

## Ключевые роли
- **Data Product Owner (DPO)** – представитель бизнес-домена, отвечает за качество и доступность дата-продукта, определяет SLA и контракты.
- **Data Engineer** – строит пайплайны, поддерживает инфраструктуру доменных данных, реализует коннекторы и витрины.
- **BI-аналитик** – консультирует домен по метрикам, создаёт семантический слой и шаблоны отчётов.
- **Platform Architect** – развивает общую data platform (Kafka, Lakehouse, Catalog), помогает с интеграцией.
- **Data Governance Officer** – следит за соблюдением регуляторных требований, ведёт каталог и метаданные.

## Диаграмма этапов (Mermaid Gantt)

[Ссылка на диаграмму](https://mermaid.live/edit#pako:eNp1Vm1r21YU_isXQcAGKejFL7I_DNqE0bCFFfphdPiLGt84orZUZLlrFwK20zQd6VpaBoMR2m30B6hO3Gh27fyFe__Rzjl6sRN7hhD56up5nnue5xz5UNnzm1ypKy3HC8OGx-ATumGbM_G7mMu-mIsvYiYi-ZaJCfzry6GImBjB2lhcwv0xXMVwd9sJHbbLuwesYDFxAc9diqiYADadkH_rBx0nZOwhfLTd3eSG88ztZjc2HmobnYaX3OjyvdD1PSY-ilhMQciQFXStwsRXMZaDzRRX_A00V0iEIsSYyZeoRw5BVySm8jUsz8W_TFwDRgTLL-hIX-UZEzGeZw54-OwlrNQdoHzKVWbqZknTq9lFLeV6L8_EZ3we4VJRwHUmTxgoQKQx0Y1YQXyCDTPxD2g9UfEMEQiLU2kD4I0TUYgwF5MiqydU9grnzTLDCb9z9h87KlX7Xu-Rynb2-CMetDKEWopgmCnCX3C-KyrHZ6KboHtr9EfoqyauyfFLeSwmpG2UAhs6AZc13UiB_wDIa3mMx2EPeHtfe8CDp-4eZ3d3EG-KgVnwZEgIkCGZK2afg4yBfIVSQG5MWka5uYWKZti3EwAhha0RbJvmNVqx40-4GdNNKL3K7uxokASgAAJcisCjT5htTEMx02llOv_fjDtb3-dnRfoL1A_JKmw5Hd4Gl368twpnp3AfoTADiuo8BwRZwAAH7JMhMfZZ4tAIyjEkvbMMsbKoZW73BzjUsTzNAbfv_wDPUutCH1NdlsszXoelp1jngHBBSl5Sh0Mk-qgC_k6zxgJv5al8h0lKjoN9NcOMUe1By5vV7jvOWJO0Are1pu9xgCSl-JKkNsbyoI0R2XmVCysYtmatzAbs1xGiMNzM5G-gf4BaINyUdurJmN33f-bB3Z7bbvKAhIGeUiYs8_5D0jqAQ7Mo9RcYb5UoqQHEUb6ChRP49hbpoe8xHtlOqNwtooWBRDSVb5ZMvJEtyBQrBNxpar7Xfl5MgdL-rFIp03hh6WAAJSWYMI87gQYPtrXQ7cB4n1P-F3NhzGrljaWplPdsNcsGXFQW4QVV6Xthkad0IcpMogyn5lFVEHlG29O8yNc35nBGWFoivJWMd-T9DL3WaN4Dz9LrYEJF_jUvHh5WC32t4wSPebg-sdo3iZUzyOsQXwUdt827oe_xfFapTG-umXxpzLFFk3Ci0fJk3SAtkDRsb-zkM5Wl3R-RRfmYK65hryyxv0eyxNMRM28I6FNMYipxdBsm6fAc5px2jcmgRSfBZER9oOViUR4cmmvQSJSiKq3AbSr1MOhxVelweJfjV-UQeRpKeMA7vKHU4bIJBjSUhncEzzxxvJ98v5M9Fvi91oFS33faXfjWe4K_F7ZdpxU4nXw14B406Jbf80Klbpplk1CU-qHyTKlXrU29plessm1X7YpRKqvKc9hVqm3aes3UDatqG7pllo5U5RfiNTbNklXSK1WrbNlVyzYAjjfd0A92k59D9Kvo6D8Pp5vm)

```mermaid
gantt
    title Дорожная карта внедрения Data Mesh (3 года)
    dateFormat  YYYY-MM
    axisFormat  %Y-%m

    section Пилот (0-6 мес.)
    Создание центральной платформы и команды :active, 2024-07, 2024-09
    Выбор пилотных доменов (ФинТех, Пациентский поток) :2024-08, 2024-09
    Внедрение Kafka, DataHub, Iceberg :2024-09, 2024-12
    Разработка пилотных дата-продуктов :2024-10, 2025-01
    Запуск Self-Service BI для пилотов :2025-01, 2025-02

    section Масштабирование (6-18 мес.)
    Добавление доменов (Клиники, AI-фабрика, Фарма) :2025-03, 2025-09
    Внедрение ACL для легаси (Camel, DWH) :2025-03, 2025-08
    Построение федеративных витрин :2025-06-01, 2025-12
    Обучение DPO в каждом домене :2025-06-01, 2025-10
    Миграция критичной отчётности на новую платформу :2025-09, 2026-03

    section Поддержка и финализация (18-36 мес.)
    Вывод из эксплуатации PowerBuilder :2026-04, 2026-09
    Отказ от Camel, миграция оставшихся интеграций :2026-04, 2026-12
    Отключение легаси DWH (read-only) :2026-10, 2027-03
    Переход к near-real-time обработке 95% потоков :2027-01, 2027-06
    Полная доменная аналитика и автономность команд :2027-04, 2027-06

    section Бизнес-цели
    Сокращение time-to-market отчётности -> минуты :milestone, 2025-02, 0d
    Запуск новых финтех-продуктов (кредиты, страхование) :milestone, 2025-06, 0d
    Выход в 2 новых региона :milestone, 2026-01, 0d
    Монетизация AI-диагностики :milestone, 2026-06, 0d