require 'rake/testtask'
$:.unshift __dir__ + './spec'

Rake::TestTask.new do |t|
  t.libs << "spec"
  #t.test_files = FileList['spec/spec_helper.rb', 'spec/**/*_spec.rb']
  t.test_files = FileList['spec/**/*_spec.rb']
  t.verbose = true
end
task spec: :test
task default: :test

desc "Run a development server"
task :server do
  exec 'bundle exec shotgun'
end

desc "Run an IRB session with the lotus application loaded up"
task :console do
  exec 'bundle exec pry -r./application.rb'
end

desc "Run the database migrations, if any"
task :migrate do
  require 'dotenv'
  Dotenv.load

  exec "sequel -m db/migrations #{ENV.fetch('DATABASE_URL')}"
end
