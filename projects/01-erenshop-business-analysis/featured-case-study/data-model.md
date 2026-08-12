# Mantıksal Veri Modeli

```mermaid
erDiagram
    CUSTOMERS ||--o{ ORDERS : places
    ORDERS ||--|{ ORDER_ITEMS : contains
    PRODUCTS ||--o{ ORDER_ITEMS : referenced_by
    ORDERS ||--o| PAYMENTS : paid_by
    ORDERS ||--o| ORDER_CANCELLATIONS : cancelled_with
    ORDERS ||--o{ ORDER_STATUS_HISTORY : tracked_in

    ORDER_CANCELLATIONS {
      int Id PK
      int OrderId FK
      int CancelledByUserId FK
      string ReasonCode
      string ReasonText
      datetime CancelledAt
      string RefundStatus
      string RefundReference
    }

    ORDER_STATUS_HISTORY {
      int Id PK
      int OrderId FK
      string FromStatus
      string ToStatus
      int ChangedByUserId FK
      datetime ChangedAt
      string CorrelationId
    }
```

## Tasarım kararları

- İptal bilgisi ayrı `OrderCancellations` tablosunda tutularak sipariş tablosunun sade kalması ve iptal sürecinin genişletilebilir olması önerilir.
- `OrderStatusHistory`, yalnızca son durumu değil değişiklik geçmişini de saklar.
- `OrderId` üzerinde unique kısıt, aynı sipariş için ikinci iptal kaydını engeller.
- Stok iadesi ve sipariş statüsü aynı transaction kapsamında işlenmelidir.
- Refund durumu sipariş durumundan ayrı izlenmelidir; sipariş iptal edilmişken iade operasyonu devam ediyor olabilir.
