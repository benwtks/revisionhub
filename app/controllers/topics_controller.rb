class TopicsController < ApplicationController
  before_action :find_subject, only: [:edit, :update, :new, :destroy, :create]
  before_action :find_topic, only: [:edit, :update, :destroy]

  def edit
  end

  def update
   if @topic.update(topic_params)
      redirect_to @topic.subject, notice: "Topic successfully edited"
    else
      render 'new'
    end
  end

  def new
    @topic = @subject.topics.build
  end

  def create
    @topic = @subject.topics.build(topic_params)

    if @topic.save
      redirect_to @topic.subject, notice: "Topic successfully created"
    else
      render 'new'
    end
  end

  def destroy
    @topic.destroy
    redirect_to root_path, notice: "Topic successfully deleted"
  end

  private

  def find_subject
    @subject = current_student.subjects.find(params[:subject_id])
  end

  def find_topic
    @topic = @subject.topics.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:name, :description)
  end
end
