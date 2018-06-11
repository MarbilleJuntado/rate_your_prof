class CoursesController < ApplicationController
  before_action :search_course, only: [:show, :edit, :update, :destroy]

  @professors = Professor.all.order("created_at DESC")

  def index
    @courses = Course.all.order("created_at DESC")
    respond_to do |format|
      format.html { @courses }
      format.json { render :json => @courses }
    end
  end

  def show
    respond_to do |format|
      format.html { @course }
      format.json { render :json => @course }
    end
  end

  def new
    @course = current_user.courses.build
    @professors = Professor.all.map{ |c| [c.name, c.id] }
  end
  
  def create
    @course = current_user.courses.build(course_params)

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
    @course.destroy
    redirect_to root_path
  end

  private
    def course_params
      params.require(:course).permit(:name, :professor_ids => [])
    end

    def search_course
      @course = Course.find(params[:id])
    end
end
