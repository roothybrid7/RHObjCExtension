WORKSPACE = ENV['WORKSPACE'] || 'RHObjCExtension.xcworkspace'
SDK = ENV['SDK'] || 'iphonesimulator'
$test_success = true

desc 'Validate and push podspec with versining directory'
task :push_podspec do
  sh "pod push roothybrid7@podspecs"
end

task :run_logic_test do
  $test_success &= system("xcodebuild \
    -sdk #{SDK} \
    -workspace #{WORKSPACE} \
    -scheme RHObjCExtensionLogicTests \
    -configuration Debug \
    clean test \
    ONLY_ACTIVE_ARCH=NO | xcpretty -c")
end

task :run_app_test do
  $test_success &= system("xcodebuild \
    -destination='platform=android' \
    -workspace #{WORKSPACE} \
    -scheme RHObjCExtensionTests \
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
