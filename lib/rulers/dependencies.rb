class Object
	def self.const_missing const
		return nil unless !@calling_const_missing

		begin
			@calling_const_missing = true
			path = "#{const.to_s.gsub(/Controller$/, "").downcase}/#{Rulers.to_underscore const.to_s}"
			require path
			class_ref = Object.const_get const
		rescue
			super
		else
			@calling_const_missing = false
			return const_get(const)
		ensure
			@calling_const_missing = false
		end
	end
end