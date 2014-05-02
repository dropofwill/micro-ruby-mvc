class Array
	# Adds all the items of an array together
	# Plus an initial value (default 0)
	def sum first_val=0
		inject first_val, &:+
	end
end