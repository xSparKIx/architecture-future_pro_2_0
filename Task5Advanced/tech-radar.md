# Расширенный технический радар «Будущего 2.0»

Таблица отражает целевой стек.

Статусы:

- **Adopt** – широко применяем
- **Trial** – пилотируем
- **Assess** – изучаем
- **Hold** – не рекомендуем или выводим из эксплуатации

## Архитектурные паттерны
| Паттерн | Статус | Обоснование |
| :--- | :--- | :--- |
| Data Mesh | Adopt | Децентрализация владения данными, ключевой принцип целевой архитектуры. |
| Event-Driven Architecture | Adopt | Асинхронная интеграция доменов через Kafka, основа взаимодействия. |
| CQRS / Event Sourcing | Trial | Для критичных финансовых операций (журнал проводок). |
| Self-Service BI | Adopt | Витрина данных с семантическим слоем и федеративными запросами. |
| Anti-Corruption Layer | Adopt | Для миграции с Camel и старого DWH. |
| Data Lakehouse | Adopt | Единое хранилище на базе S3 + Iceberg. |

## Хранение и обработка данных
| Технология | Статус | Обоснование |
| :--- | :--- | :--- |
| Apache Iceberg | Adopt | Формат таблиц в Lakehouse, поддержка ACID, time-travel. |
| Trino / Dremio | Adopt | Федеративный SQL-движок для Self-Service. |
| dbt (data build tool) | Adopt | Трансформации и тестирование данных. |
| Apache Spark | Assess | Для тяжёлых ETL/ML пайплайнов (может заменить Airflow+Trino на некоторых задачах). |
| Microsoft SQL Server 2008 | Hold | Легаси, выводится из эксплуатации. Замена на PostgreSQL. |
| PowerBuilder | Hold | Унаследованный интерфейс операторов, будет заменён на Web-клиенты. |
| Power BI (Desktop) | Hold → Assess | Остаётся как один из источников визуализации, но основная аналитика переезжает на Superset. |

## Потоковая передача и интеграция
| Технология | Статус | Обоснование |
| :--- | :--- | :--- |
| Apache Kafka | Adopt | Центральная событийная шина. |
| Debezium | Adopt | CDC-коннекторы для публикации событий из PostgreSQL. |
| Apache Camel | Hold | Заменяется на Kafka-native интеграции, временно используется как мост. |
| Schema Registry (Confluent) | Adopt | Версионирование и контракты событий. |

## Витрина и BI
| Технология | Статус | Обоснование |
| :--- | :--- | :--- |
| Apache Superset (Embedded) | Adopt | Self-Service BI с встраиванием в портал. |
| Cube.js | Adopt | Семантический слой и кэширование метрик. |
| React + TypeScript | Adopt | Фронтенд портала витрины. |
| Kong / Envoy | Adopt | API Gateway и Service Mesh. |

## Инфраструктура и DevOps
| Технология | Статус | Обоснование |
| :--- | :--- | :--- |
| Kubernetes (K8s) | Adopt | Оркестрация контейнеризованных сервисов. |
| Terraform | Adopt | Infrastructure as Code. |
| GitOps (ArgoCD) | Adopt | Развёртывание и CI/CD. |
| MinIO / Ceph (S3 compatible) | Adopt | Объектное хранилище Data Lakehouse. |
| PostgreSQL / CockroachDB | Adopt | Транзакционные базы данных доменов. |
| Vault | Adopt | Управление секретами и PKI. |
| Grafana Loki / Tempo | Adopt | Централизованное логирование и трейсинг. |
| MLflow | Adopt | Реестр ML-моделей. |