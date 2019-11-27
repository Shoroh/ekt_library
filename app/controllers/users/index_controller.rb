class Users::IndexController < ApplicationController
	before_action :authenticate_user!

	def index; end

	def user
		@user = current_user
	end
end
