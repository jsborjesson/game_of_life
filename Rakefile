require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = "--color --format=documentation"
end

task :default => :spec

task :run do
  require './lib/game_of_life'
  GameOfLife.new.run
end