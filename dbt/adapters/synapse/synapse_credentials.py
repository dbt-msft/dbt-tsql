from dataclasses import dataclass

from dbt.adapters.azsql import AzureSQLCredentials


@dataclass
class SynapseCredentials(AzureSQLCredentials):
    @property
    def type(self):
        return "synapse"
