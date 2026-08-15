# ErenShop SQL ile İş ve Veri Analizi

Bu vaka çalışması, SQL'i yalnızca veri listelemek için değil; satış performansını ölçmek, müşteri davranışını anlamak, operasyonel riskleri tespit etmek ve veri kalitesini doğrulamak için nasıl kullandığımı gösterir.

## Proje özeti

| Başlık | Açıklama |
|---|---|
| İş alanı | E-ticaret — ürün, müşteri, sepet, sipariş ve ödeme |
| Veritabanı | Microsoft SQL Server / ErenShopDB |
| Veri | Anonim ve sentetik e-ticaret veri seti |
| Rolüm | İş sorularını tanımlama, sorguları çalıştırma, API–veritabanı tutarlılığını doğrulama ve analiz paketini hazırlama |
| Teknik bağlam | ErenShop SQL Server şeması ve sentetik e-ticaret verisi |

## İş karar alanları

| Karar alanı | Analiz odağı | Desteklenen aksiyon |
|---|---|---|
| Ticari performans | Gelir, sipariş, sepet, dönemsel trend, kategori ve ürün katkısı | Ticari öncelik, kampanya ve ürün portföyü kararı |
| Müşteri değeri | Harcama, sipariş sıklığı, tekrar satın alma ve segmentasyon | CRM, sadakat ve müşteri koruma aksiyonu |
| Operasyon | Sipariş durumları, stok riski, satılmayan ürün ve ödeme başarısı | Operasyon kuyruğu, satın alma ve ödeme yöntemi incelemesi |
| Finansal mutabakat | Sipariş, kalem ve ödeme tutarlarının tutarlılığı | Fark kaydı, kök neden ve düzeltme aksiyonu |
| Veri kalitesi | Yinelenen sepet, geçersiz değer, eksik ilişki ve referential bütünlük | Veri kalite kuralı, sahiplik ve kontrol periyodu |

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

- [İleri seviye iş analizi sorguları](advanced-business-analysis.sql) — iş, veri kalitesi ve mutabakat odaklı gelişmiş sorgu paketi
- [SELECT referans sorguları](../01-erenshop-business-analysis/05-learning-platform/sql/04_training_select_queries.sql)
- [JOIN referans sorguları](../01-erenshop-business-analysis/05-learning-platform/sql/05_training_join_queries.sql)
- [Raporlama sorguları](../01-erenshop-business-analysis/05-learning-platform/sql/06_training_report_queries.sql)
- [Tablo oluşturma betiği](../01-erenshop-business-analysis/05-learning-platform/sql/02_create_tables.sql)
- [Sentetik örnek veri](../01-erenshop-business-analysis/05-learning-platform/sql/03_seed_data.sql)
- [Veri modeli özeti](../01-erenshop-business-analysis/07-database-sql/DATA-MODEL-OVERVIEW.md)

## API–SQL mutabakat kanıtı

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

API–DB mutabakat senaryosu kontrollü ortamda çalıştırılmış ve ekran kanıtlarıyla belgelenmiştir. İleri analiz sorguları mevcut ErenShop şemasına uygun, karar alanlarıyla ilişkilendirilmiş çalıştırılabilir bir analiz paketidir; üretim sonucu veya gerçek şirket verisi iddiası taşımaz.
