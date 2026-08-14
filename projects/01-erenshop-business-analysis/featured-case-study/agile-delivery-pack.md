# Agile Delivery Pack — Jira/Confluence Uyumlu

## Epic

| Alan | İçerik |
|---|---|
| Epic key | ESHOP-CXL |
| Başlık | Self-Service Order Cancellation |
| Problem | Uygun siparişlerin iptali destek kanalına ve manuel kontrole bağımlı |
| Outcome | Müşteri eforunu ve destek temasını azaltan, izlenebilir iptal akışı |
| KPI | Self-servis tamamlama, teknik başarı, refund istisnası, P95 süre |
| MVP | Pending/uygun Processing, stok iadesi, refund, audit ve bildirim |

## Jira story alan örneği

| Jira alanı | Örnek değer |
|---|---|
| Issue type | Story |
| Summary | Customer cancels an eligible Pending order |
| Description | As a customer, I want to cancel my eligible order so that I do not need to contact support. |
| Acceptance criteria | US-001 içindeki Gherkin senaryoları |
| Business rules | BRULE-001, BRULE-003, BRULE-004 |
| Priority | Highest / Must |
| Story points | 5 — ekip refinement tahmini |
| Labels | `order`, `cancellation`, `mvp`, `customer` |
| Components | Order API, Inventory, Web UI |
| Test links | TC-001, TC-007, UAT-001 |
| Dependencies | Auth/sahiplik, stok transaction, audit logging |

## Backlog parçalama

| Issue | Tür | Çıktı | Kabul özeti |
|---|---|---|---|
| ESHOP-CXL-1 | Story | Pending sipariş iptali | Durum Cancelled, stok geri, audit oluşur |
| ESHOP-CXL-2 | Story | Processing sipariş iptali | Handover yoksa işlem başarılı |
| ESHOP-CXL-3 | Story | Refund başlatma | Refund durumu ayrı ve izlenebilir |
| ESHOP-CXL-4 | Story | İptal nedeni | Opsiyonel kod + kontrollü açıklama |
| ESHOP-CXL-5 | Enabler | Idempotency ve correlation ID | Tekrarlı istek veri bozulması üretmez |
| ESHOP-CXL-6 | Enabler | Dashboard/alarmlar | Hata ve süre metrikleri izlenir |
| ESHOP-CXL-7 | Bug example | Duplicate stock restoration | Aynı cancellation yalnızca bir kez stok artırır |

## Refinement kontrolü

- Story bağımsız değer üretir ve tek sprintte tamamlanabilir boyuttadır.
- Business rule, veri etkisi, hata sözleşmesi ve bağımlılık belirtilmiştir.
- QA ile pozitif/negatif/concurrency senaryoları gözden geçirilmiştir.
- Açık kararın sahibi ve hedef tarihi vardır.
- Story, RTM içindeki requirement ve test kimliklerine bağlıdır.

## Sprint ve törenlerde BA sorumluluğu

| Tören | BA katkısı |
|---|---|
| Discovery | Problem, kullanıcı, süreç, veri ve KPI keşfi |
| Refinement | Story parçalama, AC netleştirme, bağımlılık/risk görünürlüğü |
| Planning | Öncelik, kapsam ve iş değeri açıklama; hazır olmayan işi işaretleme |
| Daily | İş kararı blocker'larını çözme ve açık soruları takip etme |
| Three Amigos | BA–Developer–QA ortak örnek ve test tasarımı |
| Review | Acceptance criteria ve iş sonucu doğrulaması |
| Retrospective | Analiz/talep akışındaki iyileştirmeleri backlog'a alma |

## Confluence sayfa ağacı

```text
Self-Service Order Cancellation
├── 01 Business Case & Scope
├── 02 Stakeholders / RACI
├── 03 AS-IS & TO-BE
├── 04 Requirements / Business Rules
├── 05 API & Data Contract
├── 06 Backlog / Decisions / Risks
├── 07 Test / UAT / RTM
└── 08 Release / KPI / Operations
```

Bu paket Jira/Confluence alanlarına taşınmaya hazır örnek dokümantasyondur; gerçek kurumsal Jira geçmişi iddiası taşımaz.
