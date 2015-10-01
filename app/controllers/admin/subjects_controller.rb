class Admin::SubjectsController < ApplicationController
  load_and_authorize_resource

  def new
  end

  def create
    if @subject.save
      flash[:success] = t "subject_created"
      redirect_to subjects_path
    else
      render :new
    end
  end

  def edit
    @subject = Subject.find_by params[:id]
  end

  def update
    @subject = Subject.find_by params[:id]
    if @subject.update_attributes(subject_params)
      flash[:success] = t "subject_updated"
      redirect_to subjects_path
    else
      render :edit
    end
  end

  private
  def subject_params
    params.require(:subject).permit(:title, :duration)
  end
end
