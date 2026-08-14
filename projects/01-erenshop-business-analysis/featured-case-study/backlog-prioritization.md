# MVP Backlog ve Önceliklendirme

MoSCoW önceliği; iş değeri, risk azaltma, bağımlılık ve MVP zorunluluğu birlikte değerlendirilerek verilmiştir. Efor değerleri ekip planlamasında yeniden tahmin edilmesi gereken göreli story point örnekleridir.

| Sıra | Backlog item | İzlenebilirlik | MoSCoW | Değer (1-5) | Risk azaltma (1-5) | Efor | Bağımlılık |
|---:|---|---|---|---:|---:|---:|---|
| 1 | Sipariş sahipliği ve güncel statü kontrolü | US-001/002/003, FR-001/002/003 | Must | 5 | 5 | 5 | Auth, Order |
| 2 | Atomik iptal ve stok iadesi | US-001/002/006, FR-004/005 | Must | 5 | 5 | 8 | Order, Inventory |
| 3 | Idempotent tekrar istek koruması | US-006, NFR-005 | Must | 4 | 5 | 5 | Audit/DB |
| 4 | Ödemeli siparişte refund başlatma | US-004, FR-006 | Must | 5 | 5 | 8 | Payment |
| 5 | Refund hata kuyruğu ve operasyon görünürlüğü | US-004, FR-010 | Must | 4 | 5 | 5 | Payment, Ops |
| 6 | Audit log ve correlation ID | FR-008, NFR-007 | Must | 4 | 5 | 3 | Logging |
| 7 | İptal sonucu ve e-posta bildirimi | FR-009, DEC-004 | Should | 4 | 2 | 3 | Notification |
| 8 | İptal nedeni seçimi / açıklaması | US-005, FR-007 | Could | 3 | 1 | 3 | UI, Analytics |
| 9 | Admin Shipped istisna akışı | DEC-005 | Won't (MVP) | 2 | 2 | 8 | Operations |
| 10 | SMS/push bildirimi | DEC-004 | Won't (MVP) | 2 | 1 | 5 | Notification |

## Definition of Ready

- İş değeri, kullanıcı ve süreç adımı tanımlı.
- Gereksinim ve iş kuralı kimlikleri atanmış.
- Gherkin kabul kriterleri; pozitif, negatif ve hata akışını kapsıyor.
- Bağımlılık, veri etkisi, yetki ve NFR etkisi belirlenmiş.
- Açık kararlar ya kapalı ya da açıkça blocker olarak işaretli.

## Definition of Done

- Kod inceleme ve otomatik testler başarılı.
- Acceptance criteria ve ilgili testler geçti.
- Audit, hata mesajı, yetkilendirme ve gözlemlenebilirlik doğrulandı.
- API sözleşmesi ve kullanıcı dokümanı güncellendi.
- Kritik/yüksek hata açık değil; iş birimi UAT onayı kayıtlı.
- Rollback ve izleme planı release kaydına bağlandı.
