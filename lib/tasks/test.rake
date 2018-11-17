namespace :test do
  desc 'Say hello'
  task say: :environment do
    puts 'hello'
  end
end
