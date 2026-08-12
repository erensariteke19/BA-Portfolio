# Riskler, Varsayımlar ve Açık Kararlar

## Riskler

| ID | Risk | Olasılık | Etki | Azaltma yaklaşımı |
|---|---|---|---|---|
| R-001 | Refund servisi geçici olarak erişilemez | Orta | Yüksek | Retry yerine izlenebilir operasyon görevi, alarm ve correlation ID |
| R-002 | Eşzamanlı istek stok miktarını iki kez artırır | Düşük | Yüksek | Transaction, unique iptal kaydı ve idempotency kontrolü |
| R-003 | Sipariş ve kargo statüsü senkron değildir | Orta | Yüksek | İptal anında güncel lojistik/statü doğrulaması |
| R-004 | Müşteri iade ile iptali aynı durum sanır | Orta | Orta | Sipariş ve refund durumlarını ayrı, açık biçimde gösterme |

## Varsayımlar

- Sipariş statüleri düzenli ve güvenilir biçimde güncellenmektedir.
- Ödeme sağlayıcısı refund API veya operasyonel iade mekanizması sunmaktadır.
- Stok servisi transaction veya güvenilir geri alma mekanizmasını desteklemektedir.
- Kullanıcının sipariş sahipliği doğrulanabilir durumdadır.

## Açık kararlar

| ID | Soru | Önerilen başlangıç kararı | Karar sahibi |
|---|---|---|---|
| DEC-001 | Paketleme başlamış Processing sipariş iptal edilebilir mi? | Kargo “handover” oluşmadıysa evet | Product Owner + Operasyon |
| DEC-002 | Refund otomatik mi, onaylı mı? | Düşük riskli işlemlerde otomatik; başarısızlıkta manuel kuyruk | Finans |
| DEC-003 | Neden listesi olacak mı? | Opsiyonel standart seçenek + “Diğer” metni | Product Owner |
| DEC-004 | İptal bildirimi gönderilecek mi? | E-posta; SMS/push kapsam dışı | Product Owner |
| DEC-005 | Admin Shipped iptal edebilir mi? | Ayrı yetkili operasyon akışı olarak sonraki kapsam | Operasyon |
