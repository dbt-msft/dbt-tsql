from dataclasses import dataclass

from dbt.adapters.azsql import AzureSQLCredentials


@dataclass
class SQLServerCredentials(AzureSQLCredentials):
    @property
    def type(self):
        return "sqlserver"
