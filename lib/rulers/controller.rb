require "slim"
# require "tilt"

module Rulers
  class Controller
    def initialize env
      @env = env
    end

    def env
      @env
    end

    def render view_name, locals = {}
      filename = File.join "app", "views", "#{view_name}.html.slim"
      Slim::Template.new(filename).render(self, locals.merge(env: @env))
    end
  end
end