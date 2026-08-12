# SQL Analiz ve Doğrulama Planı

Bu dosya hazır platform SQL'leri ile Eren'in kişisel sorgularını ayırmak için kullanılacaktır.

## İş soruları

1. Aylara göre sipariş iptal oranı nedir?
2. En sık seçilen iptal nedenleri hangileridir?
3. Pending ve Processing durumlarında iptal oranı nasıl farklılaşıyor?
4. Refund süresi ortalaması ve geciken iadeler nelerdir?
5. İptal sonrası stok iadesiyle uyuşmayan kayıt var mı?

## Örnek doğrulama sorgusu

```sql
-- İş sorusu: Duruma göre iptal oranı nedir?
SELECT
    Status,
    COUNT(*) AS OrderCount,
    SUM(CASE WHEN Status = 'Cancelled' THEN 1 ELSE 0 END) AS CancelledCount
FROM Orders
GROUP BY Status;
```

> Bu yalnızca çalışma planıdır. Gerçek sorgu sonuçları üretilmeden portföyde “bulgu” veya “sonuç” iddiası kullanılmamalıdır.
