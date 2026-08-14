# BPMN/UML Süreç Spesifikasyonu

## TO-BE swimlane görünümü

```mermaid
flowchart LR
  subgraph Customer["Müşteri"]
    A["Sipariş detayını aç"] --> B["İptal talebini onayla"]
  end
  subgraph Web["Web / Mobile"]
    B --> C["İptal isteğini gönder"]
    N["Sonuç ve refund durumunu göster"]
  end
  subgraph Order["Order Service"]
    C --> D{"Sahiplik ve statü uygun mu?"}
    D -- Hayır --> E["İş kuralı hatası"]
    D -- Evet --> F["İptal kaydı ve idempotency kontrolü"]
    F --> G["Siparişi Cancelled yap"]
  end
  subgraph Inventory["Inventory"]
    G --> H["Kalemleri stoğa geri ekle"]
  end
  subgraph Payment["Payment"]
    H --> I{"Ödeme alınmış mı?"}
    I -- Evet --> J["Refund başlat"]
    I -- Hayır --> K["Refund gerekmez"]
  end
  subgraph Operations["Operasyon / Gözlemlenebilirlik"]
    J --> L{"Refund kabul edildi mi?"}
    L -- Hayır --> M["İstisna kuyruğu + alarm"]
    L -- Evet --> N
    K --> N
    E --> N
    M --> N
  end
```

## Sistem sequence diagramı

```mermaid
sequenceDiagram
  actor C as Customer
  participant UI as Web UI
  participant O as Order API
  participant DB as SQL Server
  participant I as Inventory
  participant P as Payment
  participant Q as Ops Queue
  C->>UI: Cancel order
  UI->>O: POST /orders/{id}/cancellations
  O->>DB: Verify owner/status/idempotency
  alt Eligible
    O->>DB: Cancel order + create audit (transaction)
    O->>I: Restore stock
    opt Paid order
      O->>P: Request refund
      alt Refund unavailable/rejected
        O->>Q: Create exception task
      end
    end
    O-->>UI: 202 cancellation/refund status
  else Not eligible or not owned
    O-->>UI: 404/409 standard error
  end
  UI-->>C: Clear outcome and next step
```

## BPMN olay ve gateway kataloğu

| Tür | Kimlik | Tanım |
|---|---|---|
| Start event | EVT-START-01 | Müşteri iptal aksiyonunu onaylar |
| Exclusive gateway | GW-ELIGIBILITY | Sahiplik, statü ve lojistik uygunluğu |
| Service task | TASK-CANCEL | Sipariş/audit transaction'ı |
| Service task | TASK-STOCK | Stok geri yükleme |
| Exclusive gateway | GW-PAID | Refund gereksinimi |
| Boundary/error | EVT-REFUND-ERROR | Payment timeout/rejection |
| End event | EVT-END-SUCCESS | İptal tamam, refund durumu görünür |
| End event | EVT-END-REJECTED | Kural nedeniyle veri değişmeden ret |

## Modelleme kuralları

- Gateway soruları tek ve ölçülebilir karar üretir.
- Sistem ve insan sorumlulukları lane'lerle ayrılır.
- Refund hatası sipariş iptal sonucunu belirsiz bırakmaz; operasyonel duruma yönlenir.
- Her bitiş olayı kullanıcı mesajı, audit sonucu ve ölçüm olayıyla eşleşir.
