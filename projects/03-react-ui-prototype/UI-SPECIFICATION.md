# UI/UX Fonksiyonel Spesifikasyonu

Bu doküman wireframe'lerin yalnızca görsel çalışma olmadığını; gereksinim, durum, hata ve erişilebilirlik kurallarıyla birlikte ele alındığını gösterir.

## Ekran envanteri

| Ekran | Birincil kullanıcı | Ana görev | Bağlı vaka |
|---|---|---|---|
| Sipariş iptal modalı | Müşteri | Uygun siparişi iptal etme | FR-001–010, US-001–006 |
| Abonelik checkout | Müşteri | Periyot ve ödeme ile abonelik oluşturma | Abonelik vakası |
| Sipariş notu | Müşteri | Teslimat/hazırlama notu ekleme | Sipariş notu vakası |
| Görsel yöneticisi | Admin/İçerik ekibi | Görsel yükleme, sıralama ve kapak seçme | Ürün görseli vakası |

## Sipariş iptal modalı — bileşen kuralları

| Bileşen | Kural | Hata / durum | İzlenebilirlik |
|---|---|---|---|
| İptal butonu | Yalnızca iptal edilebilir statüde aktif | Uygun değilse gizli/pasif ve açıklamalı | FR-001–003 |
| Sipariş özeti | Sipariş no, tarih, tutar ve güncel statü | Yüklenemezse işlem başlatılamaz | NFR-006 |
| Neden seçimi | Opsiyonel standart seçenek | “Diğer” seçilirse metin açılır | FR-007 |
| Açıklama | En fazla 500 karakter | Alan içi sayaç ve doğrulama mesajı | BRULE-006 |
| Onay butonu | Tek gönderim; işlem sırasında disabled | Progress ve tekrar tıklama koruması | US-006 |
| Sonuç mesajı | İptal ve refund durumunu ayrı açıklar | Correlation ID destek akışına taşınır | FR-009, NFR-007 |

## Ekran durumları

`Default` → `Validating` → `Submitting` → `Success` veya `Business Error` / `Technical Error`.

- Loading sırasında tekrar işlem engellenir.
- Business error uygulanabilir açıklama verir; teknik ayrıntı göstermez.
- Teknik hatada güvenli tekrar veya destek yolu sunulur.
- Başarı ekranı sipariş statüsünü yeniler; refund tamamlandı izlenimi yaratmaz.

## Erişilebilirlik kabulü

- Modal açıldığında odak başlığa/ilk anlamlı alana taşınır ve modal içinde tutulur.
- `Esc` işlem başlamadan önce kapatır; işlem sırasında veri kaybı yaratmaz.
- Alanlar görünür label, programatik ad ve hata ilişkisine sahiptir.
- Durum mesajları ekran okuyucuya canlı bölgeyle duyurulur.
- Klavye sırası anlamlıdır; renk tek durum göstergesi değildir.
- Kontrast ve hedef boyutları WCAG 2.1 AA standardına göre doğrulanır.

## Analitik olayları

| Olay | Amaç | Asgari alanlar |
|---|---|---|
| `cancellation_viewed` | Funnel başlangıcı | orderStatus, channel |
| `cancellation_submitted` | Girişim ölçümü | reasonCode, orderStatus |
| `cancellation_succeeded` | Tamamlama ölçümü | durationMs, refundRequired |
| `cancellation_failed` | Kök neden analizi | errorCode, dependency |

Kişisel veri ve serbest metin analitik olaylara taşınmaz.

## Tasarım teslim kontrol listesi

- Ekran, gereksinim ve acceptance criteria bağlantıları mevcut.
- Default, loading, empty, success ve hata durumları tanımlı.
- Yetki ve veri görünürlüğü kontrol edilmiş.
- Responsive ve erişilebilirlik davranışı belirtilmiş.
- Analytics, API alanları ve hata kodlarıyla eşleşiyor.
- QA için test edilebilir UI kabul kriterleri hazır.
