# ErenShop SQL ile İş ve Veri Analizi

Bu vaka çalışması, SQL'i yalnızca veri listelemek için değil; satış performansını ölçmek, müşteri davranışını anlamak, operasyonel riskleri tespit etmek ve veri kalitesini doğrulamak için nasıl kullandığımı gösterir.

## Proje özeti

| Başlık | Açıklama |
|---|---|
| İş alanı | E-ticaret — ürün, müşteri, sepet, sipariş ve ödeme |
| Veritabanı | Microsoft SQL Server / ErenShopDB |
| Veri | Eğitim amacıyla hazırlanmış sentetik veri seti |
| Rolüm | İş sorularını tanımlama, sorguları çalıştırma, API–veritabanı tutarlılığını doğrulama ve analiz paketini hazırlama |
| Teknik bağlam | ErenShop SQL Server şeması ve sentetik e-ticaret verisi |

## Yanıtlanan iş soruları

1. Satış geliri, sipariş sayısı, ortalama sepet tutarı ve aktif müşteri sayısı nedir?
2. Aylık gelir ve sipariş adedi nasıl değişmektedir?
3. Gelir açısından en güçlü kategori ve ürünler hangileridir?
4. Her kategorinin kendi içindeki en güçlü ürünleri hangileridir?
5. En değerli müşteriler kimlerdir ve müşteri segmentleri nasıl oluşmaktadır?
6. Tekrar sipariş veren müşteri oranı nedir?
7. Sipariş statülerindeki dağılım operasyonel darboğaz gösteriyor mu?
8. Ödeme başarı oranı ve ödeme yöntemi performansı nedir?
9. Hangi ürünlerde stok riski vardır ve öncelik sırası ne olmalıdır?
10. Hiç satılmayan ürünler hangileridir?
11. Sipariş toplamları, sipariş kalemleri ve ödeme tutarları birbiriyle tutarlı mı?
12. Yinelenen aktif sepet, geçersiz fiyat/stok veya eksik ilişki gibi veri kalitesi sorunları var mı?

## SQL yetkinlikleri

| Seviye | Teknikler | Portföydeki kullanım |
|---|---|---|
| Temel | `SELECT`, `WHERE`, `LIKE`, `IN`, `BETWEEN`, `ORDER BY`, `TOP` | Ürün, müşteri ve stok filtreleri |
| Orta | `INNER/LEFT JOIN`, `GROUP BY`, `HAVING`, `SUM`, `COUNT`, `AVG`, `CASE` | Satış, kategori, müşteri ve stok raporları |
| İleri | CTE, alt sorgu, `NOT EXISTS`, `ROW_NUMBER`, `RANK`, `LAG`, running total | Segmentasyon, sıralama, trend ve satılmayan ürün analizi |
| Veri kalitesi | Mutabakat, duplicate ve referential kontrol sorguları | Sipariş–kalem–ödeme tutarlılığı |
| Güvenli işlem | `TRY/CATCH`, transaction, `COMMIT/ROLLBACK` | Soft-delete örneği ve kontrollü veri değişikliği |
| Performans | SARGable tarih filtresi ve indeks önerileri | Raporlama sorgularının ölçeklenebilirliği |

[Ayrıntılı SQL yetkinlik matrisini incele](SQL-CAPABILITY-MATRIX.md)

## Dosyalar

- [İleri seviye iş analizi sorguları](advanced-business-analysis.sql) — 20 profesyonel analiz ve kontrol sorgusu
- [SELECT eğitim sorguları](../01-erenshop-business-analysis/05-learning-platform/sql/04_training_select_queries.sql)
- [JOIN eğitim sorguları](../01-erenshop-business-analysis/05-learning-platform/sql/05_training_join_queries.sql)
- [Raporlama sorguları](../01-erenshop-business-analysis/05-learning-platform/sql/06_training_report_queries.sql)
- [Tablo oluşturma betiği](../01-erenshop-business-analysis/05-learning-platform/sql/02_create_tables.sql)
- [Sentetik örnek veri](../01-erenshop-business-analysis/05-learning-platform/sql/03_seed_data.sql)
- [Veri modeli özeti](../01-erenshop-business-analysis/07-database-sql/DATA-MODEL-OVERVIEW.md)

## Uygulanmış API–SQL doğrulaması

Postman üzerinden bir ürün oluşturuldu, güncellendi ve soft-delete ile pasife alındı. Ardından SQL Server üzerinde kaydın `IsActive = 0` olduğu doğrulandı. Pasif ürünün API tarafından `404 Not Found` ile gizlendiği de kontrol edildi.

- [Ayrıntılı API ve SQL test raporu](../01-erenshop-business-analysis/09-test-cases-uat/API-SQL-TEST-RESULTS.md)
- [SQL Server doğrulama ekranı](../01-erenshop-business-analysis/09-test-cases-uat/evidence/07-soft-delete-sql-proof.png)

## Analizden aksiyona

Bu sorguların amacı yalnızca sonuç tablosu üretmek değildir. Çıktılar aşağıdaki kararları destekler:

- Kritik stok ürünleri için satın alma önceliği oluşturmak
- Yüksek değerli müşteriler için sadakat/CRM aksiyonu planlamak
- Başarısız ödemelerin yoğunlaştığı yöntemleri incelemek
- Satılmayan ürünlerde kampanya, fiyat veya ürün sonlandırma kararı vermek
- Sipariş ve ödeme mutabakat hatalarını operasyon ekibine iletmek
- Kategori ve ürün performansına göre ticari öncelik belirlemek

## Şeffaflık notu

Temel ürün CRUD ve soft-delete senaryosu çalıştırılmış ve ekran kanıtlarıyla belgelenmiştir. İleri analiz sorguları mevcut ErenShop şemasına uygun, çalıştırılabilir bir portföy paketi olarak hazırlanmıştır; üretim sonucu veya gerçek şirket verisi iddiası taşımaz.
