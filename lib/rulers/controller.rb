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
      filename = File.join "app", "views", "#{view_name}.html.slim"
      
      puts File.expand_path filename
      puts File.file? filename
      puts Slim::Template.new(filename).render(env: env)
      
      Slim::Template.new(filename).render(env: env)
    end
  end
end