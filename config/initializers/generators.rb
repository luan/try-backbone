Rails.application.config.generators do |g|
  g.test_framework :rspec, fixtures: false, view_specs: false, controller_specs: false
  g.stylesheets false
  g.javascripts false
end