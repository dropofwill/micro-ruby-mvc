# To underscore method same as in ActiveSupport

module Rulers
	def self.to_underscore string
		string = string.to_s
		
		string.
			# App::Controller -> App/Controller
			gsub( /::/, '/' ).
			# APPController -> APP_controller
			gsub( /([A-Z]+)([A-Z][a-z])/, '\1_\2' ).
			# app2Controller -> app2_Controller
			gsub( /([a-z\d])([A-Z])/, '\1_\2' ).
			# app-controller -> app_controller
			tr( "-", '_' ).
			# apP_coTroller -> app_controller
			downcase
	end

	def self.to_class string
		string.split('_').map {|token| token.slice(0).upcase + token.slice(1..-1) }.join
	end
end