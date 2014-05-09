require "multi_json"

module Rulers
	module Model
		class FileModel
			def initialize filename
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

			def self.find id, feature = "a_feature"
				FileModel.new("db/#{feature}_data/#{id}.json")
			rescue
				return nil
			end
		end

	end
end