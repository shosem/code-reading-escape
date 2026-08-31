Rails.application.configure do
  config.enable_reloading = true
  config.eager_load = false

  config.consider_all_requests_local = true
  config.server_timing = true

  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true

  config.action_view.annotate_rendered_view_with_filenames = true

  config.log_level = :debug

  # Keep i18n quiet for missing keys we don't care about in this demo app.
  config.i18n.raise_on_missing_translations = false
end

