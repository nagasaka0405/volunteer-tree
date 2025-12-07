class RecordsController < ApplicationController
  def new
    @record = Record.new
  end

  def create
    record = current_user.records.build(record_params)
    if record.save
      redirect_to record_path(record), notice: "記録を保存しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @records = Record.all
  end

  def show
    @record = Record.find(params[:id])
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    record = Record.find(params[:id])
    record.update(record_params)
    redirect_to record_path(record.id)
  end
  
  def destroy
    record = Record.find(params[:id])
    record.destroy
    redirect_to records_path
  end

    private
    def record_params
      params.require(:record)
            .permit(:event_name, :prefecture_id, :content, :star_rating, :photo, event_type_ids: [])
            .tap do |whitelisted|
               whitelisted[:event_type_ids]&.reject!(&:blank?)
            end
    end
end
