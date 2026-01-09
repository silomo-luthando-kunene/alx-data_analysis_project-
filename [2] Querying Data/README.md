# Maji Ndogo Part 2: SQL-Driven Analysis & Operational Strategy

## 🎯 Project Scope
In this phase, the analysis transitioned into the **Maji Ndogo Relational Database**. The objective was to handle a large-scale dataset (60,000+ records) to audit data integrity, identify specific infrastructure failures, and generate a data-backed deployment plan for engineering teams.

## 🛠️ Technical Stack
* **Language:** SQL (MySQL)
* **Concepts:** CTEs, Window Functions, Data Auditing, Relational Mapping, CASE logic.

## ⚙️ Technical Implementation
I utilized advanced SQL techniques to join disparate data threads (surveys, auditor reports, and water source stats) into a single source of truth for the Maji Ndogo government.

* **Database Auditing:** Cross-referenced 60,000 field records against independent audits to identify anomalies and ensure data reliability.
* **Operational Metrics:** Calculated wait-time benchmarks (Queue Analysis) to identify sites failing UN standards.
* **Complex Data Modeling:** Utilized **CTEs (Common Table Expressions)** and **Window Functions** to rank sources by priority and population served.



## 📊 Key Metrics & Discoveries
This analysis moved beyond visual trends into hard operational numbers:

* **Systemic Integrity Audit:** Identified **4 specific field officials** whose records consistently deviated from audit scores. A targeted SQL analysis revealed a 100% correlation between these discrepancies and mentions of "cash" payments, flagging potential systemic corruption.
* **Queue Time Optimization:** Analysis of the `visits` table revealed that specific "Shared Taps" peaked at over **30 minutes**, identifying a critical need for localized infrastructure expansion.
* **The "Backlog" Metric:** Successfully synthesized and mapped **25,398 specific interventions** (e.g., UV Filter installations, RO Systems, and new Well drills).
* **Project Management:** Engineered a `Project_progress` system to transition "Backlog" items into actionable "Job Lists" for field engineering teams.

## 🏗️ The Engineering Roadmap (Work Order Generation)
The final output was a **Project Implementation Table** designed for field engineering teams to track progress.

| Source Type | Identified Issue | Data-Driven Recommendation | Status |
| :--- | :--- | :--- | :--- |
| **Polluted Wells** | Biological/Chemical Contamination | Install UV/RO Filters | Backlog |
| **Shared Taps** | Wait Times > 30 Mins | Install Additional Taps (Queue Ratio) | Backlog |
| **Broken Taps** | Infrastructure Failure | Localized Diagnostic & Repair | Backlog |
| **Rivers** | Unprotected Source | Drill New Well / Establish Infrastructure | Backlog |

## 💻 Technical Logic Sample: Automated Work-Order Logic
```sql
-- Consolidating field data into actionable work orders
SELECT
    l.address, 
    l.town_name, 
    s.type_of_water_source,
    CASE 
        WHEN wp.results = 'Contaminated: Biological' THEN 'Install UV Filter'
        WHEN wp.results = 'Contaminated: Chemical' THEN 'Install RO Filter'
        WHEN s.type_of_water_source = 'river' THEN 'Drill Well'
        WHEN s.type_of_water_source = 'shared_tap' AND v.time_in_queue > 30 
             THEN CONCAT("Install ", FLOOR(v.time_in_queue/30), " taps nearby")
        WHEN s.type_of_water_source = 'tap_in_home_broken' THEN 'Diagnose local infrastructure'
        ELSE 'Review Infrastructure'
    END AS Improvement_Plan
FROM water_source s
LEFT JOIN well_pollution wp ON s.source_id = wp.source_id
INNER JOIN visits v ON s.source_id = v.source_id
INNER JOIN location l ON l.location_id = v.location_id
WHERE v.visit_count = 1;
