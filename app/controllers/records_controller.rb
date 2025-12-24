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
    @records = Record.published.page(params[:page]).reverse_order
    @records = @records.where('ecent_name LIKE?', "%#{params[:search]}%") if params[:search].present?
  end

  def show
    @record = Record.find(params[:id])
    @comment = Comment.new
    @comments = @record.comments.page(params[:page]).per(7).reverse_order
    #閲覧数カウント
    @record.increment!(:view_count)
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
       redirect_to record_path(@record.id)
    else
       render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    record = Record.find(params[:id])
    @record.destroy
    redirect_to records_path
  end

  def confirm
    @records = current_user.records.draft.page(params[:page]).reverse_order
  end

    private
    def record_params
      params.require(:record)
            .permit(:user_id,:event_name, :prefecture_id, :content, :star_rating, :photo, :status, event_type_ids: [])
            .tap do |whitelisted|
               whitelisted[:event_type_ids]&.reject!(&:blank?)
            end
    end
end
