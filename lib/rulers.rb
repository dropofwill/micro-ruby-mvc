require "rulers/version"
require "rulers/RulersSupport/RulersSupport"

module Rulers
  class Application
    def call env
      class_ref, action = get_controller_and_action env
      controller = class_ref.new env
      text = controller.send action

      [200, {'Content-Type' => 'text/html'}, ["Hello foods!"]]
    end
  end

  class Controller
    def initialize env
      @env = env
    end

    def env
      @env
    end
  end
end