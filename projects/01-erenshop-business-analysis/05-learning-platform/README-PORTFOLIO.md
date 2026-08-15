# ErenShop Teknik Referans ve Doğrulama Ortamı

Bu klasör, Eren Sarıteke'nin BA, SQL, API ve UI analizlerinin teknik bağlamını oluşturan ErenShop ortamının yayımlanabilir kaynaklarını içerir.

## Geliştirici ve izin

Bu klasör, BA çalışmalarının üzerinde doğrulandığı FastAPI, SQL Server, Postman ve web arayüzü tabanlı teknik referans ortamını içerir. Kaynak ve yayın izni bilgisi [proje kredi dosyasında](../CREDITS.md) tutulur.

## Klasörler

| Klasör | Açıklama |
|---|---|
| `app/` | FastAPI backend: route, schema, service ve yardımcı katmanlar |
| `frontend/` | Mağaza, analiz çalışma ve dokümantasyon arayüzleri |
| `sql/` | SQL Server kurulum, şema, sentetik veri ve referans sorguları |
| `postman/` | Postman collection ve yerel environment |
| `docs/` | Kurulum, API, SQL, Postman ve teknik çalışma belgeleri |

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

Bu klasör çözümün teknik bağlamını ve doğrulama yüzeyini gösterir. Eren Sarıteke'nin BA teslimleri bir üst proje yapısında; SQL analizi ve API–DB test kanıtları ilgili analiz/test klasörlerinde yayımlanır. Tasarım çıktıları ile çalıştırılmış kanıtlar kanıt seviyesi belirtilerek ayrıştırılır.
