###🏦 Banking Customer Churn Prediction 

Description:
This dataset contains information about bank customers and their churn status, which indicates whether they have exited the bank or not. It is suitable for exploring and analyzing factors influencing customer churn in banking institutions and for building predictive models to identify customers at risk of churning.

Features:
RowNumber: The sequential number assigned to each row in the dataset.

CustomerId: A unique identifier for each customer.

Surname: The surname of the customer.

CreditScore: The credit score of the customer.

Geography: The geographical location of the customer (e.g., country or region).

Gender: The gender of the customer.

Age: The age of the customer.

Tenure: The number of years the customer has been with the bank.

Balance: The account balance of the customer.

NumOfProducts: The number of bank products the customer has.

HasCrCard: Indicates whether the customer has a credit card (binary: yes/no).

IsActiveMember: Indicates whether the customer is an active member (binary: yes/no).

EstimatedSalary: The estimated salary of the customer.

Exited: Indicates whether the customer has exited the bank (binary: yes/no).

Usage:
This dataset can be used for exploratory data analysis to understand the factors influencing customer churn in banks.
It can also be used to build machine learning models for predicting customer churn based on the given features.

SQL ETL → Python  → Power BI Dashboard

Production-grade analytics pipeline analyzing customer records to predict churn risk and identify retention opportunities.

✅ Segments high-risk customers by demographics and behavior patterns  
✅ Uncovers geographic and age-based churn patterns via SQL cohort analysis
✅ Engineers custom features like age_tenure_ratio for better predictions
✅ Deploys interactive Power BI dashboard with risk segmentation and drill-downs

**Tech Stack**: SQL Server, Python (Pandas, Scikit-learn, Seaborn), Power BI
**Skills Demonstrated**: ETL pipelines, feature engineering,  executive dashboards


### 📊 Key Insights Discovered
- Geographic + demographic churn hotspots
- Behavioral patterns indicating flight risk  
- Custom features improving model performance
- Actionable segments for retention campaigns

### Complete analytics pipeline following industry-standard workflow:

✅ SQL: Data extraction, cleaning, cohort analysis, feature engineering
✅ Python: EDA, custom feature creation, data preprocessing, visualization exports  
✅ Power BI: Interactive dashboard with risk segmentation and business insights


## 📋 Project Workflow

### Phase 1: SQL Data Preparation
1. Load raw CSV into SQL Server table
2. Fix data type issues (VARCHAR→INT conversion for Exited)
3. Create cohort analysis by Geography × Gender × Age groups
4. Build features: balance_salary_ratio, activity flags
5. Export cleaned/feature-rich datasets
<img width="462" height="338" alt="Image" src="https://github.com/user-attachments/assets/b5845e9f-d6fd-4dd5-b119-16cda931f708" />
<img width="802" height="405" alt="Image" src="https://github.com/user-attachments/assets/ba9fd154-dad0-421b-9381-49b3f68cc3a2" />
<img width="571" height="304" alt="Image" src="https://github.com/user-attachments/assets/31d5e65a-7b1e-43f8-b1e9-679eb8a1f5de" />
<img width="610" height="386" alt="Image" src="https://github.com/user-attachments/assets/0c452d29-80ed-4f91-85af-ab10688a36d3" />
<img width="918" height="422" alt="Image" src="https://github.com/user-attachments/assets/479c5c9e-79cd-4a90-81a6-7201c014c260" />
<img width="686" height="289" alt="Image" src="https://github.com/user-attachments/assets/8cb6c6dd-6aa6-4424-b195-87dad69aad7d" />

### Phase 2: Python EDA & Feature Engineering
1. Import SQL-processed CSV files
2. Drop irrelevant columns (RowNumber, CustomerId, Surname)
3. Handle missing values and outliers
4. Engineer domain-specific features:
   • age_tenure_ratio = Age/(Tenure+1)
   • balance_salary_ratio = Balance/EstimatedSalary  
   • risk_score (multi-product + high balance flag)
5. Encode categorical variables (Geography one-hot, Gender binary)
6. Generate EDA visualizations (boxplots, correlation heatmaps, churn distributions)
7. Export model-ready datasets + portfolio visuals

### Phase 3: Power BI Dashboarding
1. Import SQL views + Python CSV outputs
2. Create table relationships on CustomerId
3. Build DAX measures (Churn Rate, Risk Score)
4. Design 5-7 page dashboard:
   • Executive KPI summary
   • Geographic churn analysis  
   • Age/tenure risk segmentation
   • Balance-salary scatter plots
   • Interactive slicers + drill-downs
5. Publish to Power BI Service
<img width="920" height="492" alt="Image" src="https://github.com/user-attachments/assets/a0d12e5f-a705-46e8-9152-dddde156ce6f" />
