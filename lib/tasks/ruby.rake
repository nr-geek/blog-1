namespace :ruby do
  desc "Count ruby files in project"
  task files: :environment do
    @files = Dir[Rails.root.join('**', '*.rb')].select{ |path| File.file?(path) }
  end

  namespace :files do
    desc "Count ruby files"
    task count: :files do
      puts @files.count
    end
  end

  namespace :lines do
    desc "Count lines in ruby files"
    task count: :files do
      puts @files.inject(0){ |count, path| File.foreach(path){}; count + $. }
    end
  end
end
