class MembershipsController < ApplicationController
	def create
		@memberships = Membership.create(user_id:session[:id], organization_id:params[:id])
		
		# puts "dog"
		# puts session[:id]
		# puts params[:id]
		# puts "dog"
		redirect_to :back
	end

	def destroy
		
		# @memberships = Membership.where("user_id = session[:id] AND organization_id = params[:id]").destroy
		# @memberships = Membership.where(organization_id:params[:id]).destroy
		@memberships = Membership.where(organization_id:params[:id]).destroy_all
		puts "dog"
		puts @memberships 
		puts params[:id]
		puts session[:id]
		puts "dog"
		redirect_to :back
	end
end
