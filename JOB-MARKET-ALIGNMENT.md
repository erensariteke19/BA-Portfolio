# Business Analyst İş İlanı Yetkinlik Eşleştirmesi

**Değerlendirme tarihi:** 14 Ağustos 2026  
**Hedef roller:** Junior Business Analyst, IT Business Analyst, Technical Business Analyst

Bu matris, güncel Türkiye ilanlarında tekrar eden beklentileri portföydeki somut kanıtlarla eşleştirir. Amaç anahtar kelime eklemek değil; her yetkinliği incelenebilir bir çıktı üzerinden göstermektir.

## Piyasa sinyalleri

| İlan örneği | Tekrar eden beklentiler |
|---|---|
| [Technology Business Analyst](https://tr.linkedin.com/jobs/view/business-analyst-at-gizli-%C5%9Firket-4433317275) | Scope/prioritization, Jira/Confluence, Agile ceremonies, API/integration/data flow, SQL, testing, stakeholder communication |
| [Coca-Cola İçecek Business Analyst](https://tr.linkedin.com/jobs/view/business-analyst-at-coca-cola-cci-4348360876) | BPMN, UAT planning/execution, training, change impact, KPI, business–technical communication |
| [Ziraat Teknoloji Business Analyst](https://www.linkedin.com/jobs/view/3265279928) | SQL, Jira/Confluence, Agile, functional design, SDLC documentation |
| [Junior Business Analyst](https://tr.linkedin.com/jobs/view/junior-business-analyst-at-waternet-su-hizmetleri-4141471071) | SQL sorgulama ve sonuç yorumlama, PMO/BT çalışma disiplini |
| [Process & Project Management BA](https://tr.linkedin.com/jobs/view/business-analyst-process-project-management-at-autorola-group-%E2%80%A2-t%C3%BCrkiye-4363169079) | SQL veri tutarlılığı, BPMN/UML ve süreç analizi |

## Yetkinlik–kanıt matrisi

| İlan yetkinliği | Portföy kanıtı | Kanıt seviyesi |
|---|---|---|
| Requirement elicitation ve scope | [Business case](projects/01-erenshop-business-analysis/featured-case-study/business-case.md), [requirements](projects/01-erenshop-business-analysis/featured-case-study/requirements.md) | Hazırlanmış çıktı |
| Jira/Confluence, backlog ve Agile | [Agile delivery pack](projects/01-erenshop-business-analysis/featured-case-study/agile-delivery-pack.md) | Araç bağımsız Jira/Confluence örneği |
| BPMN/UML süreç modelleme | [BPMN/UML süreç spesifikasyonu](projects/01-erenshop-business-analysis/featured-case-study/bpmn-uml-specification.md) | Render edilebilir diyagram + kurallar |
| API ve sistem entegrasyonu | [System integration analysis](projects/01-erenshop-business-analysis/featured-case-study/system-integration-analysis.md), [API contract](projects/01-erenshop-business-analysis/featured-case-study/api-contract.md) | Hedef çözüm tasarımı |
| SQL ve veri kalite kontrolü | [20 ileri SQL analizi](projects/02-sql-data-analysis/advanced-business-analysis.sql), [SQL matrisi](projects/02-sql-data-analysis/SQL-CAPABILITY-MATRIX.md) | Kod + çalıştırılmış CRUD kanıtı |
| UAT ve QA desteği | [UAT/test cases](projects/01-erenshop-business-analysis/featured-case-study/test-cases-uat.md), [release plan](projects/01-erenshop-business-analysis/featured-case-study/release-uat-plan.md) | Tasarlanmış UAT + çalıştırılmış API testleri |
| Change impact ve SDLC | [Change impact](projects/01-erenshop-business-analysis/featured-case-study/change-impact-analysis.md), [change request](projects/01-erenshop-business-analysis/featured-case-study/change-request.md) | Hazırlanmış yönetişim çıktısı |
| KPI ve raporlama | [KPI/dashboard specification](projects/01-erenshop-business-analysis/featured-case-study/kpi-dashboard-specification.md) | Veri ve dashboard gereksinimi |
| Stakeholder management | [Stakeholder/RACI](projects/01-erenshop-business-analysis/featured-case-study/stakeholder-raci.md) | Paydaş ve iletişim planı |
| UI/functional design | [UI functional specification](projects/03-react-ui-prototype/UI-SPECIFICATION.md) | Wireframe + durum/erişilebilirlik kuralları |

## Dürüst kanıt sınırı

- ErenShop ürün API'sinde CRUD ve soft-delete akışı Postman/SQL ile çalıştırılmıştır.
- İleri SQL paketi mevcut şemaya uygun portföy sorgularıdır; üretim veri sonucu iddiası taşımaz.
- Sipariş iptali entegrasyon, BPMN, Jira ve dashboard çıktıları hedef çözüm tasarımıdır; gerçek şirkette canlıya alınmış gibi sunulmaz.
- Jira/Confluence bilgisi, araç alanlarına uygun hazırlanmış artifact yapısıyla gösterilir; kurumsal Jira kullanım deneyimi iddia edilmez.

## Sonraki gelişim hedefleri

1. Bir Jira sandbox üzerinde epic/story/bug akışını ekran kanıtıyla uygulamak.
2. Power BI veya Excel'de SQL KPI'larını gerçek dashboard dosyasına dönüştürmek.
3. Postman testlerini Newman ile otomatik çalıştırıp HTML/JUnit raporu üretmek.
4. İngilizce requirement ve stakeholder sunumu hazırlamak.
