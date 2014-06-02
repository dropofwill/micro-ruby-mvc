require "multi_json"

module Rulers
	module Model
		class FileModel

			# Class Methods
			class << self
				def all caller
					feature = caller.get_feature_name
					files = Dir["db/#{feature}_data/*.json"]
					files.map do |file|
						FileModel.new file
					end
				end

				def find id, caller
					feature = caller.get_feature_name
					file = get_filename_by_id id, feature
					FileModel.new file
				rescue
					return nil
				end

				def create attrs, caller
					feature = caller.get_feature_name
					filename = get_next_filename(feature)
					doc = MultiJson.dump attrs, pretty: true

					File.open(filename, "w") do |file|
						file.write doc
					end

					FileModel.new filename
				end

				def save id, attrs, caller
					feature = caller.get_feature_name
				end

				private
				def get_next_filename feature
					files = Dir["db/#{feature}_data/*.json"]
					names = files.map { |f| f.split("/")[-1] }
					highest = names.map { |b| b.to_i }.max
					id = highest + 1
					return "db/#{feature}_data/#{id}.json"
				end

				def get_filename_by_id id, feature
					return "db/#{feature}_data/#{id}.json"
				end
			end



			# Instance Methods
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

		end
	end
end