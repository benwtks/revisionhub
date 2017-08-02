class TopicTagsController < ApplicationController
  def new
    if student_signed_in?
      @topic_tag = TopicTag.new
    else
      redirect_to new_topic_tag_path, alert: "Please login to add topic tags"
    end
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
    params.require(:topic_tag).permit(:name)
  end
end
