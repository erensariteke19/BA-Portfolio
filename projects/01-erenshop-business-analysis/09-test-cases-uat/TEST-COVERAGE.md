# Test Kapsamı Özeti

Test seviyeleri, assertion standardı, veri/environment yönetimi, hata önceliği ve otomasyon hedefi için [API Test Stratejisi](API-TEST-STRATEGY.md) dokümanına bakın.

## Kapsanan test türleri

- Happy path senaryoları
- Durum/statü doğrulamaları
- Yetkilendirme kontrolleri
- Ödeme ve stok hata akışları
- Dosya formatı, boyutu ve adet limiti kontrolleri
- Bildirim ve loglama sonuçları
- Veri güncelleme ve ilişki kontrolleri

## Örnek kapsama

| Vaka | Pozitif senaryo | Negatif/alternatif senaryo |
|---|---|---|
| Abonelik | Başarılı abonelik oluşturma | Karttan ödeme alınamaması, stok yokluğu |
| Sipariş iptali | Pending/Processing siparişi iptal | Shipped siparişin engellenmesi |
| Sipariş notu | Geçerli not kaydetme | Limit aşımı veya yetkisiz erişim |
| Ürün görseli | Geçerli görsel yükleme | 5’ten fazla dosya, geçersiz format, 2 MB üzeri dosya |

## Çalıştırılan API ve SQL testleri — 12 Ağustos 2026

Testler yerel `ErenShopDB`, FastAPI ve Postman ortamında Eren Sarıteke tarafından çalıştırılmıştır.

| Test ID | Senaryo | Beklenen sonuç | Gerçekleşen sonuç | Durum | Kanıt |
|---|---|---|---|---|---|
| API-PRD-01 | Tüm ürünleri listeleme | Aktif ürünler `200 OK` ile dönmeli | 16 ürün listelendi | Passed | [Ekran](evidence/01-products-list-200.png) |
| API-PRD-02 | `mouse` anahtar kelimesiyle arama | Eşleşen ürün dönmeli | Kablosuz Mouse bulundu, `200 OK` | Passed | [Ekran](evidence/02-product-search-200.png) |
| API-PRD-03 | ID 1 ürün detayını görüntüleme | İlgili ürün dönmeli | Kablosuz Mouse detayı döndü, `200 OK` | Passed | [Ekran](evidence/03-product-detail-200.png) |
| API-PRD-04 | Test ürünü oluşturma | Yeni kayıt oluşmalı | ID 20 oluşturuldu, `201 Created` | Passed | [Ekran](evidence/04-product-create-201.png) |
| API-PRD-05 | ID 20 fiyat ve stok güncelleme | Fiyat 1099.90, stok 15 olmalı | Değerler güncellendi, `200 OK` | Passed | [Ekran](evidence/05-product-update-200.png) |
| API-PRD-06 | ID 20 ürünü pasife alma | İşlem başarılı olmalı | API `200 OK` döndürdü | Passed | [Ekran](evidence/06-product-delete-200.png) |
| SQL-PRD-01 | Pasife alma sonucunu veritabanından doğrulama | Kayıt korunmalı ve `IsActive=0` olmalı | ID 20 bulundu, `IsActive=0` | Passed | [Ekran](evidence/07-soft-delete-sql-proof.png) |

### Doğrulanan iş kuralı

Ürün silme işlemi fiziksel silme değildir. Kayıt veritabanında korunur ve `IsActive` alanı `0` yapılarak pasife alınır (soft delete). API yanıtındaki “Ürün silindi.” mesajı bu teknik davranışı tek başına açıklamadığı için sonuç ayrıca SQL sorgusuyla doğrulanmıştır.

BA vaka çalışmalarındaki UAT senaryoları tasarım seviyesindedir; yukarıdaki tablo ise gerçekten çalıştırılan teknik entegrasyon testlerini ve kanıtlarını gösterir.
