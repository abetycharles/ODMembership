class SessionsController < ApplicationController

	def new
	end

	def create
		member = Member.find_by_email(params[:sessions][:email])
		if member && member.authenticate(params[:sessions][:password])
			flash[:success] = "Welcome to the Membership App!"
			redirect_to member
		else
			render 'new'
		end
	end

	def destroy
	end
end
