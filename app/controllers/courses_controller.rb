class CoursesController < ApplicationController
  before_action :search_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all.order("created_at DESC")
    respond_to do |format|
      format.html { @courses }
      format.json { render :json => @courses }
    end
  end

  def show
  end

  def new
    @course = Course.new
  end
  
  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to course_path(@course)
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
    def course_params
      params.require(:course).permit(:name)
    end

    def search_course
      @course = Course.find(params[:id])
    end
end
