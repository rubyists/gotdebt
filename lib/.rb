require "pathname"
$LOAD_PATH.unshift(File.expand_path("../", __FILE__))

# Allows for pathnames to be easily added to
class Pathname
  def /(other)
    join(other.to_s)
  end
end

# The  library, by rciweb
module 
  autoload :VERSION, "/version"
  ROOT = Pathname($LOAD_PATH.first) unless .const_defined?("ROOT")
  LIBDIR = ROOT/:lib unless .const_defined?("LIBDIR")
end
