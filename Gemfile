source :rubygems

PADRINO_VERSION = '0.10.5'

# Project requirements
gem 'rake'
gem 'sinatra-flash', :require => 'sinatra/flash'

# Component requirements
gem 'bcrypt-ruby', :require => "bcrypt"
gem 'haml'

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
gem 'padrino', '0.10.5'

# Datenbank-Wechsel für Heroku
group :production do
 gem 'dm-postgres-adapter'
 gem 'do_postgres'
 gem 'pg'
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
