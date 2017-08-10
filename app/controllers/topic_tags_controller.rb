class TopicTagsController < ApplicationController
  before_action :authenticate_student!

  def new
    @tag_colours = TagColour.all
    @topic_tag = TopicTag.new
  end

  def create
    @topic_tag = TopicTag.new(topic_tag_params)
    @topic_tag[:student_id] = current_student.id

    if @topic_tag.save
      redirect_to root_path, notice: "Topic tag successfully created"
    else
      render 'new'
    end
  end

  private

  def topic_tag_params
    params.require(:topic_tag).permit(:name, :tagColour_id)
  end
end
