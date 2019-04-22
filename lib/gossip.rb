require 'pry'
require 'csv'

class Gossip 
	attr_reader :author, :content

	def initialize(author, content)
		@author = author
		@content = content
	end

	def save
		 CSV.open("./db/gossip.csv", "ab") do |csv|
    csv << [@author, @content]
  end
	end

	def self.all
		all_gossips = []
		CSV.read("./db/gossip.csv").each do |csv_line|
    all_gossips << Gossip.new(csv_line[0], csv_line[1])
  end
  return all_gossips
end

def self.find(id)
	data_base = CSV.read("./db/gossip.csv")
	return data_base[id]
end

def self.update(id, author, content)
	csv_files = CSV.read(".db/gossip.csv")
	csv_files.each_index do |index|
		if index == id.to_i
			csv_files[index][0] = author
			csv_files[index][1] = content
		end
	end 
	csv.open('./db/gossip.csv', 'wb') do |csv|
		csv_file.each do |row|
			csv << row
		end
	end
	puts id

end


end

