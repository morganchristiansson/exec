$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require 'exec/version'
require 'exec'
 
task :build do
  Exec.system_v "gem build exec.gemspec"
end
 
task :release => :build do
  Exec.system_v "gem push exec-#{Exec::VERSION}.gem"
end

task :install => :build do
  Exec.system_v "gem install exec-#{Exec::VERSION}.gem"
end

task :tag do
  v = Exec::VERSION.gsub(/\./, '_')
  Exec.system_v "git tag REL_#{v}"
  Exec.system_v "git push origin REL_#{v}"
end

