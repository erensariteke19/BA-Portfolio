# API Test Planı

Bu plan, mevcut ErenShop Postman koleksiyonunun üzerinde Eren'e ait test kanıtlarının ayrı üretilmesi için hazırlanmıştır.

## Önerilen endpoint

`POST /api/orders/{orderId}/cancel`

Örnek istek:

```json
{
  "reasonCode": "CHANGED_MIND",
  "reasonText": "Ürüne artık ihtiyacım yok."
}
```

## Kontrol seti

| Test | İstek/ön koşul | Beklenen HTTP sonucu |
|---|---|---|
| Başarılı Pending iptali | Sahibi, Pending | 200 |
| Başarılı Processing iptali | Sahibi, Processing | 200 |
| Shipped iptal denemesi | Sahibi, Shipped | 409 |
| Başkasının siparişi | Farklı kullanıcı | 403 veya güvenli 404 |
| Bulunmayan sipariş | Geçersiz ID | 404 |
| Uzun neden | 501 karakter | 422 |
| Yinelenen iptal | Zaten Cancelled | İdempotent 200 veya tutarlı 409 |

## Kanıt standardı

Her çalıştırmada istek, response body, HTTP status, süre ve test assertion sonucu ekran görüntüsü veya Postman run çıktısıyla saklanmalıdır. Henüz çalıştırılmamış testler “Passed” olarak işaretlenmemelidir.
