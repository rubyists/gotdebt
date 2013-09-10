require_relative '../lib/gotdebt'
#require_relative '../options'
require_relative '../lib/gotdebt/db'
raise "No DB Available" unless Gotdebt.db

# Here go your requires for models:
require_relative 'user'
