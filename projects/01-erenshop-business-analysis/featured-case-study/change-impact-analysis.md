# Değişiklik Etki Analizi

| Alan | Değişiklik | Risk / dikkat noktası | Doğrulama |
|---|---|---|---|
| Müşteri arayüzü | Uygun siparişte iptal aksiyonu ve onay modalı | Yanlış durumda aksiyon gösterimi | UI durum matrisi, erişilebilirlik testi |
| Order servisi | Durum kontrolü ve Cancelled geçişi | Yarış koşulu, geçersiz durum geçişi | Transaction ve concurrency testi |
| Inventory | Kalem bazında stok iadesi | Çifte stok artışı | Idempotency ve DB mutabakatı |
| Payment | Refund isteği ve durum takibi | Timeout/partial failure | Mock hata testi ve operasyon kuyruğu |
| Notification | Sonuç e-postası | Yanlış veya tekrarlı bildirim | Event ve template doğrulaması |
| Veri modeli | Cancellation ve refund audit alanları | Eksik geçmiş / kişisel veri | Migration, retention ve erişim kontrolü |
| Raporlama | Neden, başarı, hata ve süre metrikleri | Tutarsız KPI tanımı | Veri sözlüğü ve örnek sorgu doğrulaması |
| Operasyon | İstisna takip süreci | Sahipsiz manuel görev | SLA, kuyruk sahibi ve runbook |
| Müşteri hizmetleri | Yeni self-servis yönlendirmesi | Eski cevap şablonları | Bilgi bankası ve temsilci iletişimi |

## Veri geçişi

Mevcut siparişler otomatik olarak iptal edilebilir sayılmaz. Özellik açıldığında güncel statü, sahiplik ve lojistik bilgisi gerçek zamanlı kontrol edilir. Yeni audit yapısı yalnızca yayın sonrası işlemleri kaydeder; geçmiş veri backfill'i ayrı karar gerektirir.

## Operasyonel hazırlık

- Refund istisna kuyruğunun sahibi ve müdahale SLA'sı tanımlanır.
- Destek ekibine iptal/refund durumlarının farkı anlatılır.
- Dashboard alarm eşikleri ve correlation ID arama yöntemi paylaşılır.
- Feature flag, kademeli açılış ve geri alma adımları release planına eklenir.

## Gizlilik ve güvenlik

- Sipariş sahipliği sunucu tarafında doğrulanır.
- Başka kullanıcıya ait sipariş varlığını sızdırmayacak tutarlı hata davranışı uygulanır.
- İptal nedeni alanında hassas veri girişi teşvik edilmez; saklama ve maskeleme politikası belirlenir.
- Audit kayıtlarına rol bazlı erişim ve değiştirilemezlik kontrolü uygulanır.
