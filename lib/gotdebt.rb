require "pathname"
#$LOAD_PATH.unshift(File.expand_path("../", __FILE__))

# Allows for pathnames to be easily added to
class Pathname
  def /(other)
    join(other.to_s)
  end
end

# The Gotdebt library, by rciweb
module Gotdebt
  ROOT = Pathname(Pathname(File.dirname(__FILE__) + "/..").expand_path) unless Gotdebt.const_defined?("ROOT")
  LIBDIR = ROOT/:lib unless Gotdebt.const_defined?("LIBDIR")
  MIGRATION_ROOT = ROOT/:db/:migrate
  L = LIBDIR/:gotdebt unless Gotdebt.const_defined?("L")
  M = ROOT/:model unless Gotdebt.const_defined?("M")
  C = ROOT/:controller unless Gotdebt.const_defined?("C")
end
require (Gotdebt::LIBDIR/"version").to_s
