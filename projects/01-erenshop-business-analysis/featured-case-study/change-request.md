# Change Request — CR-001

| Alan | Değer |
|---|---|
| Başlık | Processing sipariş iptal uygunluğunun lojistik handover ile belirlenmesi |
| Talep sahibi | Sipariş Operasyonu |
| Tarih | Portföy senaryosu |
| Öncelik | High |
| Durum | Impact Assessed — Approval Pending |

## Talep

Başlangıç kuralında tüm `Processing` siparişler iptal edilebilir kabul edilmiştir. Operasyon geri bildirimiyle, kargoya fiziksel teslim (`handoverAt`) gerçekleşmiş Processing siparişlerin müşteri tarafından iptal edilmemesi istenmektedir.

## Gerekçe ve fayda

Paketin kargo ağına girdikten sonra iptal edilmesi stok, kargo maliyeti ve müşteri iletişiminde tutarsızlık oluşturabilir. Güncel lojistik doğrulaması bu operasyonel riski azaltır.

## Etki analizi

| Alan | Değişiklik |
|---|---|
| Requirement | FR-002 koşullu hale gelir; FR-003 kapsamı genişler |
| Business rule | BRULE-001/002 `handoverAt` kontrolü içerir |
| UI | Processing siparişte iptal aksiyonu lojistik sonucuna göre gösterilir |
| API | Order API güncel fulfillment durumunu okur |
| Integration | Fulfillment/Shipment servisi yeni bağımlılık olur |
| Test | TC-002 ve TC-010 güncellenir; handover pozitif/negatif senaryoları eklenir |
| NFR | Ek çağrının P95 süre ve hata davranışı tanımlanır |
| Operasyon | Shipment gecikmesi/senkronizasyon hatası için runbook gerekir |

## Seçenekler

1. `Processing` tamamen engelle — düşük teknik risk, yüksek müşteri kaybı.
2. `handoverAt` ile gerçek zamanlı kontrol — önerilen, ek entegrasyon maliyeti.
3. Zaman penceresi kullan — kolay fakat operasyon gerçeğini tam yansıtmaz.

## Öneri ve kabul koşulu

Seçenek 2 önerilir. Product Owner, Operasyon ve Engineering; veri kaynağı güvenilirliği, timeout davranışı ve teslim tarihini onaylamadan değişiklik sprint kapsamına alınmaz. Onay sonrası RTM, backlog, API sözleşmesi ve regresyon seti birlikte güncellenir.
