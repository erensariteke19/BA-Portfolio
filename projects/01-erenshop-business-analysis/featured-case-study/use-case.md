# Use Case ve İş Kuralları

## UC-001 — Siparişi iptal et

| Alan | Açıklama |
|---|---|
| Birincil aktör | Müşteri |
| İkincil aktörler | Sipariş, stok, ödeme ve audit servisleri |
| Tetikleyici | Müşterinin “Siparişi İptal Et” aksiyonunu seçmesi |
| Ön koşullar | Kullanıcı giriş yapmış; sipariş kullanıcıya ait; statü Pending veya Processing |
| Başarılı son koşul | Sipariş Cancelled; stok güncel; log yazılmış; gerekiyorsa refund başlatılmış |
| Minimum garanti | Başarısız işlemde veri kısmi güncellenmez; hata izlenebilir biçimde kaydedilir |

### Ana akış

1. Müşteri sipariş detayını açar.
2. Sistem sahiplik ve statü kontrolü yapar.
3. Müşteri iptal aksiyonunu seçer ve onaylar.
4. Sistem güncel statüyü tekrar doğrular.
5. Sistem siparişi Cancelled yapar ve stoğu geri yükler.
6. Sistem audit log yazar.
7. Ödeme alınmışsa refund sürecini başlatır.
8. Sistem sonucu müşteriye bildirir.

### Alternatif akışlar

- **A1 — İptal edilemez statü:** Aksiyon engellenir; veri değişmez.
- **A2 — Başkasına ait sipariş:** İstek reddedilir; sipariş bilgisi açığa çıkarılmaz.
- **A3 — Eşzamanlı statü değişimi:** Güncel statü tekrar kontrol edilir; iptal güvenli şekilde durdurulur.
- **A4 — Refund servisi hatası:** İptal kaybolmaz; finans/operasyon takibi için görev oluşturulur.

## İş kuralları

| ID | Kural |
|---|---|
| BRULE-001 | Yalnızca Pending ve Processing siparişler müşteri tarafından iptal edilebilir. |
| BRULE-002 | Shipped, Delivered ve Completed siparişler standart müşteri akışından iptal edilemez. |
| BRULE-003 | İptal edilen siparişin durumu Cancelled olmalıdır. |
| BRULE-004 | Her sipariş kalemi yalnızca bir kez stoğa geri eklenmelidir. |
| BRULE-005 | Paid siparişlerde refund süreci başlatılmalıdır. |
| BRULE-006 | İptal nedeni opsiyoneldir ve en fazla 500 karakterdir. |
| BRULE-007 | İptal işlemi sipariş sahibine ve yetkili admin rollerine açıktır. |
