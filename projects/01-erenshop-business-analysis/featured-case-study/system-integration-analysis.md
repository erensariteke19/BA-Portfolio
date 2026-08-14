# Sistem Entegrasyon ve Veri Akışı Analizi

## Sistem bağlamı

| Sistem | Sorumluluk | Girdi | Çıktı / olay |
|---|---|---|---|
| Web/Mobile | Kullanıcı etkileşimi ve durum gösterimi | orderId, reason | Cancellation request/result |
| Identity | Kimlik ve kullanıcı bağlamı | token | customerId/roles |
| Order API | Orkestrasyon ve iş kuralları | request + identity | order/cancellation state |
| SQL Server | Sipariş, audit ve idempotency kaydı | transactional commands | consistent state |
| Inventory | Satılabilir stok güncellemesi | order items | stock restoration result |
| Payment | Refund işlemi | payment reference, amount | refund ID/status |
| Notification | E-posta | result event | delivery status |
| Observability/Ops | Log, metric, alarm ve kuyruk | correlation/error events | dashboard/task |

## Veri eşleme

| Kaynak alan | Hedef alan | Kural |
|---|---|---|
| Auth `subject` | Cancellation `customerId` | Sipariş sahibiyle eşleşmeli |
| Path `orderId` | Orders `Id` | Pozitif integer, güncel kayıt |
| Header `Idempotency-Key` | Cancellations `RequestKey` | Müşteri + sipariş kapsamında unique |
| Body `reasonCode` | Cancellations `ReasonCode` | Kontrollü sözlük değeri |
| Body `reasonText` | Cancellations `ReasonText` | Trim, max 500, hassas veri uyarısı |
| Orders `TotalAmount` | Refund `amount` | MVP tam iptal; para birimi korunur |
| Correlation header | Log/event `CorrelationId` | Tüm bağımlılıklara propagate edilir |

## Tutarlılık ve hata stratejisi

| Hata noktası | Beklenen sistem durumu | Kullanıcı sonucu | Operasyonel aksiyon |
|---|---|---|---|
| Sahiplik/statü başarısız | Veri değişmez | 404/409 | Kural metriği |
| DB transaction başarısız | Rollback | Teknik hata | Alarm + correlation ID |
| Inventory başarısız | Transaction/saga politikasına göre iptal tamamlanmaz | Tekrar mesajı | Retry/dead-letter |
| Payment timeout | Order Cancelled; refund Pending/ManualReview | İptal ve refund ayrı gösterilir | Finans kuyruğu |
| Notification başarısız | İşlem geri alınmaz | Sonuç ekranda görünür | Async retry |

## NFR ve gözlemlenebilirlik

- P95 API süresi <= 3 saniye; bağımlılık süreleri ayrı ölçülür.
- Correlation ID istek, log, refund ve operasyon görevi boyunca korunur.
- İş metrikleri: request, success, rejection, refund exception, duplicate request.
- Teknik metrikler: latency, 5xx, dependency timeout, queue depth.
- Loglar ödeme bilgisi ve serbest metni maskeleyerek tutar.

## Entegrasyon test kapsamı

Contract schema, sahiplik, statü yarışı, duplicate request, stok mutabakatı, payment timeout, notification failure ve correlation propagation test edilir. Mock kullanılan bağımlılıklar UAT raporunda açıkça belirtilir.
