# Federal Tech Employees: Age and Demographic Analysis
### US Digital Corps Analysis - Bench Work 2024

**Contributors:**
- Colton Lapp (USDC '24 - colton.lapp@gsa.gov)

---

## Overview

The goal of this project is to analyze the demographic breakdown of technologists within the Federal Government, using the publicly available "FedScope Employment Data." This analysis will help provide insights into the age distribution and other demographic characteristics of Federal employees working in technology roles.

## Data

The data used in this project consists of large datasets that include anonymized individual-level information for all employees in the Federal Workforce (excluding contractors). The data is available on a quarterly basis up until 2010, and annually from 2010 back to 1998.

By downloading, combining, and filtering this data, we can create time series trends to observe changes in the Federal Workforce over time.

### Data Acquisition

The data can be downloaded from the [OPM Open Data website](https://www.opm.gov/data/datasets/). To prepare the data for analysis:

1. Download every file titled "FedScope Employment Cube."
2. Move the downloaded zip folders to the `data/raw_data` directory.
3. Unzip the files.
4. Rename each file following the format: **FedScope_{Month}Year** (e.g., **FedScope_Dec2023**).

This repository provides scripts and tools to process this data and generate meaningful visualizations and analysis.

---

This README should give users a quick understanding of the project’s purpose, data handling, and steps to prepare the data for analysis.