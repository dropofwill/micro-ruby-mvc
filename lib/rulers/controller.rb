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
      file_name = File.join "app", "views", "#{view_name}.html.slim"
      puts file_name
      template = File.read file_name
      slim = Slim::Template.new template
      # slim.render locals.merge env: env
    end
  end
end