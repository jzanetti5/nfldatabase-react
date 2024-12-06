# NFL Rookies App

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

## Getting Started

### Start the Database & Web App

First, you will need to start the PostgreSQL database. Follow these steps:

1. Export the PostgreSQL host:
   ```sh
   export PGHOST=/tmp
   export PGPORT=8888
   ```

2. Start the database:
    ```sh
    pg_ctl -D $HOME/NFLPGData -o '-k /tmp' start
    psql -d $USER
    ```

3. Start the backend server to interact with the SQL database:
    ```sh
    cd backend
    npm run dev
    ```

4. Start the react web application:
    ```sh
    cd frontend
    npm start
    ```

### Run the Data Collection Script

To run the data collection script, you need to install the `psycopg2` package and then execute the script.

1. Install the `psycopg2` package:
    ```sh
    pip install psycopg2
    ```

2. Change to the `downloadedapidata` directory:
    ```sh
    cd downloadedapidata
    ```

3. Run the data collection script:
    ```sh
    python3 data_collection.py
    ```