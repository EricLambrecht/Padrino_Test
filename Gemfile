source :rubygems

# Server requirements (defaults to WEBrick)
# gem 'thin'
# gem 'mongrel'

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
# gem 'mail'
gem 'sinatra-simple-navigation', :require => 'sinatra/simple-navigation'

# Or Padrino Edge
# gem 'padrino', :git => 'git://github.com/padrino/padrino-framework.git'

# Or Individual Gems
# %w(core gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.10.5'
# end
