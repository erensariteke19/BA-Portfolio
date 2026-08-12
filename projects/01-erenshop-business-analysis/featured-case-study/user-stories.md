# User Stories ve Acceptance Criteria

## US-001 — Pending siparişi iptal etme

**Bir müşteri olarak**, henüz işleme alınmamış siparişimi hesabımdan iptal etmek istiyorum; **böylece** destek ekibine başvurmadan işlemi tamamlayabilirim.

```gherkin
Scenario: Pending siparişin başarıyla iptal edilmesi
  Given müşteri sisteme giriş yapmıştır
  And sipariş müşteriye aittir
  And sipariş durumu "Pending" durumundadır
  When müşteri iptali onaylar
  Then sipariş durumu "Cancelled" olmalıdır
  And sipariş kalemlerinin stoğu geri yüklenmelidir
  And iptal işlemi audit log'a yazılmalıdır
```

## US-002 — Processing siparişi iptal etme

**Bir müşteri olarak**, henüz sevk edilmemiş Processing siparişimi iptal etmek istiyorum; **böylece** istemediğim ürün sevk edilmeden süreci durdurabilirim.

```gherkin
Scenario: Processing siparişin başarıyla iptal edilmesi
  Given sipariş müşteriye aittir
  And sipariş durumu "Processing" durumundadır
  When müşteri iptali onaylar
  Then sipariş "Cancelled" durumuna geçmelidir
  And stok geri yüklenmelidir
```

## US-003 — Sevk edilmiş siparişi koruma

**Bir operasyon sorumlusu olarak**, sevk edilmiş siparişlerin müşteri tarafından iptal edilmesini engellemek istiyorum; **böylece** sipariş ve lojistik verileri tutarlı kalır.

```gherkin
Scenario: Shipped siparişin iptal edilememesi
  Given sipariş durumu "Shipped" durumundadır
  When müşteri sipariş detayını görüntüler
  Then "Siparişi İptal Et" aksiyonu aktif olmamalıdır
  And kullanıcıya siparişin artık iptal edilemeyeceği açıklanmalıdır
```

## US-004 — Ödemeli siparişte refund

**Bir müşteri olarak**, ödemesini yaptığım siparişi iptal ettiğimde iade sürecinin başlatılmasını istiyorum; **böylece** ücretimi geri alabilirim.

```gherkin
Scenario: Ödemesi tamamlanmış siparişin iptali
  Given sipariş iptal edilebilir durumdadır
  And ödeme durumu "Paid" durumundadır
  When sipariş başarıyla iptal edilir
  Then refund isteği ödeme servisine gönderilmelidir
  And refund referansı kayıt altına alınmalıdır
```

## US-005 — İptal nedeni paylaşma

**Bir müşteri olarak**, istersem iptal nedenimi paylaşmak istiyorum; **böylece** deneyimimin geliştirilmesine katkıda bulunabilirim.

```gherkin
Scenario: Neden girmeden iptal
  Given sipariş iptal edilebilir durumdadır
  When müşteri iptal nedeni girmeden işlemi onaylar
  Then iptal işlemi başarıyla tamamlanmalıdır
```

## US-006 — Yinelenen isteği güvenli işleme

**Bir sistem sahibi olarak**, aynı iptal isteğinin tekrar gönderilmesinin çift stok iadesine yol açmamasını istiyorum; **böylece** veri bütünlüğü korunur.

```gherkin
Scenario: Aynı sipariş için yinelenen iptal isteği
  Given sipariş daha önce "Cancelled" yapılmıştır
  When aynı iptal isteği yeniden gönderilir
  Then sistem ikinci kez stok artırmamalıdır
  And mevcut iptal sonucu güvenli ve tutarlı biçimde dönmelidir
```
