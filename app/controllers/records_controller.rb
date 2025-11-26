class RecordsController < ApplicationController
  def new
    @record = Record.new
  end
end
