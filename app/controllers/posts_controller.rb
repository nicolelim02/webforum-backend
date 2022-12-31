class PostsController < ApplicationController
    def index
        @posts = Post.all
        render json: @posts
    end
    
    def create
        @post = Post.new(post_params)

        if @post.valid?
            @post.save
            render json: @post
        else
            render json: { error: "Post could not be created, please try again." }
        end
    end

    def show
        @post = Post.find(params[:id])

        if @post
            render json: @post
        else 
            render json: { error: "Post could not be found, please try again," }
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
    end

    private

    def post_params
        params.require(:post).permit(:user_id, :title, :content, topics: [])
    end
end
