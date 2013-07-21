desc 'Validate and push podspec with versining directory'
task :push_podspec do
  sh "pod push roothybrid7@podspecs"
end

task :run_test do
  $test_success = system("xctool build test ONLY_ACTIVE_ARCH=NO")
end

desc 'Run all tests'
task :test => :run_test do
  if $test_success
    puts '** All tests passed successfully **'
  else
    puts 'Unit tests failed'
    exit(-1)
  end
end

task :default => 'test'
