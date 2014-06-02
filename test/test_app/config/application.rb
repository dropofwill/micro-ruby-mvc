require "rulers"

# Add app/controllers to load path
$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "app")

module TestApp
	class Application < Rulers::Application
	end
end