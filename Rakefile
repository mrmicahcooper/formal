#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rspec/core/rake_task'

desc 'Default: run tests.'
task :default => :spec

desc 'Run formal tests.'
RSpec::Core::RakeTask.new('spec') do |t|
  t.pattern = FileList['spec/**/*_spec.rb']
end
