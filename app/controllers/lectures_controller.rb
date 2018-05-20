class LecturesController < InheritedResources::Base
  #   before_action :authenticate_user!
  before_action :set_lecture, only: [:show, :edit, :update, :destroy]

  def index
    @lectures = Lecture.all
  end
 

  def new
    @lecture = Lecture.new
  end

  def spam
    @lecture = Lecture.find(params[:id])
    check = Flag.where(:user_id => current_user.id,:lecture_id => @lecture.id).first
    if  Flag.exists?(user_id: current_user.id,lecture_id: @lecture.id)
      if check.action == true
        check.update(:action => 'false')
        respond_to do |format|
          format.html { redirect_to lecture_url, notice: 'Lecture was successfully unspammed.' }
          format.json { head :no_content }
        end
      else
        check.update(:action => 'true')
        @user=@lecture.user
       
        respond_to do |format|
          format.html { redirect_to lecture_url, alert: 'Lecture was successfully spammed.' }
          format.json { head :no_content }
        end
      end
    else
      @user=@lecture.user
      flag = Flag.new(:action => true,:user_id => current_user.id,:lecture_id => @lecture.id)
      flag.save
     
      respond_to do |format|
        format.html { redirect_to lecture_url, alert: 'Lecture was successfully spammed.' }
        format.json { head :no_content }
      end
    end
  end

  def upvote 
    @lecture = Lecture.find(params[:id])
    @lecture.upvote_by current_user
    redirect_to :lecture
  end

  def downvote
    @lecture = Lecture.find(params[:id])
    @lecture.downvote_by current_user
    redirect_to :lecture
  end

  def destroy
    @lecture.destroy
    respond_to do |format|
      format.html { redirect_to lectures_url, notice: 'Lecture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

 
  def comment_params
    params.require(:comment).permit(:comment, :lecture_id, :user_id)
  end


    def lecture_params
      params.require(:lecture).permit(:content, :user_id, :course_id)
    end
    def set_lecture
      @lecture = Lecture.find_by_id(params[:id])
    end

end

