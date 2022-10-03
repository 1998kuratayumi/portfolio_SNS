class PostsController < ApplicationController
  def new
    @post = Post.new
    @tag_list=Tag.all
  end

  def create
    # パラメーターを受け取り保存準備
    @post = Post.new(post_params)
    @post.user_id = current_user.id
   
    # Postを保存
    if @post.save
      # タグの保存
      @post.save_tags(params[:post][:tag])
      # 成功したらトップページへリダイレクト
      redirect_to root_path
    else
      # 失敗した場合は、newへ戻る
      render :new
    end
end
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @post_tags = @post.tags
  end
  
  def edit 
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end
  
  private
  def post_params
    params.require(:post).permit(:image, :text)
  end
end
