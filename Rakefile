WORKSPACE = ENV['WORKSPACE'] || 'RHObjCExt.xcworkspace'
SDK = ENV['SDK'] || 'iphonesimulator'

desc 'Validate and push podspec with versining directory'
task :push_podspec do
  sh "pod push roothybrid7@podspecs"
end

task :run_logic_test do
  $test_success = system("xcodebuild \
    -sdk #{SDK} \
    -workspace #{WORKSPACE} \
    -scheme RHObjCExtLogicTests \
    -configuration Debug \
    clean test \
    ONLY_ACTIVE_ARCH=NO | xcpretty -c")
end

task :run_app_test do
  $test_success = system("xcodebuild \
    -sdk #{SDK} \
    -workspace #{WORKSPACE} \
    -scheme RHObjCExtTests \
    -configuration Debug \
    clean test \
    ONLY_ACTIVE_ARCH=YES \
    TEST_HOST= | xcpretty -c")
end

desc 'Run all tests'
task :test => [:run_logic_test, :run_app_test] do
  if $test_success
    puts '** All tests passed successfully **'
  else
    puts 'Unit tests failed'
    exit(-1)
  end
end

task :default => 'test'
