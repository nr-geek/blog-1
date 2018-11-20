namespace :ruby do
  desc "Count ruby files in project"
  task files: :environment do
    puts Dir[Rails.root.join('**', '*.rb')].count{ |path| File.file?(path) }
  end

  desc "TODO"
  task lines: :environment do
    count = 0
    Dir[Rails.root.join('**', '*.rb')].each do |path|
      if File.file?(path)
        File.foreach(path){}
        count += $.
      end
    end
    puts count
  end

end
