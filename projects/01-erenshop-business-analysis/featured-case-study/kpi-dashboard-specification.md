# KPI ve Operasyon Dashboard Spesifikasyonu

## Hedef kullanıcılar

Product Owner fayda gerçekleşmesini, Operasyon istisnaları, Finans refund durumunu, Engineering teknik sağlığı izler.

## KPI sözlüğü

| KPI | Formül | Boyutlar | Yenileme | Eşik / aksiyon |
|---|---|---|---|---|
| Eligible cancellation attempts | Uygun bulunan girişim sayısı | kanal, cihaz, orderStatus | Saatlik | Baseline |
| Self-service completion | başarılı / uygun girişim | kanal, hafta | Günlük | < %85 incele |
| Technical success | 2xx / toplam API çağrısı | endpoint, version | 5 dk | < %99 alarm |
| Business rejection rate | 409 / toplam girişim | rejectionCode, status | Saatlik | Ani artış incele |
| Refund exception rate | ManualReview/Failed / refund gereken iptal | provider, errorCode | Saatlik | > %2 alarm |
| P95 cancellation latency | yüzde 95 toplam süre | dependency, channel | 5 dk | > 3 sn alarm |
| Support contact rate | iptal ticket / toplam sipariş | hafta, kanal | Günlük | Baseline'a göre -%30 hedef |
| Duplicate protection | duplicate request / toplam girişim | clientVersion | Günlük | Artışta UI/retry incele |

## Veri kaynakları

| Kaynak | Ana alanlar | Kalite kontrolü |
|---|---|---|
| Cancellation audit | cancellationId, orderId, status, timestamps | unique ID, zorunlu durum |
| Order | customerId, total, orderStatus | cancellation ile 1:1 ilişki |
| Payment/refund | refundId, amount, status, provider | sipariş tutarı mutabakatı |
| API telemetry | duration, statusCode, errorCode | correlation ID doluluk |
| CRM/helpdesk | category, createdAt, channel | iptal kategori standardı |

## Dashboard sayfaları

1. **Executive:** tamamlama, ticket azalması, refund istisnası ve trend.
2. **Funnel:** viewed → submitted → eligible → succeeded.
3. **Operations:** bekleyen refund, yaşlandırma, hata kodu ve sahip.
4. **Technical:** latency, 5xx, dependency timeout ve duplicate request.
5. **Data quality:** eksik correlation ID, tutar/status mutabakatı ve duplicate kayıt.

## Filtre ve güvenlik

Tarih, kanal, sipariş durumu, ödeme sağlayıcı ve hata kodu filtreleri bulunur. Müşteri adı/e-posta gibi kişisel veri dashboard'a alınmaz. Finansal detay ve operasyon kuyruğu rol bazlı yetkilendirilir.

## Kabul kriterleri

- KPI formülleri örnek veriyle BA, Finans ve Product Owner tarafından doğrulanır.
- Dashboard toplamları kaynak SQL sorgularıyla mutabık olmalıdır.
- Filtreler tüm görsellerde tutarlı çalışır.
- Eşik aşımları sahip ve aksiyon linki üretir.
- Yenileme gecikmesi ve son başarılı yükleme zamanı görünürdür.

Bu belge dashboard gereksinimidir; yayımlanmış Power BI/Tableau dosyası iddiası taşımaz.
