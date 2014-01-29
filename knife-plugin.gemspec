require File.dirname(__FILE__) + '/lib/knife-plugin'
Gem::Specification.new do |s|
  s.name = 'knife-plugin'
  s.version = Knife::Plugin::VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.md", "LICENSE"]
  s.summary = "Knife Plugin to work with other Knife Plugins"
  s.author = "Joshua Timberman"
  s.email = "joshua@getchef.com"
  s.homepage = "http://github.com/jtimberman/knife-plugin"
  s.require_path = 'lib'
  s.files = %w(LICENSE README.md) + Dir.glob("lib/**/*")
  s.add_dependency('chef', '>= 0.10.0')
end
