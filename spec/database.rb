# Initialize/connect.
host = 'localhost'
port = 27017
database_name = 'mongoid_to_csv_test'
Mongoid.configure do |c|
  c.connect_to database_name
  c.clients.default = {
    hosts: ["#{host}:#{port}"],
    database: database_name
  }
end
Mongoid.purge!
