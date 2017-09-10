class TopicTagsController < ApplicationController
  before_action :authenticate_student!
  before_action :find_tag_colours, only: :new

  def new
    @topic_tag = current_student.topicTags.build
  end

  def create
    @topic_tag = current_student.topicTags.build(topic_tag_params)

    if @topic_tag.save
      redirect_to root_path, notice: "Topic tag successfully created"
    else
      render 'new'
    end
  end

  private

  def topic_tag_params
    params.require(:topic_tag).permit(:name, :colour)
  end
end
