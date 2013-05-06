class PostsController < ApplicationController
	
	def create
		post = Post.create!(page: Page.find_by_id(params[:post][:page_id]), published: false)
		redirect_to "/editor#{params[:post][:url]}?editing_post_id=#{post.id}" and return
	end

	def destroy
		post = Post.find(params[:id]).destroy
		render text: ''
	end

end