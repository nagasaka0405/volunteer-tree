class RecordsController < ApplicationController
  def new
    @record = Record.new
  end

  def create
    record = Record.new(post_params)
    record.save
    redirect_to '/top'
  end
  private
  def record_params
    params.require(:record).permit(:location, :text)
  end
end
