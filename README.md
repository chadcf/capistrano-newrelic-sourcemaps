# Capistrano Newrelic Sourcemaps

This gem wil automatically upload sourcemaps for your javascript files to newrelic during deployment.

For more information, [see here](https://blog.newrelic.com/product-news/source-maps-browser-setup/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano-newrelic-sourcemaps'
```

And then execute:

    $ bundle

## Usage

In your `Capfile`:

```ruby
require 'capistrano/newrelic/sourcemaps'
```

This task will run after `deploy:set_current_revision` by default

## Configurable options


### Required

```ruby
# For generating the minitified url that is passed to NewRelic
set :newrelic_sourcemaps_minified_url_base, "http://myapp.com"

# Directory that wil be searched for source maps to upload
set :newrelic_sourcemaps_target_dir, "./app/assets"

# Admin API token for NewRelic
set :newrelic_sourcemaps_token, -> { fetch :newrelic_admin_token }
```

### Optional

```ruby
# Version of the sourcemaps. Uses current_revision by default.
set :newrelic_sourcemaps_version, => { fetch :current_revision }

# Glob pattern used to find maps in the target directory
set :newrelic_sourcemaps_glob_pattern, File.join('**', '*.js.map')

# Gsub pattern used to convert a sourcemap file to the associated JS file
set :newrelic_sourcemaps_gsub_pattern, /\.map\Z/
```
