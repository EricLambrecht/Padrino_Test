require 'rubygems'
require 'uri'
require 'dm-postgres-adapter'

##
# A MySQL connection:
# DataMapper.setup(:default, 'mysql://user:password@localhost/the_database_name')
#
# # A Postgres connection:
# DataMapper.setup(:default, 'postgres://user:password@localhost/the_database_name')
#
# A Sqlite3 connection
# DataMapper.setup(:default, "sqlite3://" + Padrino.root('db', "development.db"))

DataMapper.logger = logger
DataMapper::Property::String.length(255)

DataMapper.setup(:default,
  :adapter  => 'postgres',
  :database => 'resource45289',
  :username => 'pqezofbwhoycsz',
  :password => 'LtqNnZD-OlhD1LRDWg8gSkgECj',
  :host     => 'ec2-23-23-201-251.compute-1.amazonaws.com',
  :port     => 5432
)
