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
#postgres = URI.parse(ENV['DATABASE_URL'] || '')

#ActiveRecord::Base.configurations[:production] = {
#  :adapter  => 'postgresql',
#  :encoding => 'utf8',
#  :database => postgres.path[1..-1], 
#  :username => postgres.user,
#  :password => postgres.password,
#  :host     => postgres.host
#}

#Es sind folgende MySQL-Datenbanken auf rdbms.strato.de angelegt.

#Datenbank	 DB1077840	Löschen
#Benutzername	 U1077840	Passwort ändern
#Kommentar	Edelbitter	Kommentar ändern
#

DataMapper.logger = logger
DataMapper::Property::String.length(255)
DataMapper.setup(:default,
  :adapter  => 'mysql',
  :database => 'DB1077840',
  :username => 'U1077840',
  :password => '3d3lb!tt3r',
  :host     => 'rdbms.strato.de',
  :port     => ''
)



#case Padrino.env
#  #when :development then DataMapper.setup(:default, "sqlite3://" + Padrino.root('db', "edelbiter_development.db"))
#  when :development then DataMapper.setup(:default, "mongodb://edelbitter:3d3lb!tt3r@staff.mongohq.com:10025/edelbitter")
#  when :production  then DataMapper.setup(:default, "postgres://" + postgres.user + ":" + postgres.password + "@" + postgres.host + "/" + postgres.user)
#  when :test        then DataMapper.setup(:default, "sqlite3://" + Padrino.root('db', "edelbiter_test.db"))
#end