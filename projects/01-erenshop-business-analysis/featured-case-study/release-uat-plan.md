# Release, UAT ve Operasyonel Kabul Planı

## UAT hazırlık kriterleri

- Kapsam ve acceptance criteria Product Owner tarafından onaylandı.
- Test ortamı; sipariş durumları, ödeme ve stok senaryoları için veri içeriyor.
- Kritik bağımlılıkların test endpoint/mocks'ları hazır.
- Test kullanıcıları ve rol/yetki matrisi tanımlı.
- Bilinen hata listesi, kanıt şablonu ve retest yöntemi paylaşıldı.

## Çıkış kriterleri

| Kapı | Kabul koşulu | Kanıt sahibi |
|---|---|---|
| İşlevsel kapsam | Tüm Must acceptance criteria Passed | QA + BA |
| Regresyon | Sipariş, ödeme ve stok kritik regresyonu Passed | QA |
| Güvenlik | Sahiplik/yetki negatif testleri Passed | Security + QA |
| Veri | Sipariş-stok-refund mutabakatı tutarlı | Engineering + Finans |
| Hata | Açık Critical/High hata yok | PO |
| İş kabulü | UAT-001/002/003 iş birimi onaylı | Operasyon + Finans |
| Operasyon | Alarm, dashboard, runbook ve kuyruk sahibi hazır | Operations |

## Yayın stratejisi

1. Feature flag kapalı şekilde üretime dağıtım.
2. İç kullanıcılar ve sınırlı müşteri grubu ile canary açılış.
3. Teknik başarı, refund istisnası ve destek temasının izlenmesi.
4. Eşikler sağlanırsa kademeli trafik artırımı.
5. Kritik veri bütünlüğü veya güvenlik sorunu oluşursa flag kapatılır; gerekirse uygulama sürümü geri alınır.

## Go / no-go kontrolü

Product Owner `Accountable`; Engineering, QA, Operasyon, Finans ve Güvenlik görüş bildirir. Açık riskler; sahibi, etkisi, geçici kontrolü ve kabul eden kişiyle release kaydında tutulur.

## Yayın sonrası doğrulama

- İlk 2 saat: hata oranı, P95 süre, stok mutabakatı ve refund kuyruğu.
- İlk 24 saat: başarısız/tekrarlı işlemler ve destek bildirimleri.
- 7 gün: KPI ön sinyalleri, kök neden gerektiren olaylar ve backlog aksiyonları.
- 30/60/90 gün: business case fayda gerçekleşmesi.
