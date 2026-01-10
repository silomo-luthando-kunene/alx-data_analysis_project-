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

<div align="center">
  <img src="./dashboard.png" width="500" alt="National Dashboard Overview">
  <img src="./thumbnail_national.png" width="500" alt="National Dashboard Overview">
</div>

* **Bird's Eye View:** Provides a total count [27+million] of people's access to different basic water sources and categorizes water sources by geographical/locational types.
* **Geo Insights:** Utilizing the Power BI Map visual to pinpoint provinces like **Amanzi** and **Kilimani** as high-priority zones based on the population density and their water access requirements.
* **Urban vs. Rural Disparity:** A clear visual breakdown showing that rural communities remain significantly more dependent on shared taps and wells compared to urban centers highlighting the urgent need for water source development in rural areas in order to improve water access to rural populations.

---

### 📈 Dashboard 2: Social Impact (Gender & Safety)

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


* **The Gender Gap:** Data visualization reveals that **women and girls** bear the primary burden of water collection, accounting for over **65%** of trips in rural regions.
* **Queue-Related Crime:** By overlaying queue times with historical crime data, I identified a direct correlation between **long wait times** and safety risks. This shifted the project's priority from just "providing water" to "ensuring safety" through improved infrastructure.

---

### 💰 Dashboard 3: Operational Budget & Project Progress
<div align="left">
<img src="./budget_progress.png" width="500" alt="Budget and Work Order Dashboard">

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
