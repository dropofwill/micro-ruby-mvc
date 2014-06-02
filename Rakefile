require "bundler/gem_tasks"
require 'rake/testtask'

task :default => 'test:all'

namespace :test do

  desc "Run all tests"
  Rake::TestTask.new(:all) do |t|
  	t.libs << "test"
    t.test_files = Dir['test/test_*.rb']
    t.verbose = true
  end

  Dir['test/test_*.rb'].each do |task|
    name = task.gsub(/test\/test_|\.rb\z/, '')
    desc "Run #{name} tests"
    Rake::TestTask.new(:"#{name}") do |t|
      t.pattern = task
    end
  end

end