module Rulers
	class Application
		def get_controller_and_action env
			_, controller, action, after = env["PATH_INFO"].split '/', 4

			controller = Rulers.to_camel controller		# "has" -> "Has"
			controller += "Controller"								# "Has" -> "HasController"

			[Object.const_get(controller), action]
		end
	end
end