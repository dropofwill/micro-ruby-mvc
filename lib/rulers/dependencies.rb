class Object
	def self.const_missing const

		if const.to_s.end_with? "Controller"
			return nil unless !@calling_const_missing

			@calling_const_missing = true

			path = 	"#{Rulers.to_underscore(const.to_s.gsub(/Controller$/, ""))}" <<
							"/" <<
							"#{Rulers.to_underscore const.to_s}"
			require path
			class_ref = Object.const_get const

			@calling_const_missing = false

			return class_ref
		else
			super
		end
	end
end