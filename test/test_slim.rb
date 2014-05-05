require_relative "test_helper"
require "slim"

class TestApp < Rulers::Application
end

class RulersAppTest < Test::Unit::TestCase
	include Rack::Test::Methods

	def test_template 
		slim_template = Slim::Template.new  { "p = 'This is a template ' + @whatever\n" }
		scope = Object.new
		scope.instance_variable_set :@whatever, 'cool'
		assert_equal "<p>This is a template cool</p>", slim_template.render(scope)
	end
end