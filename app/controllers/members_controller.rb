class MembersController < ApplicationController
	def new
		@member = Member.new
	end

	def show
		@member = Member.find(params[:id])
	end

	def create
		@member = Member.new(params[:member])
		if @member.save
			flash[:success] = "Welcome to the Membership Management App!"
			redirect_to @member
		else
			render 'new'
		end
	end
end
