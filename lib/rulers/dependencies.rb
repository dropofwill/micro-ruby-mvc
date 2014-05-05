class Object
	def self.const_missing const
		return nil unless !@calling_const_missing

		@calling_const_missing = true
		require Rulers.to_underscore const.to_s
		class_ref = Object.const_get const
		@calling_const_missing = false

		return const_get(const)
	end
end