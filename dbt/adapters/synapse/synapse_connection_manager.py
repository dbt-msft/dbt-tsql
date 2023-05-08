from dbt.adapters.azsql import AzureSQLConnectionManager


class SynapseConnectionManager(AzureSQLConnectionManager):
    TYPE = "synapse"
    TOKEN = None
