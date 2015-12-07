    class CommentsController < ApplicationController
      before_action :logged_in_user, only: [:create, :destroy]

      def create
        secure_post = params.require(:comment).permit(:content)
        @comment = current_user.comments.build(secure_post) 
        if @comment.save
          flash[:success] = "Comment created!"
          redirect_to root_url
        else
          @feed_items = []  
          render 'static_pages/home'
        end      	
      end

      def destroy
            @comment.destroy
            redirect_to root_url
      end
      private
        def correct_user
              @comment = current_user.comments.find_by(id: params[:id])
              redirect_to root_url if @comment.nil?
        end
    end