# Süreç Akışları

## AS-IS — Mevcut süreç

```mermaid
flowchart LR
    C[Müşteri] --> S[Destek ekibine ulaşır]
    S --> O[Sipariş durumunu kontrol eder]
    O --> D{İptal uygun mu?}
    D -- Hayır --> R[Müşteriye bilgi verilir]
    D -- Evet --> U[Sipariş manuel iptal edilir]
    U --> I[Stok manuel güncellenir]
    I --> P[Finans/refund takibi başlatılır]
    P --> N[Müşteriye dönüş yapılır]
```

**Darboğazlar:** Destek bağımlılığı, uzun bekleme, manuel stok/refund adımları ve sınırlı izlenebilirlik.

## TO-BE — Önerilen süreç

```mermaid
flowchart LR
    C[Müşteri sipariş detayını açar] --> V{Statü Pending veya Processing mi?}
    V -- Hayır --> X[İptal aksiyonu engellenir]
    V -- Evet --> M[İptal modalı açılır]
    M --> K[Müşteri onay verir]
    K --> A[Yetki ve güncel statü tekrar doğrulanır]
    A --> T[Transaction başlatılır]
    T --> O[Sipariş Cancelled yapılır]
    O --> I[Stok geri yüklenir]
    I --> L[Audit log yazılır]
    L --> Q{Ödeme tamamlanmış mı?}
    Q -- Hayır --> S[Başarı mesajı]
    Q -- Evet --> P[Refund isteği başlatılır]
    P --> S
```

## Refund hata akışı

```mermaid
flowchart TD
    A[İptal ve stok güncellemesi başarılı] --> B[Refund servisine istek]
    B --> C{Refund kabul edildi mi?}
    C -- Evet --> D[RefundPending kaydı ve referans numarası]
    C -- Hayır --> E[RefundActionRequired kaydı]
    E --> F[Operasyon/finans kuyruğuna görev]
    F --> G[Müşteriye iade sürecinin takip edildiği bilgisi]
```

## Durum geçişleri

```mermaid
stateDiagram-v2
    [*] --> Pending
    Pending --> Processing
    Pending --> Cancelled: müşteri iptali
    Processing --> Cancelled: müşteri iptali
    Processing --> Shipped
    Shipped --> Delivered
    Delivered --> Completed
```
