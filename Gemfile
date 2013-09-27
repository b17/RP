#http://www.jsiegel.com/2012/09/upgrading-to-ruby-19-on-heroku.html
if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end
source 'https://rubygems.org'

gem 'activesupport'
gem 'rails'

gem 'geocoder'
gem 'carrierwave'
#gem 'paperclip', '3.5.0'
gem 'rmagick', '2.13.2'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


group :development, :test do
  gem 'sqlite3'
  gem 'seed_dump'
  gem 'test-unit'
end

group :production do
  #gem 'pg'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 3.2.6'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', :require => 'bcrypt'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

# thinking-sphinx needs mysql2
gem 'mysql2',          '0.3.12b5'
gem 'thinking-sphinx', '~> 3.0.2'

gem 'whenever'

gem 'translit'

gem 'simple_calendar', '~> 0.1.9'