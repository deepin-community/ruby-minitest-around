require 'gem2deb/rake/testtask'

TEST_FILES = FileList.new('test/*_{test,spec}.rb')

desc "Run all tests"
task :test do
  TEST_FILES.each do |test_file|
    sh "bundle", "exec", "rake", "test:isolated", "TEST=#{test_file}"
  end
end

require 'rake/testtask'
Gem2Deb::Rake::TestTask.new do |test|
  test.test_files = TEST_FILES
  test.libs << 'test'
  test.verbose = true
end
