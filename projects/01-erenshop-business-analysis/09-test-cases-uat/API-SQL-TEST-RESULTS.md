# Çalıştırılan API ve SQL Test Sonuçları

**Çalıştırma tarihi:** 12 Ağustos 2026  
**Test ortamı:** Postman, FastAPI, SQL Server, `ErenShopDB`  
**Testi çalıştıran:** Eren Sarıteke

| Test ID | Senaryo | Beklenen sonuç | Gerçekleşen sonuç | Durum | Kanıt |
|---|---|---|---|---|---|
| API-PRD-01 | Tüm ürünleri listeleme | Aktif ürünler `200 OK` ile dönmeli | 16 ürün listelendi | Passed | [Ekran](evidence/01-products-list-200.png) |
| API-PRD-02 | `mouse` anahtar kelimesiyle arama | Eşleşen ürün dönmeli | Kablosuz Mouse bulundu, `200 OK` | Passed | [Ekran](evidence/02-product-search-200.png) |
| API-PRD-03 | ID 1 ürün detayını görüntüleme | İlgili ürün dönmeli | Kablosuz Mouse detayı döndü, `200 OK` | Passed | [Ekran](evidence/03-product-detail-200.png) |
| API-PRD-04 | Test ürünü oluşturma | Yeni kayıt oluşmalı | ID 20 oluşturuldu, `201 Created` | Passed | [Ekran](evidence/04-product-create-201.png) |
| API-PRD-05 | ID 20 fiyat ve stok güncelleme | Fiyat 1099.90, stok 15 olmalı | Değerler güncellendi, `200 OK` | Passed | [Ekran](evidence/05-product-update-200.png) |
| API-PRD-06 | ID 20 ürünü pasife alma | İşlem başarılı olmalı | API `200 OK` döndürdü | Passed | [Ekran](evidence/06-product-delete-200.png) |
| SQL-PRD-01 | Pasife alma sonucunu veritabanından doğrulama | Kayıt korunmalı ve `IsActive=0` olmalı | ID 20 bulundu, `IsActive=0` | Passed | [Ekran](evidence/07-soft-delete-sql-proof.png) |
| API-PRD-07 | Pasife alınan ID 20 ürünün detayını isteme | Pasif ürün müşteriye gösterilmemeli | `404 Not Found`, “Ürün bulunamadı.” | Passed | [Ekran](evidence/08-inactive-product-404.png) |

## Doğrulanan iş kuralı

Ürün silme işlemi fiziksel silme değildir. Kayıt veritabanında korunur ve `IsActive` alanı `0` yapılarak pasife alınır (soft delete).

API yanıtındaki “Ürün silindi.” mesajı teknik davranışı tek başına açıklamadığı için sonuç SQL sorgusuyla ayrıca doğrulanmıştır. Ardından ID 20 için yeniden detay isteği gönderilmiş; API'nin pasif kaydı `404 Not Found` ile gizlediği görülmüştür. Böylece Postman → API → SQL Server veri akışı ve soft delete sonrası görünürlük kuralı uçtan uca kanıtlanmıştır.

## Değerlendirme

Bu çalışma yalnızca endpoint'in cevap verdiğini değil, API işleminin veritabanındaki gerçek sonucunu da kontrol eder. BA açısından iş kuralı, beklenen sonuç ve gerçekleşen sonuç birlikte izlenebilir hâle getirilmiştir.
