require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new

task default: :test

desc 'Run the test suite'
task test: [:spec, :rubocop]

RuboCop::RakeTask.new(:rubocop) do |task|
  task.options = ['-D']
end
