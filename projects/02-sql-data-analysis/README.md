# ErenShop SQL ve Veri Doğrulama Çalışması

Bu çalışma, ErenShop eğitim ortamındaki SQL Server veritabanını inceleme ve API üzerinden yapılan ürün işlemlerini veritabanı seviyesinde doğrulama sürecimi gösterir.

## İş amacı

Ürün yönetimi API'sinde yapılan oluşturma, güncelleme ve pasife alma işlemlerinin veritabanına doğru yansıdığını kontrol etmek; API yanıtı ile kalıcı veri arasındaki tutarlılığı doğrulamak.

## Kapsam ve veri modeli

Çalışma; ürün, kategori, müşteri, sepet, sipariş ve ödeme tablolarından oluşan sentetik ErenShop veri setini kullanır. Teknik öğrenme altyapısı Ömer Gökdere tarafından sağlanmış, sorgular ve doğrulama adımları Eren Sarıteke tarafından uygulanmıştır.

- [Veri modeli özeti](../01-erenshop-business-analysis/07-database-sql/DATA-MODEL-OVERVIEW.md)
- [Tablo oluşturma betiği](../01-erenshop-business-analysis/05-learning-platform/sql/02_create_tables.sql)
- [Örnek veri betiği](../01-erenshop-business-analysis/05-learning-platform/sql/03_seed_data.sql)

## Kullanılan SQL çalışmaları

- [SELECT sorguları](../01-erenshop-business-analysis/05-learning-platform/sql/04_training_select_queries.sql)
- [JOIN sorguları](../01-erenshop-business-analysis/05-learning-platform/sql/05_training_join_queries.sql)
- [Raporlama sorguları](../01-erenshop-business-analysis/05-learning-platform/sql/06_training_report_queries.sql)
- [Eğitim tabloları](../01-erenshop-business-analysis/05-learning-platform/sql/08_training_tables.sql)
- [İş talepleri için örnek veriler](../01-erenshop-business-analysis/05-learning-platform/sql/09_seed_business_requests.sql)

## Uygulanan doğrulama senaryosu

1. Postman üzerinden test ürünü oluşturuldu ve API `201 Created` yanıtı verdi.
2. Ürünün fiyat ve stok bilgileri güncellendi ve API `200 OK` yanıtı verdi.
3. Ürün DELETE isteğiyle fiziksel olarak silinmeden pasife alındı.
4. SQL Server üzerinde ilgili kaydın `IsActive = 0` olduğu doğrulandı.
5. Aynı ürün API üzerinden yeniden istendiğinde `404 Not Found` döndüğü kontrol edildi.

## Sonuç ve iş değeri

Bu kontrol, yalnızca HTTP durum kodunun değil, veritabanındaki gerçek durumun da test edilmesini sağladı. Soft-delete iş kuralının beklendiği gibi çalıştığı ve pasif ürünün müşteriye sunulmadığı doğrulandı.

- [Ayrıntılı test sonuçları](../01-erenshop-business-analysis/09-test-cases-uat/API-SQL-TEST-RESULTS.md)
- [SQL doğrulama ekranı](../01-erenshop-business-analysis/09-test-cases-uat/evidence/07-soft-delete-sql-proof.png)

## Kullanılan araçlar

`SQL Server` · `SSMS` · `Postman` · `REST API` · `Swagger`
