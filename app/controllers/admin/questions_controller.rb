class Admin::QuestionsController < ApplicationController
  load_and_authorize_resource

  def new
    @subjects = Subject.all
    @question.answers.new
  end

  def create
    if @question.save
      flash[:success] = t :question_created
      redirect_to questions_path
    else
      @subjects = Subject.all
      render :new
    end
  end

  private
  def question_params
    params.require(:question).permit(:content, :subject_id, :status,
      answers_attributes: [:id, :content, :correct, :_destroy])
  end
end
