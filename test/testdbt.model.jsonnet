{
  label: 'test',
  name: "test",
  target: {table: "test1"},
  dbt: {
    model: "select 1",
    config: {
        materialized: 'view'
    }
  },
  description: 'It provides session and pageview analytics for Segment Warehouse. For Segment Warehouse users, it provides basic reports similar to Googl Analytics',
}