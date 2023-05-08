from dbt.adapters.azsql import AzureSQLConnectionManager


class SQLServerConnectionManager(AzureSQLConnectionManager):
    TYPE = "sqlserver"
    TOKEN = None
