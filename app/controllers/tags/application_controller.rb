class Tags::ApplicationController < ApplicationController
  layout "form", only: [:edit, :new]

  before_action :authenticate_student!
  before_action :find_tag_colours, only: :new

  protected

  def find_tag_colours
    @tag_colours = ["Blue", "Green", "Purple", "Red", "Yellow", "Orange"]
  end

  def tag_params(tagType)
    params.require(tagType).permit(:name, :colour)
  end

  def redirect_after_submission(tagVariable, successfulMessage)
    if tagVariable.save
      redirect_to root_path, notice: successfulMessage
    else
      render 'new'
    end
  end
end
