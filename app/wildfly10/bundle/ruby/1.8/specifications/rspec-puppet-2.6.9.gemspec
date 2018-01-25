# -*- encoding: utf-8 -*-
# stub: rspec-puppet 2.6.9 ruby lib

Gem::Specification.new do |s|
  s.name = "rspec-puppet".freeze
  s.version = "2.6.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Tim Sharpe".freeze]
  s.date = "2017-09-12"
  s.description = "RSpec tests for your Puppet manifests".freeze
  s.email = "tim@sharpe.id.au".freeze
  s.executables = ["rspec-puppet-init".freeze]
  s.files = ["bin/rspec-puppet-init".freeze]
  s.homepage = "https://github.com/rodjek/rspec-puppet/".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.4".freeze
  s.summary = "RSpec tests for your Puppet manifests".freeze

  s.installed_by_version = "2.7.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rspec>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
  end
end
