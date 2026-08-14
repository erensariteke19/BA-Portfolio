# ErenShop EDU — BA, SQL ve API Öğrenme Projesi

ErenShop EDU; e-ticaret sipariş, ürün, müşteri, sepet ve ödeme alanlarını kapsayan; iş analizi, SQL Server, REST API ve Postman çalışmalarını aynı çözüm bağlamında gösteren uygulamalı bir portföy projesidir.

Bu bölümdeki dört uçtan uca BA vaka çalışması, ileri SQL analizleri, API/SQL doğrulamaları ve kurumsal teslim dokümanları Eren Sarıteke'nin portföy çalışmalarıdır. Kullanılan eğitim altyapısının kaynak ve yayın izni bilgisi [CREDITS.md](CREDITS.md) dosyasında tutulur.

## Proje bileşenleri

| Bileşen | Teknik içerik | Portföyde gösterilen yetkinlik |
|---|---|---|
| İş analizi vaka çalışmaları | Business case, süreç, gereksinim, backlog, veri modeli, RTM ve UAT | Uçtan uca BA teslimi |
| REST API katmanı | FastAPI route/schema/service yapısı ve Swagger | Sistem ve entegrasyon analizi |
| SQL katmanı | SQL Server ilişkisel şema, sentetik veri ve ileri analiz sorguları | Veri analizi ve iş içgörüsü |
| API test katmanı | Postman collection/environment ve API–DB kontrolleri | Contract, negatif test ve mutabakat |
| Kullanıcı deneyimi | Wireframe ve UI fonksiyonel spesifikasyonu | Gereksinimden ekrana izlenebilirlik |

## Uyguladığım analiz kapsamı

- İş problemini ve kapsamı tanımlamak
- Mevcut durumu ve etkilenen modülleri analiz etmek
- Fonksiyonel ve fonksiyonel olmayan gereksinimleri yazmak
- İş kurallarını ve ana/alternatif süreç akışlarını belirlemek
- Veri modeli değişikliklerini önermek
- Kabul kriterleri, test senaryoları, riskler ve açık sorular hazırlamak

## Vaka çalışmaları

| Vaka | İş problemi | Öne çıkan analiz alanları | Doküman |
|---|---|---|---|
| Abonelik siparişi | Tekrarlanan alışverişlerin manuel yapılması | Otomatik sipariş, ödeme retry, stok, bildirim, abonelik durumları | [Vaka paketini incele](case-studies/01-subscription-order/README.md) |
| **Sipariş iptali — öne çıkan vaka** | Müşterinin iptal için destek ekibine ihtiyaç duyması | AS-IS/TO-BE, user stories, Gherkin, RTM, stok, refund ve audit | [Vaka paketini incele](featured-case-study/README.md) |
| Sipariş notu | Siparişe özel teslimat bilgisinin aktarılamaması | Validasyon, güvenlik, karakter sınırı kararı ve kargo etiketi | [Vaka paketini incele](case-studies/02-order-note/README.md) |
| Ürün görseli yönetimi | Ürün görsellerinin standart ve kontrollü yönetilememesi | Dosya doğrulama, görsel limiti, resize, kapak görseli ve veri modeli | [Vaka paketini incele](case-studies/03-product-images/README.md) |

[Dört vaka çalışmasını karşılaştır](case-studies/README.md)

## Üretilen BA çıktıları

- Yönetici özeti, amaç, kapsam ve kapsam dışı maddeler
- Mevcut durum ve etkilenen sistem bileşenleri
- Paydaş analizi
- Benzersiz kimliklerle fonksiyonel gereksinimler
- Performans, güvenlik, kullanılabilirlik ve loglama gereksinimleri
- İş kuralları ve süreç akışları
- Yeni tablo/alan önerileri ve sistem entegrasyonları
- Kabul kriterleri ve pozitif/negatif test senaryoları
- Riskler, varsayımlar ve karara bağlanacak açık sorular

## Öne çıkan çalışma

[Sipariş İptali — Uçtan Uca İş Analizi](featured-case-study/README.md), portföydeki en kapsamlı vaka çalışmasıdır. Orijinal analiz geliştirilerek aşağıdaki ek çıktılar hazırlanmıştır:

- AS-IS / TO-BE süreçleri ve sipariş durum diyagramı
- Ölçülebilir functional/non-functional requirements
- Altı user story ve Gherkin acceptance criteria
- Use case, iş kuralları ve mantıksal ER modeli
- 10 test senaryosu ve üç UAT senaryosu
- Requirements Traceability Matrix
- Risk/karar kaydı, API test planı ve SQL analiz planı
- Sipariş iptal modalı wireframe'i
- Business case, KPI/baseline yaklaşımı ve seçenek analizi
- Paydaş haritası, RACI ve iletişim planı
- MoSCoW öncelikli MVP backlog ile Definition of Ready/Done
- Değişiklik etki analizi ve API sözleşmesi
- Release, UAT, go/no-go ve yayın sonrası izleme planı
- Jira/Confluence uyumlu epic, story, backlog ve Agile ceremony paketi
- BPMN/UML swimlane ve sequence diagramları
- Sistem entegrasyonu, veri eşleme ve hata stratejisi
- KPI sözlüğü ve operasyon dashboard gereksinimleri
- Düzenlenmiş profesyonel Word sürümü

## Profesyonel Word sürümleri

| Çalışma | Düzenlenmiş belge | Orijinal belge |
|---|---|---|
| Abonelik siparişi | [Profesyonel](10-original-documents/01-abonelik-siparisi-analizi-profesyonel.docx) | [Orijinal](10-original-documents/01-abonelik-siparisi-analizi.docx) |
| Sipariş iptali | [Profesyonel](10-original-documents/02-siparis-iptal-analizi-profesyonel.docx) | [Orijinal](10-original-documents/02-siparis-iptal-analizi.docx) |
| Sipariş notu | [Profesyonel](10-original-documents/03-siparis-notu-analizi-profesyonel.docx) | [Orijinal](10-original-documents/03-siparis-notu-analizi.docx) |
| Ürün görseli | [Profesyonel](10-original-documents/04-urun-gorseli-analizi-profesyonel.docx) | [Orijinal](10-original-documents/04-urun-gorseli-analizi.docx) |

## Örnek izlenebilirlik

| İş ihtiyacı | Gereksinim | İş kuralı | Kabul kriteri | Test |
|---|---|---|---|---|
| Müşteri uygun siparişi iptal edebilsin | FG-01 / FG-02 | IK-01 | KK-01 | TS-01 |
| Sevk edilmiş sipariş iptal edilmesin | FG-03 | IK-02 | KK-02 | Negatif iptal senaryosu |
| Abonelik ödemesi başarısızsa yeniden denensin | FG-05 / FG-06 | IK-01 | KK-04 / KK-08 | TS-02 |
| Geçersiz ürün görseli yüklenmesin | Görsel formatı ve boyut gereksinimleri | Dosya doğrulama kuralları | KK-03 / KK-04 / KK-05 | TS-02 / TS-03 / TS-04 |

## Kullanılan yaklaşım ve araçlar

`BRD/SRS yaklaşımı` · `Use case analizi` · `Veri modelleme` · `Acceptance criteria` · `Test design` · `SQL Server` · `Postman` · `Swagger` · `FastAPI` · `Microsoft Word`

## Teknik öğrenme ortamı

Platform kaynakları [05-learning-platform](05-learning-platform/README-PORTFOLIO.md) altında yer alır:

- `app/`: FastAPI route, schema ve service katmanları
- `frontend/`: Mağaza, dokümantasyon ve eğitim ekranları
- `sql/`: Veritabanı, tablo, sentetik veri ve eğitim sorguları
- `postman/`: API koleksiyonu ve yerel environment
- `docs/`: Kurulum, API, SQL ve Postman eğitim notları

Yerel `.env`, sanal ortam, cache dosyaları ve yüklenen kullanıcı belgeleri bilerek dahil edilmemiştir.

## Kanıt ve kaynak notu

Çalıştırılan SQL/API testleri tarihli sonuç raporu ve ekran kanıtlarıyla işaretlenir; tasarım seviyesindeki UAT ve hedef mimari çıktıları ayrıca belirtilir. Böylece uygulanmış doğrulamalar ile önerilen çözüm tasarımı birbirine karıştırılmaz. Eğitim platformunun kaynak bilgisi yalnızca [CREDITS.md](CREDITS.md) dosyasında açıklanır.

## Çalıştırılmış API ve SQL kanıtları

Ürün listeleme, arama, detay görüntüleme, oluşturma, güncelleme ve pasife alma akışları Postman üzerinden çalıştırıldı. Pasife alma davranışı SQL Server üzerinde `IsActive=0` sonucu ile ayrıca doğrulandı. Pasif ürünün API tarafından `404 Not Found` ile gizlendiği negatif senaryoda kontrol edildi.

[Test sonuçlarını ve 8 ekran kanıtını incele](09-test-cases-uat/API-SQL-TEST-RESULTS.md)

[Kurumsal API test yaklaşımını incele](09-test-cases-uat/API-TEST-STRATEGY.md): contract, iş kuralı, negatif/güvenlik, API–DB mutabakatı, veri yönetimi, assertion ve CI hedefi.

## Kurumsal teslim standardı

Öne çıkan sipariş iptali vakası yalnızca analiz metni değil; problemden fayda ölçümüne ve release kararına uzanan bir BA teslim paketidir. Gereksinimler benzersiz kimliklerle yönetilir, backlog önceliklendirilir, karar/risk sahipleri belirlenir, çözüm API ve veri seviyesinde tarif edilir, test kapsamı RTM ile izlenir ve yayın kapıları tanımlanır.

Tasarlanan ancak çalıştırılmayan UAT senaryoları ile gerçekten çalıştırılmış API/SQL testleri açıkça ayrılmıştır. Bu ayrım, kanıt seviyesini doğru sunmak ve portföyde yanıltıcı sonuç iddiasından kaçınmak için korunur.
