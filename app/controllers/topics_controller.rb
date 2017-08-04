class TopicsController < ApplicationController
  before_action :find_subject, only: [:edit, :update, :new, :destroy, :create]
  before_action :find_topic, only: [:edit, :update, :destroy]

  def edit
    if !student_signed_in?
      redirect_to new_student_session_path, alert: "Please login to edit topics"
    elsif @subject.student != current_student
      redirect_to root_path, alert: "Subject doesn't belong to you"
    elsif @subject.student == current_student
      @topic_tags = current_student.topicTags
    end
  end

  def update
   if @topic.update(topic_params)
      redirect_to @topic.subject, notice: "Topic successfully edited"
    else
      render 'edit'
    end
  end

  def new
    if !student_signed_in?
      redirect_to new_student_session_path, alert: "Please login to add topics"
    elsif @subject.student == current_student
      @topic = @subject.topics.build
      @topic_tags = current_student.topicTags
    else
      redirect_to root_path, alert: "Subject doesn't belong to you"
    end
  end

  def create
    @topic = @subject.topics.build(topic_params)
    @topic[:student_id] = current_student.id

    if @topic.save
      redirect_to @topic.subject, notice: "Topic successfully created"
    else
      render 'new'
    end
  end

  def destroy
    @topic.destroy
    redirect_to @subject, notice: "Topic successfully deleted"
  end

  private

  def find_subject
    @subject = Subject.find(params[:subject_id])
  end

  def find_topic
    @topic = @subject.topics.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:name, :description, {topicTag_ids: []})
  end
end
