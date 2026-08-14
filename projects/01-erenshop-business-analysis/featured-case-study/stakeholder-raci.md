# Paydaş Analizi ve RACI

## Paydaş haritası

| Paydaş | İhtiyaç / beklenti | Etki | İlgi | Katılım yaklaşımı |
|---|---|---|---|---|
| Product Owner | İş değeri, kapsam ve öncelik | Yüksek | Yüksek | Haftalık karar ve kapsam oturumu |
| Müşteri / son kullanıcı | Hızlı ve anlaşılır iptal | Orta | Yüksek | Kullanılabilirlik testi ve UAT |
| Sipariş operasyonu | İstisna ve lojistik kontrolü | Yüksek | Yüksek | Süreç atölyesi, kural onayı |
| Finans / ödeme | Refund doğruluğu ve mutabakat | Yüksek | Yüksek | Entegrasyon ve hata akışı onayı |
| Müşteri hizmetleri | Ticket azalması, doğru bilgilendirme | Orta | Yüksek | AS-IS doğrulama, eğitim ve geri bildirim |
| Engineering | Uygulanabilir, test edilebilir kapsam | Yüksek | Orta | Refinement ve çözüm tasarımı |
| QA | Kabul kriteri ve test edilebilirlik | Orta | Yüksek | Three Amigos, test gözden geçirme |
| Güvenlik / uyum | Yetki, log ve veri koruma | Yüksek | Orta | Tasarım kontrolü ve release gate |

## RACI

R: Responsible, A: Accountable, C: Consulted, I: Informed.

| Çıktı / karar | BA | PO | Operasyon | Finans | Engineering | QA | Güvenlik |
|---|---|---|---|---|---|---|---|
| Problem, kapsam ve KPI | R | A | C | C | C | I | I |
| İş kuralları | R | A | C | C | C | C | I |
| Gereksinim ve acceptance criteria | R | A | C | C | C | C | I |
| Teknik çözüm ve API sözleşmesi | C | I | I | C | A/R | C | C |
| Test stratejisi | C | I | C | C | C | A/R | I |
| UAT onayı | R | A | R | R | I | C | I |
| Güvenlik ve yetki kontrolü | C | I | I | I | R | C | A |
| Go-live / no-go kararı | C | A | C | C | R | C | C |

## İletişim planı

| Toplantı / çıktı | Sıklık | Katılımcı | Amaç |
|---|---|---|---|
| Keşif atölyesi | Başlangıç + gerektiğinde | BA, PO, operasyon, finans | AS-IS, problem ve kurallar |
| Backlog refinement | Haftalık | BA, PO, engineering, QA | Kapsam ve kabul kriterleri |
| Risk/karar gözden geçirme | Haftalık | Karar sahipleri | Açık kararları ve riskleri kapatmak |
| UAT durum toplantısı | UAT boyunca günlük | BA, QA, iş birimleri | Hata, retest ve çıkış kriteri |
| KPI değerlendirmesi | 30/60/90. gün | PO, BA, operasyon, finans | Fayda gerçekleşmesini ölçmek |
