# API Sözleşmesi — Sipariş İptali

Bu sözleşme analiz seviyesinde hedef davranışı tanımlar; mevcut ErenShop API'sinde uygulanmış endpoint iddiası değildir.

## İstek

`POST /api/orders/{orderId}/cancellations`

Headers: `Authorization`, `Idempotency-Key`, `X-Correlation-ID`

```json
{
  "reasonCode": "CHANGED_MIND",
  "reasonText": "Opsiyonel açıklama"
}
```

## Başarılı yanıt — 202 Accepted

```json
{
  "cancellationId": "cxl_12345",
  "orderId": 8451,
  "orderStatus": "Cancelled",
  "refundStatus": "Pending",
  "message": "İptal talebiniz alındı. Ödeme iadesi ayrıca takip edilecektir.",
  "correlationId": "7c8b..."
}
```

## Hata sözleşmesi

| HTTP | Kod | Senaryo | İstemci davranışı |
|---:|---|---|---|
| 400 | VALIDATION_ERROR | Neden metni veya istek biçimi geçersiz | Alan bazlı hata göster |
| 401 | UNAUTHENTICATED | Oturum yok/geçersiz | Giriş akışına yönlendir |
| 404 | ORDER_NOT_FOUND | Sipariş yok veya kullanıcıya ait değil | Bilgi sızdırmayan ortak mesaj |
| 409 | ORDER_NOT_CANCELLABLE | Güncel statü iptale uygun değil | Güncel durumu ve desteği göster |
| 409 | DUPLICATE_REQUEST | Aynı idempotency key farklı içerikle kullanıldı | İşlemi tekrarlama |
| 422 | BUSINESS_RULE_VIOLATION | İş kuralı karşılanmadı | Kural mesajını göster |
| 503 | DEPENDENCY_UNAVAILABLE | Kritik bağımlılık erişilemiyor | Güvenli tekrar/operasyon mesajı |

Standart hata gövdesi `code`, `message`, `correlationId` ve opsiyonel `fieldErrors` içerir. Teknik stack trace istemciye dönmez.

## Davranış kuralları

- Aynı `Idempotency-Key` ve aynı içerik tekrarlandığında ilk işlemin sonucu dönmelidir.
- Sipariş statüsü işlem anında yeniden okunmalı; yalnızca ekran verisine güvenilmemelidir.
- Sipariş iptali ve stok iadesi atomik olmalıdır.
- Refund asenkron olabilir; sipariş iptali ile refund durumu ayrı izlenmelidir.
- Her girişim eski/yeni durum, aktör, zaman ve correlation ID ile loglanmalıdır.
