require_relative "rulers/version"
require_relative "rulers/routing"
require_relative "rulers/rulers_support"
require_relative "rulers/dependencies"
require_relative "rulers/controller"
require_relative "rulers/file_model"

module Rulers
  class Application
    def call env
      class_ref, action = get_controller_and_action env
      controller = class_ref.new env
      text = controller.send action

      [200, {'Content-Type' => 'text/html'}, [text]]
    end
  end
end