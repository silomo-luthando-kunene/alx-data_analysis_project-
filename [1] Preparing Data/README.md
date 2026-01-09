# Access to Drinking Water: Data Cleaning, Transformation and Analysis.
Presentation here: 
## Project Overview
This project investigates global access to safe and affordable drinking water, aligned with the United Nations Sustainable Development Goal 6 (Clean Water and Sanitation). Utilizing datasets from the WHO/UNICEF Joint Monitoring Programme (JMP), the project analyzes water service levels across national, urban, and rural populations from 2000 to 2020.

The primary objective was to transform raw monitoring data into actionable insights by calculating Annual Rates of Change (ARC) and identifying trends in service accessibility based on geographical regions and income groups.

## Data Engineering & Transformation
A significant portion of this project focused on rigorous data cleaning and feature engineering to ensure analytical accuracy:
* **Data Integrity:** Identified and resolved delimiter inconsistencies (semicolon vs. comma) that affected data alignment.
* **Feature Engineering:** Developed a value_cnt feature to audit row completeness and isolate erroneous entries.
  * Created pop_u_val to convert percentage shares into absolute population figures for global comparison.
  * Calculated y_diff to determine the interval between data collections per country.
* **Annual Rate of Change (ARC) Calculation:** Implemented conditional logic to calculate the yearly change rate in water access for national, rural, and urban sectors.
  * **Formula:** ARC_x = (P_x,y2 - P_x,y1) / (Y_2 - Y_1).

## Key Analytical Insights
* **Demographic Analysis:** Evaluated the dataset's representation against a global population of 7.821 billion, using percentage difference metrics to validate the sample size.
* **Service Level Trends:** Analyzed four key service levels—Basic, Limited, Unimproved, and Surface water access.
* **Urban-Rural Disparity:** Created visualizations to compare the share of populations living in urban vs. rural areas and their respective access to basic services.

### Estimates of the use of water (2000-2020).xlsx: 
Estimates of the use of water (2000-2020).csv: The primary longitudinal dataset used for ARC calculations.
