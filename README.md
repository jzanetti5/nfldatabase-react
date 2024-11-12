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
    '''sh
    cd "nfl-rookies-app"
    npm start
    ```
