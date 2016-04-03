class TopicsController < ApplicationController
  before_action :find_topic, only: [:show, :edit, :update, :destroy]

  def edit
  end

  def update
    if @topic.update(subject_params)
      redirect_to @topic.subject
    else
      render 'new'
    end
  end

  def new
    @topic = current_user.topics.build
  end

  def create
    @topic = current_user.topics.build(topic_params)

    if @topic.save
      redirect_to @topic.subject
    else
      render 'new'
    end
  end

  def destroy
    @topic.destroy
    redirect_to root_path
  end

  private

  def find_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:name, :description)
  end
end
