require "multi_json"

module Rulers
	module Model
		class FileModel

			class << self
				def hello
					puts "hello"
				end

				def all feature = "a_feature"
					files = Dir["db/#{[feature]}_data/*.json"]
					files.map { |f| FileModel.new f }
				end
			end


			def initialize filename
				puts "testing this works"
				@filename = filename

				base = File.split(filename)[-1]
				@id = File.basename(base, ".json").to_i

				object = File.read filename
				@hash = MultiJson.load object
			end

			def [] name
				@hash[name.to_s]
			end

			def []= name, value
				@hadh[name.to_s] = value
			end

			# def self.find id, feature = "a_feature"
			# 	puts "db/#{feature}_data/#{id}.json"
			# 	FileModel.new("db/#{feature}_data/#{id}.json")
			# rescue
			# 	return nil
			# end

		end
	end
end