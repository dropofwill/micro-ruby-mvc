require "multi_json"

module Rulers
	module Model
		class FileModel

			# Class Methods
			class << self
				def all caller
					feature = caller.get_feature_name

					files = Dir["db/#{feature}_data/*.json"]
					files.map { |f| FileModel.new f }
				end

				def find id, caller
					feature = caller.get_feature_name

					file = "db/#{feature}_data/#{id}.json"
					FileModel.new(file)
				rescue
					return nil
				end

				def create attrs, caller
					feature = caller.get_feature_name
					filename = get_next_filename(feature)

					hash = {}
					attrs.each do |k,v|
						hash[k] = v
					end

					doc = MultiJson.dump attrs, pretty: true

					File.open(filename, "w") do |f|
						f.write doc
					end

					FileModel.new filename
				end

				private

				def get_next_filename feature
					files = Dir["db/#{feature}_data/*.json"]
					names = files.map { |f| f.split("/")[-1] }
					highest = names.map { |b| b.to_i }.max
					id = highest + 1

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