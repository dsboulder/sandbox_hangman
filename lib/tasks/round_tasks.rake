desc "Iterate/create the next round"
task :iterate => :environment do
  Round.iterate_or_create!
end

desc "Iterate every 10 seconds"
task :keep_iterating do
  while(true)
    system("rake iterate")
    sleep ENV["DELAY"] ? ENV["DELAY"].to_i : 10.0
  end
end
