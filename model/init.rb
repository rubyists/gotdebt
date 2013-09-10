require_relative '../lib/gotdebt'
require_relative '../options'
require_relative '../lib/gotdebt/db'
raise "No DB Available" unless Gotdebt.db
unless Object.const_defined?("DB")
  DB=Gotdebt.db
end

# Here go your requires for models:
require_relative 'user'
