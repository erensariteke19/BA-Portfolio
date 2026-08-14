# SQL Yetkinlik Matrisi

Bu matris, kullanılan SQL tekniğini çözdüğü iş problemi ve ürettiği karar desteğiyle eşleştirir.

| ID | İş ihtiyacı | SQL tekniği | Beklenen karar desteği |
|---|---|---|---|
| SQL-01 | Yönetici özet KPI'ları | Conditional aggregation, `COUNT DISTINCT`, `AVG` | Genel ticari görünüm |
| SQL-02 | Aylık satış trendi | CTE, tarih gruplama | Büyüme/düşüş takibi |
| SQL-03 | Aylık değişim oranı | `LAG` window function | Dönemsel performans karşılaştırması |
| SQL-04 | Kategori performansı | Çoklu JOIN, aggregation | Kategori önceliklendirme |
| SQL-05 | Kategori içi ürün sırası | `RANK() OVER(PARTITION BY)` | Ürün portföyü kararı |
| SQL-06 | Gelire katkı ve kümülatif pay | CTE, running total | Pareto/odak ürün analizi |
| SQL-07 | Müşteri 360 görünümü | LEFT JOIN, recency/frequency/monetary | CRM görünümü |
| SQL-08 | Müşteri segmentasyonu | CTE, `CASE` | Sadakat ve geri kazanım aksiyonu |
| SQL-09 | Tekrar satın alma oranı | CTE, conditional aggregation | Retention değerlendirmesi |
| SQL-10 | Sipariş statü dağılımı | `GROUP BY`, yüzde hesabı | Süreç darboğazı analizi |
| SQL-11 | Ödeme başarı oranı | Conditional aggregation | Ödeme yöntemi optimizasyonu |
| SQL-12 | Kritik stok önceliği | Satış hızı, `CASE`, LEFT JOIN | Satın alma/ikmal planı |
| SQL-13 | Satılmayan ürünler | `NOT EXISTS` | Kampanya veya ürün sonlandırma |
| SQL-14 | Sipariş toplamı mutabakatı | CTE, tolerance kontrolü | Finansal veri kalitesi |
| SQL-15 | Ödeme tutarı mutabakatı | CTE, LEFT JOIN | Eksik/fazla ödeme tespiti |
| SQL-16 | Duplicate aktif sepet | `GROUP BY`, `HAVING` | İş kuralı ihlali tespiti |
| SQL-17 | Geçersiz ana veri | Birleşik kalite kontrolleri | Temiz veri ve hata önleme |
| SQL-18 | Yetim kayıt kontrolü | LEFT JOIN / `IS NULL` | Referans bütünlüğü |
| SQL-19 | Güvenli soft-delete | Transaction, `TRY/CATCH` | Kontrollü veri değişikliği |
| SQL-20 | Performans iyileştirme | İndeks önerileri, SARGable filtre | Ölçeklenebilir raporlama |

## İş analisti açısından gösterdiği yetkinlikler

- Teknik gereksinimi ölçülebilir iş sorusuna dönüştürme
- Veri modeli ve tablo ilişkilerini okuyabilme
- KPI tanımlama ve metriklerin kapsamını açıklama
- İş kuralını veri kalite kontrolüne dönüştürme
- Analiz sonucunu operasyon, ürün ve finans aksiyonlarına bağlama
- API sonucunu kalıcı veriyle doğrulama
- Varsayım, kapsam ve kanıt seviyesini şeffaf biçimde ayırma

