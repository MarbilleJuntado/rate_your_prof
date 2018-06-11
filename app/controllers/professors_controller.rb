class ProfessorsController < ApplicationController
  before_action :search_professor, only: [:show, :edit, :update, :destroy]

  @courses = Course.all.order("created_at DESC")

  def index
    @professors = Professor.all.order("created_at DESC")
    respond_to do |format|
      format.html { @professors }
      format.json { render :json => @professors }
    end
  end

  def show
    respond_to do |format|
      format.html { @professor }
      format.json { render :json => @professor }
    end
  end

  def new
    @professor = current_user.professors.build
  end

  def create
    @professor = current_user.professors.build(professor_params)

    if @professor.save
      redirect_to professors_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @professor.update(professor_params)
      redirect_to professor_path(@professor)
    else
      render 'edit'
    end
  end

  def destroy
    @professor.destroy
    redirect_to professors_path
  end

  private
    def professor_params
      params.require(:professor).permit(:name, :course_ids => [])
    end

    def search_professor
      @professor = Professor.find(params[:id])
    end
end