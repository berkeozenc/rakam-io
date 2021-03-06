{
  name: 'snowflake.storage_usage',
  target: { database: 'SNOWFLAKE', schema: 'ACCOUNT_USAGE', table: 'DATABASE_STORAGE_USAGE_HISTORY' },
  measures: {
    average_storage_tb: {
      aggregation: 'average',
      sql: '{{dimension.storage_tb}}',
    },
    count: {
      aggregation: 'count',
    },
    billable_tb: {
      aggregation: 'average',
      sql: '{{dimension.total_tb}}',
    },
    current_month_billable_tb: {
      aggregation: 'average',
      sql: '{{dimension.total_tb}}',
      filters: [],
    },
    prior_month_billable_tb: {
      aggregation: 'average',
      sql: '{{dimension.storage_tb}} + {{dimension.failsafe_tb}}',
      filters: [{ dimension: 'usage', operator: 'lessThan', value: 'P1M', valueType: 'timestamp' }],
    },
  },
  dimensions: {
    database_id: {
      column: 'DATABASE_ID',
    },
    deleted: {
      column: 'DELETED',
    },
    database_name: {
      column: 'DATABASE_NAME',
    },
    usage: {
      column: 'USAGE_DATE',
      timeframes: [],
    },
    storage_bytes: {
      column: 'AVERAGE_DATABASE_BYTES',
    },
    failsafe_bytes: {
      column: 'AVERAGE_FAILSAFE_BYTES',
    },
    storage_tb: {
      sql: '{{dimension.storage_bytes}} / power(1024,4) ',
    },
    failsafe_tb: {
      sql: '{{dimension.failsafe_bytes}} / power(1024,4) ',
    },
    total_tb: {
      sql: '{{dimension.storage_tb}} + {{dimension.failsafe_tb}}',
    },
  },
}
