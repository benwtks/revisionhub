class TopicTagsController < TagsController
  def new
    @topic_tag = current_student.topicTags.build
  end

  def create
    @topic_tag = current_student.topicTags.build(tag_params(:topic_tag))
    redirect_after_submission(@topic_tag, "Topic tag successfully created")
  end
end
