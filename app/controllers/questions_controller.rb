class QuestionsController < ApplicationController
  load_and_authorize_resource

  def index
    @q = Question.ransack(params[:q])
    @questions = @q.result.suggested_questions
                .order(created_at: :desc)
                .paginate page: params[:page]
    @question = Question.new
    @subjects = Subject.all
  end

  def create
    @question = Question.new question_params
    @subjects = Subject.all

    respond_to do |format|
      @question.save
      format.js
    end
  end

  private
  def question_params
    params.require(:question).permit(:content, :subject_id, :status,
      answers_attributes: [:id, :content, :correct, :_destroy])
  end
end
