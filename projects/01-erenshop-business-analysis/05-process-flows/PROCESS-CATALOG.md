# Süreç Kataloğu

| Süreç | Ana akış | Alternatif/hata akışları |
|---|---|---|
| Abonelik oluşturma | Ürün seçimi → periyot → ödeme → abonelik → bildirim | Ödeme başarısızlığı, retry hakkının bitmesi, stok yokluğu |
| Sipariş iptali | Sipariş detayı → statü kontrolü → iptal → stok iadesi → refund | Sevk edilmiş sipariş, yetkisiz kullanıcı, refund hatası |
| Sipariş notu | Sipariş → not girişi → doğrulama → kayıt | Karakter limiti, boş/geçersiz içerik, yetki hatası |
| Ürün görseli | Dosya seçimi → doğrulama → resize → kayıt → kapak seçimi | Limit aşımı, format/boyut hatası, işleme hatası |

Bu metinsel süreçler sonraki iterasyonda BPMN veya flowchart görsellerine dönüştürülecektir.
