# Core tasks
load File.expand_path('../../tasks/sourcemaps.rake', __FILE__)

namespace :deploy do
  after :set_current_revision, 'newrelic:sourcemaps:upload'
end

namespace :load do
  task :defaults do
    load "capistrano/newrelic_sourcemaps/sourcemaps/defaults.rb"
  end
end