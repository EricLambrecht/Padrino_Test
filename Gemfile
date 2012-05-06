source :rubygems

PADRINO_VERSION = '0.10.6'

# Project requirements
gem 'rake'
gem 'sinatra-flash', :require => 'sinatra/flash'

# Component requirements
gem 'bcrypt-ruby', :require => "bcrypt"
gem 'haml'
gem 'data_objects'
gem 'rake-compiler'
gem 'rspec'

group :development, :test do
  gem 'dm-sqlite-adapter'
end

gem 'dm-validations'
gem 'dm-timestamps'
gem 'dm-migrations'
gem 'dm-constraints'
gem 'dm-aggregates'
gem 'dm-core'
gem 'activerecord'

# Test requirements

# Padrino Stable Gem
gem 'padrino', PADRINO_VERSION	

# Datenbank-Wechsel für Heroku
group :production do
 gem 'dm-postgres-adapter'
 gem 'do_postgres'
 gem 'pg'
 #gem 'mysql'
 #gem 'dm-mysql-adapter'
 #gem 'do_mysql'
end

# Other requirements
gem 'twitter'
gem 'sinatra-simple-navigation', :require => 'sinatra/simple-navigation'


# Padrino requirements
gem 'padrino-core',    PADRINO_VERSION
gem 'padrino-admin',   PADRINO_VERSION
gem 'padrino-cache',   PADRINO_VERSION
gem 'padrino-helpers', PADRINO_VERSION
gem 'padrino-gen', PADRINO_VERSION
