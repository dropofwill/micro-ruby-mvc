require_relative "test_helper"

class RulersAppTest < Test::Unit::TestCase
	include Rack::Test::Methods

	def app
		require_relative "test_app/config/application"
		TestApp::Application.new
	end

	def test_request
		get "test/render"
		assert last_response.ok?
	end

	def test_array_sum
		assert_equal( 6, [1,2,2].sum(1))
	end

	def test_to_underscore
		assert_equal("app/controller", Rulers.to_underscore("App::Controller"))
		assert_equal("app_controller", Rulers.to_underscore("APPController"))
		assert_equal("app_controller", Rulers.to_underscore("app-controller"))
	end

	def test_to_camel
		assert_equal("AppController", Rulers.to_camel("app_controller"))
	end
end