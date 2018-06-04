class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def explore
    @reviews = Review.where(:course_id => params[:course], :professor_id => params[:professor])
    respond_to do |format|
      format.html { @reviews }
      format.json { render :json => @reviews}
    end
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      course = @review.course
      redirect_to course_path(course)
    else
      Rails.logger.info("#{@review.errors.full_messages}")
      render 'new'
    end
  end

  private
    def review_params
      params.require(:review).permit(:rating, :comment, :user_id, :course_id, :professor_id)
    end
end
