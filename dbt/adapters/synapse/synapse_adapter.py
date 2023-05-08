from dbt.adapters.azsql import AzureSQLAdapter

from dbt.adapters.synapse.synapse_connection_manager import SynapseConnectionManager


class SynapseAdapter(AzureSQLAdapter):
    ConnectionManager = SynapseConnectionManager
