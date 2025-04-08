from celery import Celery
import os

class CeleryConfig:
    broker_url = 'redis://redis:6379/0'
    result_backend = 'redis://redis:6379/1'
    task_annotations = {'*': {'rate_limit': '10/s'}}
    worker_concurrency = 4  # Adjust based on your CPU availability

app = Celery('tasks')
app.config_from_object(CeleryConfig)
