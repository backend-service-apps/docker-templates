FROM apache/superset:b80f0186915b91df03f5ee5c15eba4b176596a96

USER root
RUN pip install clickhouse-driver>=0.2.0
RUN pip install clickhouse-sqlalchemy>=0.1.6
RUN PYMSSQL_BUILD_WITH_BUNDLED_FREETDS=1 pip install pymssql
#RUN apt-get update ; apt-get install -y python3-pip python3-dev unixodbc-dev ; pip install pyodbc
USER superset
