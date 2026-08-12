# ErenShop EDU Öğrenme Platformu

Bu klasör, Eren Sarıteke'nin BA/SQL/API öğrenme çalışmalarına temel oluşturan ErenShop EDU platformunun yayımlanabilir kaynaklarını içerir.

## Geliştirici ve izin

Platform **Ömer Gökdere** tarafından geliştirilmiştir ve Eren Sarıteke'nin portföyünde kaynak belirtilerek yayımlanmasına izin verilmiştir. Katkı ayrıntıları için [proje kredi dosyasına](../CREDITS.md) bakın.

## Klasörler

| Klasör | Açıklama |
|---|---|
| `app/` | FastAPI backend: route, schema, service ve yardımcı katmanlar |
| `frontend/` | Mağaza, eğitim ve dokümantasyon arayüzleri |
| `sql/` | SQL Server kurulum, şema, örnek veri ve eğitim sorguları |
| `postman/` | Postman collection ve yerel environment |
| `docs/` | Kurulum, API, SQL, Postman ve eğitim akışı belgeleri |

## Güvenli yayın kapsamı

Dahil edilmeyenler:

- Yerel `.env` dosyası ve bağlantı bilgileri
- Python sanal ortamı (`venv`)
- `__pycache__` ve `.pyc` dosyaları
- Çalışma sırasında yüklenen kullanıcı belgeleri
- Örnek/referans analiz belgesi

## Çalıştırma

Kurulum için [KURULUM.md](docs/KURULUM.md) ve `.env.example` dosyasını kullanın. Veritabanı scriptlerini numara sırasıyla çalıştırın; ardından bağımlılıkları kurup uygulamayı başlatın.

## Portföy değerlendirme notu

Bu klasör platformun teknik bağlamını gösterir. Eren Sarıteke'nin kişisel BA çıktıları bir üst klasördeki `10-original-documents/` altında bulunur. SQL ve Postman'da Eren tarafından gerçekleştirilecek yeni çalışmalar, karışıklık olmaması için daha sonra ayrı `eren-work/` klasörlerinde yayımlanacaktır.
