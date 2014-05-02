require_relative "test_helper"

class TestApp < Rulers::Application
end

class RulersAppTest < Test::Unit::TestCase
	include Rack::Test::Methods

	def app
		TestApp.new
	end

	def test_request
		get "/"

		assert last_response.ok?
		assert last_response.body.include?('Hello')
	end

	def test_array_support

	end

	def test_to_underscore
		assert_equal "App/Controller", "App::Controller".to_underscore
	end
end