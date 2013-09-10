require 'innate'

module Gotdebt
  include Innate::Optioned

  options.dsl do
    o "Sequel Database URI (adapter://user:pass@host/database)", :db,
      ENV["GOTDEBT_DB"]

    o "Log Level (DEBUG, DEVEL, INFO, NOTICE, ERROR, CRIT)", :log_level,
      ENV["Gotdebt_LogLevel"] || "INFO"
  end
end
