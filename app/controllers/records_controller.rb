class RecordsController < ApplicationController
  def new
    @record = Record.new
  end

  def create
    record = Record.new(post_params)
    record.save
    redirect_to record_path(record.id)
  end

  def index
    @records = Record.all
  end

  def show
    @record = Record.find(params[:id])
  end

    private
    def record_params
      params.require(:record).permit(:event_name, :prefecture_id, :content, :star_rating, event_type_ids: {})
    end
end
