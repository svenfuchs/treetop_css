Dir["#{File.expand_path('..', __FILE__)}/**/*_test.rb"].each do |file|
  require file
end