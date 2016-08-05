class StoriesController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :find_story, only: [:show, :edit, :update, :delete, :destroy]

  def index
    @stories = Story.all.order("created_at DESC")
  end

  def show
  end

  def new
    # => mind the plural in current_user.stories
    # => this is to "1..*" relationship of users => stories table
    @story = current_user.stories.build
  end

  def create
    @story = current_user.stories.build(story_params)

    if @story.save
      flash[:success] = "Yeay, published #{@story.title} !!"
      redirect_to @story
    else
      #form error message is handled by Rails and displayed on the form
      render 'new'
    end
  end

  def edit
  end

  def update
    if @story.update_attributes(story_params)
      flash[:success] = "Yeay, updated #{@story.title} !!"
      redirect_to @story
    else
      render 'edit'
    end
  end

  def comments
    @users = User.all
    @story = :find_story
  end

  def delete
  end

  def destroy
    if @story.destroy
      flash[:success] = "#{@story.title} is deleted!!"
      redirect_to root_path
    end
  end

  private
    def story_params
      params.require(:story).permit(:title, :subtitle, :content, :tags)
    end

    def find_story
      @story = Story.find_by_id(params[:id])

      if @story.nil?
        flash[:warning] = "the story you are looking for is not found."
        redirect_to 'index'
      end
    end
end
