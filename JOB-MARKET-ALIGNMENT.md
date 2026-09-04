# İş Analisti Yetkinlik ve Portföy Kanıtları

Bu sayfa, iş analizi yetkinliklerimi portföyde incelenebilen proje çıktılarıyla eşleştirir. Amaç yalnızca araç veya yöntem adı sıralamak değil; bir iş ihtiyacını analizden doğrulamaya kadar nasıl ele aldığımı göstermektir.

## Yetkinlik–kanıt matrisi

| Yetkinlik alanı | Uyguladığım yaklaşım | İncelenebilir portföy kanıtı |
|---|---|---|
| İş ihtiyacı ve kapsam analizi | Problem, hedef, kapsam, kapsam dışı alanlar, varsayımlar ve başarı ölçütlerini tanımlama | [Business case](projects/01-erenshop-business-analysis/featured-case-study/business-case.md) · [Gereksinimler](projects/01-erenshop-business-analysis/featured-case-study/requirements.md) |
| Gereksinim yönetimi | Fonksiyonel ve fonksiyonel olmayan gereksinimleri; iş kurallarını, user story'leri ve kabul kriterlerini yapılandırma | [User story ve kabul kriterleri](projects/01-erenshop-business-analysis/featured-case-study/user-stories.md) · [İzlenebilirlik matrisi](projects/01-erenshop-business-analysis/featured-case-study/traceability-matrix.md) |
| Süreç analizi ve modelleme | Mevcut ve hedef süreci, roller ile karar noktalarını AS-IS/TO-BE ve BPMN/UML yaklaşımıyla modelleme | [BPMN/UML süreç spesifikasyonu](projects/01-erenshop-business-analysis/featured-case-study/bpmn-uml-specification.md) |
| Paydaş ve sorumluluk yönetimi | Paydaş etkisini, karar sorumluluklarını ve iletişim ihtiyacını belirleme | [Stakeholder ve RACI analizi](projects/01-erenshop-business-analysis/featured-case-study/stakeholder-raci.md) |
| Sistem ve entegrasyon analizi | Servisler arasındaki veri akışını, API davranışını, hata senaryolarını ve sistem sınırlarını tanımlama | [Sistem entegrasyon analizi](projects/01-erenshop-business-analysis/featured-case-study/system-integration-analysis.md) · [API sözleşmesi](projects/01-erenshop-business-analysis/featured-case-study/api-contract.md) |
| Veri analizi ve SQL | İş sorularını sorgulara dönüştürme; KPI, trend, segmentasyon, veri kalitesi ve mutabakat kontrolleri oluşturma | [SQL iş analizi paketi](projects/02-sql-data-analysis/advanced-business-analysis.sql) · [SQL yetkinlik matrisi](projects/02-sql-data-analysis/SQL-CAPABILITY-MATRIX.md) |
| API testi ve veri doğrulama | Pozitif/negatif API senaryolarını çalıştırma ve API sonuçlarını SQL Server kayıtlarıyla karşılaştırma | [API ve SQL test sonuçları](projects/01-erenshop-business-analysis/09-test-cases-uat/API-SQL-TEST-RESULTS.md) |
| Test, UAT ve izlenebilirlik | Gereksinimleri test senaryolarına bağlama; UAT kabul koşulları ile yayın karar noktalarını tanımlama | [Test ve UAT senaryoları](projects/01-erenshop-business-analysis/featured-case-study/test-cases-uat.md) · [Release ve UAT planı](projects/01-erenshop-business-analysis/featured-case-study/release-uat-plan.md) |
| Değişiklik ve etki analizi | Talebin süreç, veri, entegrasyon, kullanıcı ve operasyon üzerindeki etkilerini değerlendirme | [Change impact analizi](projects/01-erenshop-business-analysis/featured-case-study/change-impact-analysis.md) · [Change request](projects/01-erenshop-business-analysis/featured-case-study/change-request.md) |
| KPI ve raporlama gereksinimleri | Ölçüm tanımı, veri kaynağı, hesaplama mantığı, sahiplik ve izleme sıklığını açıklama | [KPI ve dashboard spesifikasyonu](projects/01-erenshop-business-analysis/featured-case-study/kpi-dashboard-specification.md) |
| Fonksiyonel ekran tasarımı | Gereksinimleri ekran davranışlarına, durumlara, validasyonlara ve erişilebilirlik kurallarına dönüştürme | [UI fonksiyonel spesifikasyonu](projects/03-react-ui-prototype/UI-SPECIFICATION.md) |
| Agile teslimat ve backlog | İş ihtiyacını epic, user story, kabul kriteri, öncelik ve bağımlılık yapısında teslimata hazırlama | [Agile teslimat paketi](projects/01-erenshop-business-analysis/featured-case-study/agile-delivery-pack.md) |

## Kanıtların kapsamı

- ErenShop ürün API'sindeki listeleme, arama, detay, oluşturma, güncelleme ve pasife alma akışları Postman ile çalıştırılmış; veritabanı etkileri SQL Server üzerinden kontrol edilmiştir.
- SQL çalışmaları portföyün mevcut veri modeline göre hazırlanmış, iş sorusu ve karar bağlantısı açıklanmış sorgulardır.
- Sipariş iptali vaka çalışmasındaki süreç, entegrasyon, backlog, KPI ve yayın çıktıları sentetik bir iş senaryosu için hazırlanmış hedef çözüm tasarımıdır.
- Portföyde gerçek iş deneyimi ile senaryo tabanlı vaka çalışmaları birbirinden açık biçimde ayrılır; üretim ortamında uygulanmamış sonuçlar uygulanmış gibi sunulmaz.

## Gelişim odağı

Portföy; Power BI/Excel dashboard uygulaması, otomatik API test raporlaması ve İngilizce analiz teslimleri gibi yeni kanıtlarla geliştirilmeye devam edecektir.
