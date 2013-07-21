task :run_test do
  $test_success = system("xctool -workspace RHObjCExt.xcworkspace -scheme RHObjCExt build test -sdk iphonesimulator ONLY_ACTIVE_ARCH=NO")
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
