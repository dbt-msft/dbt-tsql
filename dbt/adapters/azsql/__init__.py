from dbt.adapters.base import AdapterPlugin

from dbt.adapters.azsql.azsql_adapter import AzureSQLAdapter
from dbt.adapters.azsql.azsql_column import AzureSQLColumn
from dbt.adapters.azsql.azsql_configs import AzureSQLConfigs
from dbt.adapters.azsql.azsql_connection_manager import AzureSQLConnectionManager
from dbt.adapters.azsql.azsql_credentials import AzureSQLCredentials
from dbt.include import azsql

Plugin = AdapterPlugin(
    adapter=AzureSQLAdapter,
    credentials=AzureSQLCredentials,
    include_path=azsql.PACKAGE_PATH,
)

__all__ = [
    "Plugin",
    "AzureSQLConnectionManager",
    "AzureSQLColumn",
    "AzureSQLAdapter",
    "AzureSQLCredentials",
    "AzureSQLConfigs",
]
