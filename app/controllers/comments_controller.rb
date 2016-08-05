class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_comment, except: [:create]

  def create
    find_story
    # => create comment record based on params
    @comment = @story.comments.build comment_params
    @comment.user_id = current_user.id
    @comment.save
    flash[:success] = "your comment successfully posted."
    redirect_to story_path(@story) #we already called the find_story
  end

  # => necessary process already done in "before_action"
  def edit
  end

  def update
    if @comment.update_attributes(comment_params)
      flash.now[:success] = "your comment has been updated."
      redirect_to story_path(:find_story)
    else
      redirect 'edit'
    end
  end

  def destroy
    if @comment.destroy
      flash.now[:success] = "your comment has been deleted."
      redirect_to story_path(:find_story)
    else
      flash.now[:danger] = "failed to delete your comment"
      render template: 'stories/show'
    end
  end

  private
    def find_comment
      @comment = Comment.find_by_id(params[:id])
    end

    def find_story
      @story = Story.find_by_id(params[:story_id])
    end

    def comment_params
      params[:comment].permit(:content)
    end
end
