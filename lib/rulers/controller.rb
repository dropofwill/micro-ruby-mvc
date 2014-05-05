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
      slim = Tilt.new "app/views/#{view_name}.html.slim"
      slim.render(locals.merge env: env)
    end
  end
end