require 'rubygems'
require 'uri'
require 'active_record'

##
# A MySQL connection:
# DataMapper.setup(:default, 'mysql://user:password@localhost/the_database_name')
#
# # A Postgres connection:
# DataMapper.setup(:default, 'postgres://user:password@localhost/the_database_name')
#
# A Sqlite3 connection
# DataMapper.setup(:default, "sqlite3://" + Padrino.root('db', "development.db"))

# config/database.rb
postgres = URI.parse(ENV['DATABASE_URL'] || '')

ActiveRecord::Base.configurations[:production] = {
  :adapter  => 'postgresql',
  :encoding => 'utf8',
  :database => postgres.path[1..-1], 
  :username => postgres.user,
  :password => postgres.password,
  :host     => postgres.host
}

DataMapper.logger = logger
DataMapper::Property::String.length(255)


case Padrino.env
  when :development then DataMapper.setup(:default, "sqlite3://" + Padrino.root('db', "edelbiter_development.db"))
  when :production  then DataMapper.setup(:default, "postgres://" + postgres.user + ":" + postgres.password + "@" + postgres.host + "/" + postgres.user)
  when :test        then DataMapper.setup(:default, "sqlite3://" + Padrino.root('db', "edelbiter_test.db"))
end