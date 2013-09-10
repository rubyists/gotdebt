require 'rake'
require 'rake/clean'
require 'rubygems/package_task'
require 'time'
require 'date'
require_relative "lib/gotdebt"
require "sequel"

PROJECT_SPECS = FileList[
  'spec/**/*.rb'
]

PROJECT_MODULE = 'Gotdebt'
PROJECT_README = 'README'
#PROJECT_RUBYFORGE_GROUP_ID = 3034
PROJECT_COPYRIGHT_SUMMARY = [
 "# Copyright (c) 2008-#{Time.now.year} The Rubyists, LLC (effortless systems) <rubyists@rubyists.com>",
 "# Distributed under the terms of the MIT license.",
 "# See the LICENSE file which accompanies this software for the full text",
 "#"
]
PROJECT_COPYRIGHT = PROJECT_COPYRIGHT_SUMMARY + [
 "# Permission is hereby granted, free of charge, to any person obtaining a copy",
 '# of this software and associated documentation files (the "Software"), to deal',
 "# in the Software without restriction, including without limitation the rights",
 "# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell",
 "# copies of the Software, and to permit persons to whom the Software is",
 "# furnished to do so, subject to the following conditions:",
 "#",
 "# The above copyright notice and this permission notice shall be included in",
 "# all copies or substantial portions of the Software.",
 "#",
 '# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR',
 "# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,",
 "# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE",
 "# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER",
 "# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,",
 "# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN",
 "# THE SOFTWARE."
]


# To release the monthly version do:
# $ PROJECT_VERSION=2009.03 rake release
IGNORE_FILES = [/\.gitignore/]

GEMSPEC = Gem::Specification.new{|s|
  s.name         = 'gotdebt'
  s.author       = "rciweb"
  s.summary      = "The Gotdebt library, by rciweb"
  s.description  = "The Gotdebt library, by rciweb"
  s.email        = 'tj@rubyists.com'
  s.homepage     = ''
  s.platform     = Gem::Platform::RUBY
  s.version      = (ENV['PROJECT_VERSION'] || (begin;Object.const_get(PROJECT_MODULE)::VERSION;rescue;Date.today.strftime("%Y.%m.%d");end))
  s.files        = `git ls-files`.split("\n").sort.reject { |f| IGNORE_FILES.detect { |exp| f.match(exp)  } }
  s.has_rdoc     = true
  s.require_path = 'lib'
  s.bindir = "bin"
  s.executables = ["Gotdebt"]
  

  s.post_install_message = <<MESSAGE.strip
============================================================

Thank you for installing Gotdebt!

============================================================
MESSAGE
}

Dir['tasks/*.rake'].each{|f| import(f) }

task :default => [:bacon]

CLEAN.include %w[
  **/.*.sw?
  *.gem
  .config
  **/*~
  **/{data.db,cache.yaml}
  *.yaml
  pkg
  rdoc
  ydoc
  *coverage*
]
