require "rulers/version"
require "rulers/RulersSupport"

module Rulers
  class Application
    def call(env)
      [200, {'Content-Type' => 'text/html'}, ["Hello foods!"]]
    end
  end
end
