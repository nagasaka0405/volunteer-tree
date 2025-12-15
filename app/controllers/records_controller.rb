class RecordsController < ApplicationController
  def new
    @record = Record.new
  end

  def create
    @record = current_user.records.build(record_params)
    if @record.save
      redirect_to record_path(@record), notice: "記録を保存しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @records = Record.page(params[:page]).reverse_order
    @records = @records.where('location LIKE?', "%#{params[:search]}%") if params[:search].present?
  end

  def show
    @record = Record.find(params[:id])
    @comment = Comment.new
    @comments = @record.comments.page(params[:page]).per(7).reverse_order
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
       redirect_to record_path(record.id)
    else
       render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    record = Record.find(params[:id])
    record.destroy
    redirect_to records_path
  end

    private
    def record_params
      params.require(:record)
            .permit(:user_id,:event_name, :prefecture_id, :content, :star_rating, :photo, event_type_ids: [])
            .tap do |whitelisted|
               whitelisted[:event_type_ids]&.reject!(&:blank?)
            end
    end
end
