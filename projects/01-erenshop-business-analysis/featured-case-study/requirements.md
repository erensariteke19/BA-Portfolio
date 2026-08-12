# Gereksinim Kataloğu

## Functional requirements

| ID | Gereksinim | Kaynak | Öncelik |
|---|---|---|---|
| FR-001 | Sistem, müşterinin kendi Pending siparişini iptal etmesine izin vermelidir. | BR-001 | Must |
| FR-002 | Sistem, müşterinin kendi Processing siparişini iptal etmesine izin vermelidir. | BR-001 | Must |
| FR-003 | Sistem, Shipped, Delivered ve Completed siparişlerin müşteri tarafından iptalini engellemelidir. | BR-002 | Must |
| FR-004 | Başarılı iptal sonrası sipariş durumu Cancelled olarak güncellenmelidir. | BR-003 | Must |
| FR-005 | Başarılı iptal sonrası tüm sipariş kalemleri kullanılabilir stoğa geri eklenmelidir. | BR-003 | Must |
| FR-006 | Ödemesi tamamlanmış siparişlerde refund süreci başlatılmalıdır. | BR-004 | Must |
| FR-007 | Müşteri opsiyonel bir iptal nedeni girebilmelidir. | BR-005 | Could |
| FR-008 | Sistem iptal işlemini kullanıcı, sipariş, zaman, eski/yeni statü ve nedenle loglamalıdır. | BR-006 | Must |
| FR-009 | Sistem, iptal sonucunu müşteriye anlaşılır bir mesajla bildirmelidir. | BR-001 | Should |
| FR-010 | Refund başlatılamazsa sipariş iptali kaybolmamalı; hata izlenebilir operasyonal duruma alınmalıdır. | BR-004 | Must |

## Non-functional requirements

| ID | Kategori | Ölçülebilir gereksinim |
|---|---|---|
| NFR-001 | Performans | İptal isteğinin %95'i 3 saniye içinde sonuçlanmalıdır. |
| NFR-002 | Güvenlik | Kullanıcı yalnızca kendisine ait siparişler üzerinde iptal başlatabilmelidir. |
| NFR-003 | Yetkilendirme | Yetkisiz istekler 403; bulunamayan veya kullanıcıya ait olmayan kayıtlar bilgi sızıntısını önleyecek tutarlı cevapla dönmelidir. |
| NFR-004 | Veri bütünlüğü | Sipariş durumu ve stok güncellemesi transaction içinde atomik yürütülmelidir. |
| NFR-005 | Eşzamanlılık | Aynı sipariş için yinelenen iptal istekleri stok miktarını birden fazla kez artırmamalıdır. |
| NFR-006 | Kullanılabilirlik | İptal aksiyonu yalnızca iptal edilebilir durumlarda görünür/aktif olmalıdır. |
| NFR-007 | İzlenebilirlik | Her iptal girişimi correlation ID ile loglanmalıdır. |
| NFR-008 | Erişilebilirlik | Modal klavye ile kullanılabilmeli; alanlar ve hata mesajları açıklayıcı etiketlere sahip olmalıdır. |

## Business requirements

| ID | İş ihtiyacı |
|---|---|
| BR-001 | Müşteri uygun siparişini destek ekibine ihtiyaç duymadan iptal edebilmelidir. |
| BR-002 | Lojistik süreci ilerlemiş siparişlerin yanlışlıkla iptali engellenmelidir. |
| BR-003 | İptal işlemi sipariş ve stok verisini tutarlı güncellemelidir. |
| BR-004 | Tahsil edilmiş ödeme için iade süreci güvenilir biçimde başlatılmalıdır. |
| BR-005 | İptal nedenleri müşteri içgörüsü amacıyla toplanabilmelidir. |
| BR-006 | Tüm iptal işlemleri denetlenebilir olmalıdır. |
