class RecordsController < ApplicationController
  def new
    @record = Record.new
  end

  def create
    record = Record.new(post_params)
    record.save
    redirect_to '/top'
  end

  def index
    @posts = Post.all
  end

    private
    def record_params
      params.require(:record).permit(:event_name, :prefecture_id, :content, :star_rating, event_type_ids: {})
    end
end
