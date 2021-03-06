class PostsController < ApplicationController
    
    before_action :require_sign_in, except: :show
    
    before_action :mod_block, only: [:create, :destroy]
    
    before_action :authorize_user, except: [:index, :show]
    
  
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
   
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end
  
  def create
   
     @topic = Topic.find(params[:topic_id])
     @post = @topic.posts.build(post_params)
     @post.user = current_user

     if @post.save
       flash[:notice] = "Post was saved."
       redirect_to [@topic, @post]
     else
       flash.now[:alert] = "There was an error saving the post. Please try again."
       render :new
     end
  end

  def edit
    @post = Post.find(params[:id])
  end
  
    def update
     @post = Post.find(params[:id])
     @post.assign_attributes(post_params)
 
     if @post.save
       flash[:notice] = "Post was updated."
       redirect_to [@post.topic, @post]
     else
       flash.now[:alert] = "There was an error saving the post. Please try again."
       render :edit
     end
    end
    
    def destroy
        
     @post = Post.find(params[:id])
 

     if @post.destroy
       flash[:notice] = "\"#{@post.title}\" was deleted successfully."
       redirect_to @post.topic
     else
       flash.now[:alert] = "There was an error deleting the post."
       render :show
     end
    end
    
  private
   def post_params
     params.require(:post).permit(:title, :body)
   end
   
    def authorize_user
     post = Post.find(params[:id])

     unless current_user == post.user || current_user.admin?
       flash[:alert] = " You do not have permission to do that."
       redirect_to [post.topic, post]
     end
    end
    

    def mod_block
      if current_user.moderator?
        flash[:alert] = " You do not have permission to do that."
        redirect_to [post.topic, post]
      end
    end
end