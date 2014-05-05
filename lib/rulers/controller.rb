require "slim"
require "tilt"

module Rulers
  class Controller
    def initialize env
      @env = env
    end

    def env
      @env
    end

    def render view_name, locals = {}
      tilt = Slim::Template.new "app/views/#{view_name}.html.slim"
      tilt.render(locals.merge env: env)
    end
  end
end