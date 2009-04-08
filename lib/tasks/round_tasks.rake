desc "Iterate/create the next round"
task :iterate => :environment do
  Round.iterate_or_create!
end
