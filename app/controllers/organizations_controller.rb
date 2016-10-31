class OrganizationsController < ApplicationController
	def index
		@user = User.find(session[:id])
		# @secret = Secret.select(:content).where(user_id:'2')
		@organization = Organization.joins(:user)
		# @like = Post.find(params[:id]).likes.count
	end

	def create
		@organization = Organization.create(name:params['name'], description:params['description'], user_id:session[:id])
		redirect_to "/groups"
	end

	def destroy
		@organization = Organization.find(params[:id]).destroy
		redirect_to "/groups"
	end

	def show 
		@organization = Organization.find(params[:id])
		@memberships = Membership.where(organization_id: params[:id])
		@user = User.find(session[:id]).memberships.where(organization_id: params[:id])

	end

end
