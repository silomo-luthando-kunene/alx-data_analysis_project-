# Maji Ndogo Part 3: Visualization & Business Intelligence

## 🎯 Project Scope
This final phase focused on transforming audited data into an interactive **Power BI Intelligence Visualisation**. The goal was to provide a real-time view of budget requirements, infrastructure gaps, and project progress.

## 🛠️ Technical Stack
* **Tool:** Microsoft Power BI
* **Data Modeling:** Schema (Linking 60,000+ records across 5+ tables)
* **Features:** DAX (Dynamic Measures), Power Query (ETL), Drill-through Reports and Tooltips.

## 📊 Dashboard 1: National Executive Overview
This dashboard provides a "Bird’s Eye View" of the crisis. It highlights the scale of the population served and the breakdown of water source types nationally.

<img src="./national_dashboard.png" width="800" alt="National Overview Dashboard">

* **Key Insight:** While urban areas show progress, rural regions rely heavily on "Shared Taps," directly correlating with the high queue times identified in the SQL analysis.
* **Functionality:** Users can filter by Province to see how "Amanzi" or "Hawane" differs from the national average.

## 📈 Dashboard 2: Operational Budget & ROI
As an **Industrial & Systems Engineer**, I designed this page to solve the "Allocation Problem." It translates infrastructure needs into dollar amounts.

<img src="./budget_dashboard.png" width="800" alt="Budget Allocation Dashboard">

* **Infrastructural ROI:** This visual demonstrates that repairing **broken taps** is the most cost-effective intervention, serving more people per dollar spent than drilling new wells in specific regions.
* **The "Backlog" Tracker:** A dynamic view of the 25,398 interventions categorized by "Source Status" (Backlog, In Progress, Complete).

## 🕵️ Dashboard 3: Corruption & Integrity Audit
Building on the SQL audit, this dashboard visualizes the performance of field workers to maintain transparency.

<img src="./audit_dashboard.png" width="800" alt="Data Integrity Dashboard">

* **Automated Flagging:** Visualizes the discrepancy between field surveyor scores and independent auditor scores, making it easy for officials to spot the "suspicious" officials identified in Part 2.

## 🧠 DAX & Data Modeling Logic
To ensure the dashboard was performant and accurate, I implemented custom DAX measures:
* **`Total Population Served`**: Dynamic aggregation that reacts to provincial slicers.
* **`Wait Time Benchmark`**: A KPI that flags any source where the average queue exceeds the UN 30-minute standard.

### 🗺️ The Data Model (Star Schema)
<img src="./data_model_thumbnail.png" width="400" alt="Power BI Data Model">

## 🏁 Final Conclusion: From Data to Impact
This dashboard isn't just a collection of charts; it is a **Project Management System**. It allows the government of Maji Ndogo to:
1. **Identify** exactly where the water is polluted.
2. **Allocate** budget based on ROI, not guesswork.
3. **Assign** work orders to engineering teams.
4. **Audit** the process to ensure every cent is spent on improving lives.

---
