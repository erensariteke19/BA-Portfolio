# Sipariş İptali — Uçtan Uca İş Analizi Vaka Çalışması

## Proje özeti

ErenShop müşterileri siparişlerini sistem üzerinden iptal edemediği için destek ekibine başvurmak zorundaydı. Bu çalışma, uygun durumdaki siparişlerin müşteri tarafından self-servis olarak iptal edilmesini; stokların geri yüklenmesini, gerekiyorsa ödeme iadesinin başlatılmasını ve işlemin izlenebilir şekilde kaydedilmesini tanımlar.

**Rol:** Junior Business Analyst — Eren Sarıteke  
**Alan:** E-ticaret / sipariş yönetimi  
**Yaklaşım:** Gereksinim analizi, AS-IS/TO-BE, user story, kabul kriteri, veri modeli, test ve izlenebilirlik  
**Durum:** Portföy vaka çalışması — uygulama geliştirme kapsam dışı

> Bu çalışma eğitim amaçlı, kurgusal bir e-ticaret senaryosudur. İsimler, tarihler ve iş verileri temsili kullanılmıştır.

## İş problemi ve değer önerisi

| Mevcut problem | Önerilen çözüm | Beklenen iş değeri |
|---|---|---|
| Müşteri iptal için desteğe başvuruyor | Pending/Processing siparişlerde self-servis iptal | Operasyon yükünde azalma |
| Stok ve ödeme adımları manuel takip ediliyor | İptal ile stok iadesi ve refund tetikleme | Daha az hata ve daha hızlı işlem |
| İptal geçmişi sınırlı | Audit log ve iptal nedeni | İzlenebilirlik ve raporlama |

## Kapsam

### Kapsam dahilinde

- Pending ve Processing siparişlerin müşteri tarafından iptali
- Sipariş durumunun Cancelled olarak güncellenmesi
- İptal edilen kalemlerin stoğa geri eklenmesi
- Ödemesi alınan siparişlerde refund sürecinin başlatılması
- Opsiyonel iptal nedeni ve audit log
- Kullanıcıya açık başarı/hata mesajları

### Kapsam dışında

- Shipped ve sonraki statülerde standart müşteri iptali
- Kısmi sipariş iptali
- İptal edilen siparişin yeniden aktifleştirilmesi
- Finans ekibinin refund operasyon detayları
- SMS ve push notification

## BA çıktıları

- [AS-IS / TO-BE ve uçtan uca süreçler](process-flows.md)
- [Fonksiyonel ve fonksiyonel olmayan gereksinimler](requirements.md)
- [User stories ve Gherkin kabul kriterleri](user-stories.md)
- [Use case ve iş kuralları](use-case.md)
- [Mantıksal veri modeli](data-model.md)
- [Test ve UAT senaryoları](test-cases-uat.md)
- [Requirements Traceability Matrix](traceability-matrix.md)
- [Riskler, varsayımlar ve açık sorular](risks-and-decisions.md)
- [Sipariş iptal ekran taslağı](wireframes/order-cancellation-wireframe.svg)
- [Profesyonel Word dokümanı](../10-original-documents/02-siparis-iptal-analizi-profesyonel.docx)

## Başarı ölçütleri

- Uygun siparişler için iptal işlemlerinin %95'inin destek talebi olmadan tamamlanması
- İptal isteğine en fazla 3 saniyede yanıt verilmesi
- Başarılı iptallerde sipariş durumu, stok ve audit log tutarlılığının %100 korunması
- Refund başlatma hatalarının izlenebilir olması ve operasyon kuyruğuna düşmesi

Bu hedefler vaka çalışması için önerilmiştir; gerçek üretim verisiyle doğrulanmış sonuçlar değildir.
