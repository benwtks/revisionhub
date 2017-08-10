class TopicsController < ApplicationController
  before_filter :authenticate_student!
  before_action :find_subject, only: [:edit, :update, :new, :destroy, :create]
  before_action :find_topic, only: [:edit, :update, :destroy]
  before_action :find_topic_tags, only: [:edit, :update, :create, :new]

  before_action only: [:update, :create, :destroy, :edit, :new] do |c|
    c.authenticate_subject_rights @subject
  end

  def edit
  end

  def update
   if @topic.update(topic_params)
      redirect_to @topic.subject, notice: "Topic successfully edited"
    else
      render 'edit'
    end
  end

  def new
    @topic = @subject.topics.build
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

  def find_topic_tags
    @topic_tags = current_student.topicTags
  end

  def topic_params
    params.require(:topic).permit(:name, :description, {topicTag_ids: []})
  end
end
