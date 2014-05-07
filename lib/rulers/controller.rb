require "slim"

module Rulers
  class Controller
    def initialize env
      @env = env
    end

    def env
      @env
    end

    def render view_name, locals = {}
      filename = File.join "app", "#{get_module_name}", "views", "#{view_name}.html.slim"

      puts filename
      
      Slim::Template.new(filename).render(self, locals.merge(env: @env))
    end

    def get_module_name
      class_ref = self.class
      class_ref = class_ref.to_s.gsub  /Controller$/, ""
      Rulers.to_underscore class_ref
    end
  end
end