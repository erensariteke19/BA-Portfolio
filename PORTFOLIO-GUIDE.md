# Portföy Kalite ve Yönetişim Standardı

Bu dosya, portföyde yayımlanan çalışmaların iş dünyasına uygunluk ölçütlerini tanımlar. Amaç dosya sayısını artırmak değil; her çıktının karar, kapsam, izlenebilirlik ve doğrulama değerini korumaktır.

## Teslim kabul kriterleri

- İş problemi, etkilenen paydaş ve beklenen değer açıkça tanımlanır.
- Kapsam, kapsam dışı alanlar, varsayım ve bağımlılıklar görünürdür.
- Gereksinimler benzersiz kimlikli, öncelikli ve test edilebilirdir.
- Süreç, veri, API ve ekran kararları aynı çözüm bağlamında tutarlıdır.
- Tasarlanan çıktı ile gerçekten çalıştırılmış kanıt birbirinden ayrılır.
- KPI için formül, baseline, veri kaynağı, sahip ve ölçüm zamanı tanımlanır.
- Test/UAT sonucu gereksinime bağlanır; açık risk ve karar sahibi belirtilir.

## Kanıt sınıflandırması

| Kanıt türü | Beklenen içerik | Sunum kuralı |
|---|---|---|
| Çalıştırılmış kanıt | Gerçek istek/yanıt, SQL sonucu veya çalışan arayüz davranışı | Tarih, veri koşulu, beklenen ve gerçekleşen sonuç belirtilir |
| Tasarım kanıtı | Gereksinim, süreç, veri/API sözleşmesi, wireframe veya test tasarımı | Hedef durum olduğu açıkça belirtilir; canlı sonuç gibi sunulmaz |
| Analiz kanıtı | İş sorusu, sorgu/model, bulgu yorumu ve önerilen aksiyon | Teknik çıktı iş kararına bağlanır |
| Yönetişim kanıtı | RACI, risk, karar, change impact, release ve UAT kapısı | Sahip, karar ölçütü ve izleme yöntemi bulunur |

## Yayın öncesi kontrol

- Gerçek şirket, müşteri ve kişisel veriler anonimleştirildi.
- Tüm bağlantılar ve görseller açılıyor.
- Dokümanlarda boş yer tutucu kalmadı.
- Her gereksinimin benzersiz kimliği var (`FR-001`, `NFR-001`).
- Her user story en az bir acceptance criterion ile eşleşiyor.
- SQL dosyaları açıklamalı ve çalıştırma sırası belirtilmiş.
- Demo varsa kurulum ve ekran görüntüsü mevcut.
- Yazım ve terminoloji tutarlı.

## Durum ve kanıt etiketleri

- `Tasarım`: Hedef çözüm tanımlandı; uygulama sonucu iddiası yoktur.
- `Çalıştırıldı`: İlgili teknik davranış kontrollü ortamda doğrulandı.
- `UAT için hazır`: Gereksinim, test verisi, kabul kriteri ve giriş koşulları tamamlandı.
- `Karar bekliyor`: Sahibi ve son tarihi belirtilmiş açık karar vardır.
