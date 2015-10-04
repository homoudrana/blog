class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.save
    if @comment.save
      redirect_to article_path (@article)
    else
        render 'new'
      end
  end

  def destroy
  @article=Article.find(params[:article_id])
  @comment=@article.comments.find(params[:id])
  @comment.destroy
  redirect_to article_path(@article)
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body ,:article)
  end
end
