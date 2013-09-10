desc "migrate to latest version of db"
task :migrate, :version do |_, args|
  args.with_defaults(:version => nil)
  require File.expand_path("../../lib/gotdebt", __FILE__)
  require_relative "../lib/gotdebt/db"
  #require_relative "../options"
  require 'sequel/extensions/migration'

  Gotdebt.db.loggers << Logger.new($stdout)

  raise "No DB found" unless Gotdebt.db
  warn Gotdebt.db.inspect

  require_relative "../model/init"

  if args.version.nil?
    Sequel::Migrator.apply(Gotdebt.db, Gotdebt::MIGRATION_ROOT)
  else
    Sequel::Migrator.run(Gotdebt.db, Gotdebt::MIGRATION_ROOT, :target => args.version.to_i)
  end
end
