class CoursesController < InheritedResources::Base
  # before_action :authenticate_user!
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  def index
    @courses = Course.all
  end

  def new
    @course =  Course.new
  end

  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'course was successfully created' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

private

  def set_course
    @course = Course.find(params[:id])
  end

    def course_params
      params.require(:course).permit(:user_id, :title)
    end
end

