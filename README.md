# Healthplus_Hospital_Data_Modernization_project
cleaning all four datasets, exporting cleaned data, loading into postgreSQL, performing SQL analysis, and publishing the project to Github
### Healthplus Hospital Data Modernization

**Cleaning, transforming, and loading hospital datasets into PostgreSQL for SQL analysis and reproducible delivery.** This repository contains a complete pipeline for cleaning four hospital datasets, exporting cleaned CSVs, loading them into PostgreSQL, and performing SQL-based analysis and reporting.   [github.com](https://github.com/chinweubaudeh-crypto/Healthplus_Hospital_Data_Modernization_project)

---

### Tech Stack

- **Python**  
- **pandas**  
- **virtual environment**  
- **PostgreSQL**  
- **VS Code**

---

### Getting Started

#### Prerequisites
- **Python 3.8+** installed.
- **PostgreSQL** installed and running.
- **git** for cloning the repository.
- **VS Code** or your preferred editor.

#### Clone the repository
```bash
git clone https://github.com/chinweubaudeh-crypto/Healthplus_Hospital_Data_Modernization_project.git
cd Healthplus_Hospital_Data_Modernization_project
```

#### Create and activate virtual environment
```bash
python -m venv .venv

source .venv/bin/activate
# Windows cmd
.venv\Scripts\Activate.ps1


#### Install dependencies
```bash
pip install --upgrade pip
pip install -r requirements.txt
```

If `requirements.txt` is not present, install the essentials:
```bash
pip install pandas psycopg2-binary sqlalchemy python-dotenv

---

### Data Processing Workflow

1. **Raw data ingestion**  
   Place the original datasets in the designated `data/raw` folder.

2. **Cleaning and transformation**  
   - Use the Python scripts in `src/` to:
   - Standardize column names and types.
   - Handle missing values and duplicates.
   - Normalize categorical values and dates.
   - Export cleaned datasets to `data/cleaned`.

3. **Export cleaned data**  
   Cleaned CSVs are written to `data/cleaned` ready for database ingestion.

4. **Load into PostgreSQL**  
   Use provided loader scripts to create tables and bulk-load cleaned CSVs.

This project focuses on cleaning four datasets, exporting cleaned data, loading into PostgreSQL, and performing SQL analysis.   [github.com](https://github.com/chinweubaudeh-crypto/Healthplus_Hospital_Data_Modernization_project)

---

### Database Setup and SQL Analysis

#### Environment variables
Create a `.env` file in the project root with the following variables:
'code'
DB_HOST=localhost
DB_PORT=5432
DB_NAME=healthplus
DB_USER=your_db_user
DB_PASSWORD=your_db_password


#### Create database and user
'sql'
-- run in psql or pgAdmin
CREATE DATABASE healthplus_project;
CREATE USER your_db_user WITH ENCRYPTED PASSWORD 'your_db_password';
GRANT ALL PRIVILEGES ON DATABASE healthplus_project TO your_db_user;
```

#### Run the loader
```bash
# from project root
python src/load_to_postgres.py --config .env
```
**Loader behavior**
- Creates schema and tables if they do not exist.
- Uses `COPY` or bulk insert for performance.
- Validates row counts after load.

#### SQL analysis
- SQL scripts are stored in `sql/` and include exploratory queries, aggregations, and joins across the cleaned tables.
- Use `psql`, pgAdmin, or VS Code SQL extensions to run and iterate on queries.
- Export query results as CSV for downstream reporting.

---

### Project Structure

```
.
├─ data/
│  ├─ raw/
│  └─ cleaned/
├─ src/
│  ├─ cleaning.py
│  ├─ transform.py
│  └─ load_to_postgres.py
├─ sql/
│  └─ analysis_queries.sql
├─ .env.example
├─ requirements.txt
└─ README.md
```

**Notes**
- Keep raw data immutable; perform all transformations in `src/` and write outputs to `data/cleaned`.
- Scripts are modular: one script per major step (clean, transform, load).

---

### Usage Examples

- **Run full pipeline**
```bash
python src/cleaning.py --input data/raw --output data/cleaned
python src/load_to_postgres.py --config .env
```

- **Run a single SQL analysis**
```bash
psql postgresql://your_db_user:your_db_password@localhost:5432/healthplus -f sql/analysis_queries.sql
```

---

### Contributing

- **Branching**: Create a feature branch `feature/your-feature`.
- **Code style**: Follow PEP8 and use meaningful commit messages.
- **Testing**: Add unit tests for transformation logic where applicable.
- **Pull requests**: Open PRs against `main` with a clear description of changes and any migration steps.

---

**Quick reference**  
- **Cleaned data**: `data/cleaned`  
- **Loader script**: `src/load_to_postgres.py`  
- **SQL queries**: `sql/analysis_queries.sql`

