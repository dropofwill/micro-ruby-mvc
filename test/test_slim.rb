require_relative "helper_for_test"
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

	def test_implementation 
		slim_template = Slim::Template.new("test.html.slim")
		assert_equal "<p>There is nothing either good or bad</p>", slim_template.render
	end
end