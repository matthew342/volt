source 'http://rubygems.org'

gemspec

# gem 'rspec', '3.0.0.beta1'

# Run 0.7 from master until it comes out
gem 'opal', git: 'https://github.com/opal/opal.git'
# gem 'opal-jquery', :git => 'https://github.com/opal/opal-jquery.git'

#---------------------
# Needed at the moment
gem 'volt-sockjs', require: false, platforms: :mri

# gem 'thor'

# gem 'rack'
# gem 'sprockets'
# gem 'sprockets-sass'
# gem 'sass'

# gem 'mongo', require: false
# gem 'pry', require: false
# gem 'thin', require: false, platforms: :mri

# Json parsing with multi_json, et al
# gem 'multi_json'
# gem 'oj', :platforms => :mri, :require => false
# gem 'jrjackson', :platforms => :jruby, :require => false

# gem 'rake', '10.0.4'

# # Needed to get opal to work on rbx
# gem 'racc', platforms: :rbx

group :development do
  # For testing the kitchen sink app
  # Twitter bootstrap
  gem 'volt-bootstrap'

  # Simple theme for bootstrap, remove to theme yourself.
  gem 'volt-bootstrap-jumbotron-theme'

  gem 'opal-rspec', git: 'https://github.com/opal/opal-rspec.git'

  gem 'rubocop', require: false
  # gem 'guard', '2.0.1' # bug in current guard
  # gem 'guard-rspec'
  # gem 'yard', require: false
end

group :development, :test do
  gem 'bson_ext'
end