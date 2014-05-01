module Rulers
	class Application
		def get_controller_and_action env
			_, controller, action, after = env.split '/', 4

			controller = controller.capitalize	# "has" -> "Has"
			controller += "Controller"					# "Has" -> "HasController"

			[Object.const_get(controller), action]
		end
	end
end