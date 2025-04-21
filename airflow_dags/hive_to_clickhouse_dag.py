from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.python import PythonOperator
from datetime import datetime
import requests
import pandas as pd
from pyhive import hive
from io import StringIO

CLICKHOUSE_URL = #
CLICKHOUSE_TABLE = "orders"
CLICKHOUSE_DB = "db1"
HIVE_HOST = #
HIVE_PORT = #
HIVE_DATABASE = "default"

def extract_from_hive():
    conn = hive.Connection(host=HIVE_HOST, port=HIVE_PORT, database=HIVE_DATABASE)
    query = "SELECT * FROM orders"
    df = pd.read_sql(query, conn)
    df.to_csv('/tmp/orders_data.csv', index=False)

def load_to_clickhouse():
    with open('/tmp/orders_data.csv', 'r') as f:
        data = f.read()
    response = requests.post(
        f"{CLICKHOUSE_URL}/?query=INSERT INTO {CLICKHOUSE_DB}.{CLICKHOUSE_TABLE} FORMAT CSVWithNames",
        data=data.encode('utf-8'),
        headers={"Content-Type": "text/plain"}
    )
    if response.status_code != 200:
        raise Exception(f"ClickHouse error: {response.text}")

default_args = {
    'start_date': datetime(2025, 4, 21),
    'catchup': False,
}

with DAG(
    dag_id='hive_to_clickhouse',
    schedule_interval='@daily',
    default_args=default_args,
    description='Репликация данных из Hive в ClickHouse',
    tags=['replication', 'clickhouse', 'hive'],
) as dag:

    extract = PythonOperator(
        task_id='extract_from_hive',
        python_callable=extract_from_hive
    )

    load = PythonOperator(
        task_id='load_to_clickhouse',
        python_callable=load_to_clickhouse
    )

    extract >> load
