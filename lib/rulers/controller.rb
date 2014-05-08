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
      Slim::Template.new(filename).render(self, locals.merge(get_ivars_hash))
    end

    private

    def get_module_name
      class_ref = self.class
      class_ref = class_ref.to_s.gsub(/Controller$/, "")
      Rulers.to_underscore class_ref
    end

    def get_ivars_hash
      ivars_hash = {}
      ivars = instance_variables
      
      ivars.each do |name|
        # Remove the @ from the instance variable, so it can be used as a key
        ivars_hash[name[1..-1]] = instance_variable_get name
      end
      
      ivars_hash
    end

  end
end