#lib/tasks/import.rake
desc "Imports a song CSV file into an ActiveRecord table"
task :csv_model_import, [:filename, :model] => :environment do |task,args|
  lines = File.new(args[:filename]).readlines
  header = lines.shift.strip
  keys = header.split(',')
  lines.each do |line|
    params = {}
    values = line.strip.split(',')
    keys.each_with_index do |key,i|
      params[key] = values[i]
    end
    Module.const_get(args[:model]).create(params)
  end
  puts "Songs imported #{lines.count}"
end
