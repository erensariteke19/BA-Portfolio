# Business Case ve Fayda Ölçüm Planı

## Yönetici özeti

Müşterinin uygun siparişi destek ekibine başvurmadan iptal edebilmesi önerilmektedir. Çözüm; müşteri eforunu ve destek temasını azaltırken sipariş, stok ve ödeme iadesi süreçlerinin kontrollü yürütülmesini hedefler. Bu dokümandaki hedefler örnek proje hedefidir; üretim sonucu iddiası taşımaz.

## Problem ve fırsat

Mevcut süreçte müşteri destek ekibine ulaşır, temsilci sipariş ve kargo durumunu kontrol eder, uygun siparişi iptal eder ve gerekirse finans ekibine iade talebi açar. Süreç kanal bağımlılığı, bekleme süresi, manuel hata ve operasyon maliyeti üretir.

| Boyut | Mevcut etki | Hedef durum |
|---|---|---|
| Müşteri deneyimi | Mesai ve destek kanalına bağımlı | 7/24 self-servis işlem |
| Operasyon | Tekrarlayan manuel kontrol | Kuralların sistem tarafından uygulanması |
| Veri bütünlüğü | Sipariş, stok ve refund ayrışabilir | Transaction ve izlenebilir durum yönetimi |
| Raporlama | Neden ve başarısızlık görünürlüğü sınırlı | İptal nedeni, hata ve süre KPI'ları |

## Hedefler ve KPI'lar

| KPI | Tanım | Başlangıç değeri | 90 günlük hedef | Ölçüm kaynağı | Sahip |
|---|---|---:|---:|---|---|
| Self-servis tamamlama oranı | Başarılı self-servis iptal / uygun iptal girişimi | Ölçülecek | >= %85 | Uygulama olayları | Product Owner |
| İptal kaynaklı destek teması | İptal konulu ticket / toplam sipariş | Ölçülecek | >= %30 azalma | CRM/Helpdesk | Operasyon |
| Teknik başarı oranı | Hatasız tamamlanan iptal / başlatılan işlem | Ölçülecek | >= %99 | API logları | Engineering |
| P95 yanıt süresi | İptal API'si yüzde 95 yanıt süresi | Ölçülecek | <= 3 sn | APM | Engineering |
| Refund istisna oranı | Manuel incelemeye düşen refund / refund gereken iptal | Ölçülecek | <= %2 | Payment logları | Finans |
| Tekrarlı stok düzeltmesi | Aynı iptal için birden çok stok artışı | 0 hedefi | 0 | Audit/DB kontrolü | Engineering |

Başlangıç değerleri üretim keşfi sırasında dört haftalık veriyle belirlenecektir. Hedefler Product Owner, Operasyon ve Finans onayıyla baseline sonrası revize edilir.

## Seçenek analizi

| Seçenek | Fayda | Maliyet / risk | Karar |
|---|---|---|---|
| Mevcut manuel süreci koru | Geliştirme maliyeti yok | Müşteri ve operasyon problemi devam eder | Elendi |
| Destek ekranını iyileştir | Temsilci süresini azaltır | Self-servis sağlamaz | Ara çözüm |
| Kural tabanlı self-servis iptal | En yüksek müşteri ve operasyon faydası | Entegrasyon ve veri bütünlüğü kontrolü gerekir | Önerilen |

## Kapsam ve bağımlılıklar

MVP; Pending ve uygun Processing siparişleri, sahiplik/statü kontrolü, stok iadesi, refund başlatma, audit log ve kullanıcı bildirimini kapsar. Shipped sonrası iptal/iade, admin istisna akışı ve SMS/push MVP dışıdır. Sipariş, stok, ödeme, kimlik/yetki, bildirim ve gözlemlenebilirlik servisleri bağımlılıktır.

## Fayda doğrulama

1. Yayın öncesi dört haftalık baseline alınır.
2. İlk iki hafta hata ve refund istisnaları günlük izlenir.
3. 30/60/90. günlerde KPI gerçekleşmeleri hedeflerle karşılaştırılır.
4. Negatif sapmalar için aksiyon sahibi ve termin içeren iyileştirme kaydı açılır.
5. 90. günde devam/genişletme kararı Product Owner tarafından verilir.
