from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from datetime import datetime
import requests

# Define the DAG
dag = DAG('superset_refresh', description='Superset dataset refresh',
          schedule_interval='@hourly', start_date=datetime(2023, 1, 1), catchup=False)

# Python function to refresh Superset dataset
def refresh_superset():
    api_url = "http://your-superset-url/api/v1/dataset/<dataset_id>/refresh"
    headers = {
        "Authorization": "Bearer YOUR_API_TOKEN"
    }
    response = requests.post(api_url, headers=headers)
    if response.status_code == 200:
        print("Dataset refresh successful")
    else:
        print(f"Failed to refresh: {response.content}")

# Airflow task to refresh dataset
refresh_task = PythonOperator(task_id='refresh_superset_dataset', python_callable=refresh_superset, dag=dag)

# Set task dependencies (optional)
refresh_task
