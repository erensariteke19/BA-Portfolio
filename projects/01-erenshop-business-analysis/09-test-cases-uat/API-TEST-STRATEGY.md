# API Test Stratejisi

## Amaç

REST API'nin yalnızca başarılı cevap verdiğini değil; iş kurallarını, veri bütünlüğünü, güvenliği ve hata sözleşmesini tutarlı uyguladığını doğrulamak.

## Kapsam modeli

| Katman | Kontrol | Örnek |
|---|---|---|
| Contract | HTTP kodu, schema, zorunlu alan ve veri tipi | `201`, `Id`, `IsActive` |
| Business rule | Statü ve işlem uygunluğu | Pasif ürün detayda görünmez |
| Data | API sonucu ile DB durumunun tutarlılığı | Soft delete sonrası `IsActive=0` |
| Negative | Eksik/geçersiz/veri bulunamadı senaryosu | Geçersiz ID, limit dışı değer |
| Security | Kimlik, yetki ve veri sızıntısı | Yetkisiz kaynak erişimi |
| Reliability | Tekrar, timeout ve idempotency | Aynı create/cancel isteği |
| Performance | Yanıt süresi eşiği | Kritik GET/POST için P95 hedefi |

## Postman assertion standardı

Her kritik istekte en az aşağıdaki kontroller planlanır:

1. Beklenen HTTP status.
2. `Content-Type: application/json`.
3. Response schema ve zorunlu alanlar.
4. İş kuralına özgü değer kontrolü.
5. Yanıt süresi eşiği.
6. Dinamik ID'nin environment/collection variable'a alınması.
7. Sonraki istek ve DB kontrolüyle yaşam döngüsü doğrulaması.

## Veri ve environment yönetimi

- `baseUrl` environment değişkenidir; gizli bilgi collection'a yazılmaz.
- Test verileri sentetik ve tekrar üretilebilir olmalıdır.
- Create yanıtındaki ID sonraki GET/PUT/DELETE adımlarına aktarılır.
- Test sonunda veri silinmek yerine iş kuralı soft delete ise bu davranış korunur ve doğrulanır.
- Local, test ve staging ortamları ayrı environment dosyalarıyla yönetilir.

## Uçtan uca ürün yaşam döngüsü

`Health → Create → Detail → Update → Search/List → Soft Delete → DB Verification → Inactive GET 404`

Bu zincirin create, update, soft-delete, DB kontrolü ve pasif ürün negatif testi çalıştırılmıştır. Kanıtlar [API-SQL-TEST-RESULTS.md](API-SQL-TEST-RESULTS.md) içinde tutulur.

## Hata önceliği

| Seviye | Tanım | Örnek |
|---|---|---|
| Critical | Güvenlik veya yaygın veri kaybı | Başka müşterinin verisine erişim |
| High | Ana iş akışı çalışmıyor/veri tutarsız | Delete 200 fakat kayıt aktif |
| Medium | Alternatif akış veya mesaj hatası | Yanlış hata kodu/açıklama |
| Low | Kozmetik veya düşük etkili tutarsızlık | Metin/format problemi |

## Otomasyon ve CI hedefi

Collection; veri oluşturma ve temizleme kuralları tamamlandıktan sonra Newman ile çalıştırılabilir hale getirilir. CI kapısında smoke collection her build'de, tam regresyon staging dağıtımında koşar; rapor JUnit/HTML olarak saklanır. Bu bölüm hedef test mimarisidir, mevcut CI çalıştırma kanıtı değildir.

## Test tamamlanma kriteri

- Kritik endpointlerin pozitif ve negatif kapsamı tamamlandı.
- Critical/High açık hata yok.
- API–DB mutabakat kontrolleri geçti.
- İş kuralları gereksinim/test kimliklerine bağlı.
- Çalıştırılan testler tarih, environment ve ekran/rapor kanıtıyla kaydedildi.
