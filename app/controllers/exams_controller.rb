class ExamsController < ApplicationController
  load_and_authorize_resource

  def create
    if @exam.save
      flash[:success] = t :exam_created
      redirect_to [@exam.subject, @exam]
    else
      flash[:danger] = t :exam_created_failed
      redirect_to subjects_path
    end
  end

  def show
  end

  def update
    @exam.update_attributes exam_params
    ResultMaker.perform_async @exam.id
    respond_to do |format|
      format.html {redirect_to [@exam.subject, @exam]}
      format.js
    end
  end

  private
  def exam_params
    params.require(:exam).permit :subject_id, :time, :status,
      results_attributes: [:id, :answer_id]
  end
end
