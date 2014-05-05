require_relative "test_helper"

class TestApp < Rulers::Application
end

class RulersAppTest < Test::Unit::TestCase
	include Rack::Test::Methods

	def app
		TestApp.new
	end

	def test_request
		# assert last_response.ok?
	end

	def test_array_sum
		assert_equal( 6, [1,2,2].sum(1))
	end

	def test_to_underscore
		assert_equal("app/controller", Rulers.to_underscore("App::Controller"))
		assert_equal("app_controller", Rulers.to_underscore("APPController"))
		assert_equal("app_controller", Rulers.to_underscore("app-controller"))
	end

	def test_to_class
		assert_equal("AppController", Rulers.to_class("app_controller"))
	end
end