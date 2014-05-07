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
      filename = File.join "app", "view", "#{view_name}.html.slim"
      template = File.read filename

      Slim::Template.new(template).render(locals.merge env: env)

      # Slim::Template.new("app/views/#{view_name}.html.slim").render(locals.merge env: env)
    end
  end
end