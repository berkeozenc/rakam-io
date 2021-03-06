local ad_performance_reports = import './ad_performance_reports.model.jsonnet';

{
  name: 'adwords_campaign_performance_reports',
  hidden: true,
  target: std.mergePatch(std.extVar('schema'), { table: 'campaign_performance_reports' }),
  label: 'Adwords Campaign Performance',
  description: 'Includes a daily snapshot of performance statistics per campaign.',
  mappings: {},
  category: 'Marketing',
  relations: {
    adwords_campaigns: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'adwords_campaigns',
      sourceColumn: 'campaign_id',
      targetColumn: 'id',
    },
    base_adwords_campaign: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'adwords_campaigns',
      sourceColumn: 'base_campaign_id',
      targetColumn: 'id',
    },
  },
  dimensions: {
    id: {
      pivot: false,
      type: 'string',
      column: 'id',
      hidden: false,
    },
    received_at: {
      pivot: false,
      timeframes: [
        'hour',
        'day',
        'week',
        'month',
        'year',
        'hourOfDay',
        'dayOfMonth',
        'weekOfYear',
        'monthOfYear',
        'quarterOfYear',
        'dayOfWeek',
      ],
      type: 'timestamp',
      column: 'received_at',
      hidden: false,
    },
    campaign_status: {
      pivot: false,
      type: 'string',
      column: 'campaign_status',
    },
    campaign_trial_type: {
      pivot: false,
      type: 'string',
      column: 'campaign_trial_type',
    },
    interaction_types: {
      pivot: false,
      type: 'string',
      column: 'interaction_types',
    },
    uuid_ts: {
      pivot: false,
      timeframes: [
        'hour',
        'day',
        'week',
        'month',
        'year',
        'hourOfDay',
        'dayOfMonth',
        'weekOfYear',
        'monthOfYear',
        'quarterOfYear',
        'dayOfWeek',
      ],
      type: 'timestamp',
      column: 'uuid_ts',
    },
    is_budget_explicitly_shared: {
      pivot: false,
      type: 'string',
      column: 'is_budget_explicitly_shared',
    },
    base_campaign_id: {
      pivot: false,
      type: 'string',
      column: 'base_campaign_id',
    },
    date_start: {
      pivot: false,
      timeframes: [
        'hour',
        'day',
        'week',
        'month',
        'year',
        'hourOfDay',
        'dayOfMonth',
        'weekOfYear',
        'monthOfYear',
        'quarterOfYear',
        'dayOfWeek',
      ],
      type: 'timestamp',
      column: 'date_start',
    },
    date_stop: {
      pivot: false,
      timeframes: [
        'hour',
        'day',
        'week',
        'month',
        'year',
        'hourOfDay',
        'dayOfMonth',
        'weekOfYear',
        'monthOfYear',
        'quarterOfYear',
        'dayOfWeek',
      ],
      type: 'timestamp',
      column: 'date_stop',
    },
    advertising_channel_sub_type: {
      pivot: false,
      type: 'string',
      column: 'advertising_channel_sub_type',
    },
    campaign_id: {
      pivot: false,
      type: 'string',
      column: 'campaign_id',
    },
    budget_id: {
      column: 'budget_id',
    },
    adwords_customer_id: {
      column: 'adwords_customer_id',
    },
  },
  measures: ad_performance_reports.measures,
}
