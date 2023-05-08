from dbt.adapters.azsql import AzureSQLAdapter

from dbt.adapters.sqlserver.sql_server_connection_manager import SQLServerConnectionManager

class SQLServerAdapter(AzureSQLAdapter):
    ConnectionManager = SQLServerConnectionManager