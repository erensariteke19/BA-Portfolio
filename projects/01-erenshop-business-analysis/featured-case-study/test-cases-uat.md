# Test Cases ve UAT

| ID | Tür | Gereksinim | Senaryo | Beklenen sonuç |
|---|---|---|---|---|
| TC-001 | Pozitif | FR-001, FR-004, FR-005 | Pending sipariş iptali | Cancelled, stok geri, log mevcut |
| TC-002 | Pozitif | FR-002, FR-004, FR-005 | Processing sipariş iptali | Cancelled, stok geri, log mevcut |
| TC-003 | Negatif | FR-003 | Shipped siparişi iptal denemesi | İşlem engellenir; veri değişmez |
| TC-004 | Güvenlik | NFR-002 | Başka müşterinin siparişini iptal | Yetkisiz istek reddedilir |
| TC-005 | Entegrasyon | FR-006 | Paid sipariş iptali | Refund başlatılır ve referans kaydedilir |
| TC-006 | Hata | FR-010 | Refund servisi erişilemiyor | Operasyon görevi ve hata kaydı oluşur |
| TC-007 | Veri | NFR-005 | İptal isteği iki kez gönderilir | Stok yalnızca bir kez artırılır |
| TC-008 | Kullanılabilirlik | FR-007 | Neden girmeden iptal | İşlem başarıyla tamamlanır |
| TC-009 | Validasyon | BRULE-006 | 501 karakter iptal nedeni | Açıklayıcı doğrulama mesajı gösterilir |
| TC-010 | Eşzamanlılık | NFR-004 | İptal sırasında statü Shipped olur | Güncel kontrol sonucu iptal durdurulur |

## UAT senaryoları

### UAT-001 — Self-servis iptal

Bir müşteri Pending siparişini destek ekibine ulaşmadan iptal eder. Sipariş Cancelled görünür, stok geri yüklenir ve kullanıcı anlaşılır sonuç mesajı alır.

### UAT-002 — Lojistik koruması

Müşteri Shipped siparişi görüntüler. İptal aksiyonu kullanılamaz ve sonraki seçenekler hakkında bilgi verilir.

### UAT-003 — Ödeme iadesi takibi

Müşteri Paid siparişi iptal eder. Sistem siparişi iptal eder ve iade durumunu ayrı biçimde “İade başlatıldı” olarak gösterir.

## Çıkış kriteri

- Tüm Must gereksinimleri test edilmiş olmalı.
- Kritik/yüksek hata açık olmamalı.
- Sipariş, stok ve audit kayıtları tutarlı olmalı.
- Refund hata senaryosu operasyon ekibi tarafından kabul edilmiş olmalı.
