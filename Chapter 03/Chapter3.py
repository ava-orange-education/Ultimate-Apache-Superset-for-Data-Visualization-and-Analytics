#AWS Athena
#Install packages:
pip install pyathena[pandas]
pip install PyAthenaJDBC
#Connection string:
awsathena+rest://{access_key}:{secret_key}@athena.{region}.amazonaws.com/{schema}
#AWS Redshift
#Install package:
pip install sqlalchemy-redshift
#Connection string:
redshift+psycopg2://{user}:{password}@{endpoint}:5439/{database}
#PostgreSQL
#Install package:
pip install psycopg2
#Connection string:
postgresql://{user}:{password}@{host}:{port}/{database}
#MySQL
#Install package:
pip install mysqlclient
#Connection string:
mysql://{user}:{password}@{host}/{database}
#Google BigQuery
#Install package:
pip install sqlalchemy-bigquery
#Connection string:
bigquery://{project_id}
