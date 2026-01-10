# Maji Ndogo Part 3: Visualizing the Data
## Business Intelligence &  Reporting

### 🎯 Project Overview
In the final phase of the Maji Ndogo project, I transitioned from SQL-based auditing to **Data Storytelling**. This Power BI suite was designed as a "Command Center" turning 60 000+ records into an interactive roadmap for national infrastructure development.

### 🛠️ Technical Stack
* **Tool:** Microsoft Power BI
* **Data Modeling:** Schema (Relational Mapping of 5+ tables)
* **Intelligence:** DAX (Dynamic Measures), Power Query and Geospatial Mapping.

---

### ⚙️ System Architecture & Modeling
Before visualizing the data, I established a robust data model to ensure "Single Source of Truth" integrity across all dashboards.

#### **Entity Relationship Diagram (ERD)**
<img src="./thumbnail_erd.png" width="450" alt="Database ERD">

> **Note:** The schema connects geographic locations, water source types and field visit logs. By maintaining a normalized structure, the dashboard can drill down from a national level to a specific street address without performance lag.

---

### 📊 Dashboard 1: National Infrastructure & Access
Strategic overview of water distribution networks and population coverage

<div align="center">
  <img src="./dashboard.png" width="500" alt="National Dashboard Overview">
  <img src="./thumbnail_national.png" width="500" alt="National Dashboard Overview">
</div>

* **System Capacity:** Analyzed access for a total population of 27.6+ Million, mapping the distribution across five primary water source types. This high-level view identifies the "Shared Tap" as the backbone of the current infrastructure, serving the majority of the population but introducing significant system bottlenecks.
* **Geospatial Bottlenecks:** Integrated Power BI Map visuals to perform a Spatial Needs Assessment. By layering population density over source type, Amanzi and Kilimani were identified as critical priority zones. These regions show the highest concentration of "Unimproved" sources, requiring immediate engineering intervention.
* **Urban-Rural Infrastructure Gap:** Developed a visual comparative analysis revealing that rural sectors are over-indexed on Shared Taps and Wells, while urban centers benefit from "Tap in Home" systems. This disparity highlights a systemic failure in rural last-mile delivery, necessitating a shift toward decentralized water purification systems in remote areas.
---

### 📈 Dashboard 2: Social Impact (Gender & Safety)
Analysis of demographic burdens and the correlation between infrastructure efficiency and public safety.

<div align="center">
  <!-- Ensure total width does not exceed 100% of the README container width -->
  <img src="./thumbnail_crime1.png" width="500" alt="Social Impact Analysis 1">
  <img src="./thumbnail_crime2.png" width="500" alt="Social Impact Analysis 2">
</div>
<br/>

<!-- One image below, centered -->
<div align="left">
  <!-- Use 800px width for the bottom image -->
<img src="./thumbnail_crime3.png" width="500" alt="Social Impact Analysis 3">
</div>


* **Gendered Labor Disparity:** Quantitative analysis reveals a significant Gender Gap in water procurement. Women and girls account for over 65% of all water collection trips particularly in rural regions. This insight highlights a secondary socio-economic crisis: the loss of "educational and economic hours" for female citizens which directly impacts the nation's long-term human capital development.
* **Safety Analytics (Queue vs. Crime):** By cross-referencing historical crime records with water source locations a clear correlation was identified between queue times exceeding 60 minutes and an increase in violent incidents. This data suggests that infrastructure bottlenecks are not just operational failures but major contributors to public insecurity.
* **Temporal Risk Mapping:** The dashboard identifies "High-Risk Windows" (early morning and late evening hours) when water collection is most dangerous. By visualizing these spikes the report provides a mandate for localized security interventions and the prioritization of lighting/surveillance in high-traffic shared-tap zones.
* **Social ROI of Infrastructure:** This analysis shifts the project’s goal from simple "Water Access" to "Social Protection." Reducing queue times through decentralized taps is shown to have a direct positive impact on reducing crime rates effectively turning infrastructure investment into a primary tool for social stability and gender equity.
---

### 💰 Dashboard 3: Operational Budget & Project Progress
<div align="left">
<img src="./budget_progress.png" width="500" alt="Budget and Work Order Dashboard">

* **Financial ROI:** Using DAX measures, I demonstrated that repairing **Broken Taps** and **Pipes** serves the highest number of people per dollar spent, justifying a "Repair First" budget strategy.
* **Real-Time Deployment:** This dashboard tracks **25,398 specific interventions**, moving items from "Backlog" to "In Progress" to "Complete" as engineering teams update the system.

---

### 💰 Dashboard 4: Pollution and Environmental Impact
<div align="left">
<img src="./pollution_data.png" width="500" alt="Budget and Work Order Dashboard">

* **Financial ROI:** Using DAX measures, I demonstrated that repairing **Broken Taps** and **Pipes** serves the highest number of people per dollar spent, justifying a "Repair First" budget strategy.
* **Real-Time Deployment:** This dashboard tracks **25,398 specific interventions**, moving items from "Backlog" to "In Progress" to "Complete" as engineering teams update the system.

---

### 🧠 Key DAX Implementation
To drive these insights, I developed custom DAX measures:
* **`Avg Queue Time`**: Specifically flags sources exceeding the 30-minute UN standard.
* **`Population Reach`**: A dynamic measure that calculates the number of people impacted by a single intervention.
* **`Estimated Cost`**: A weighted calculation based on the specific `Improvement_Plan` requirements for each unique source.

### 🏁 Final Conclusion
As a **Data Practitioner and Industrial Engineer**, this project represents the full lifecycle of a data-driven solution. By applying systems thinking to the Maji Ndogo water crisis, I successfully turned messy field data into a prioritized, budgeted, and transparent project management system that saves lives and optimizes resources.

---
*Aspiring Professional Engineer | Data Analyst | ALX Africa Capstone*
