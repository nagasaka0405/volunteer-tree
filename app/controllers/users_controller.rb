class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(5).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @current_entry = Entry.where(user_id: current_user.id)
    @another_entry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @current_entry.each do |current|
        @another_entry.each do |another|
          if current.room_id == another.room_id
            @is_room = true
            @room_id = current.room_id
          end
        end
      end
      unless @is_room
        @room = Room.new
        @entry = Entry.new
      end
    end
    @records = @user.records.page(params[:page]).per(8).reverse_order
    @following_users = @user.following_users
    @follower_users = @user.follower_users
  end

  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = user.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
   end

  def follows
    user = User.find(params[:id])
    @users = user.following_users.page(params[:page]).per(3).reverse_order
  end
  
   def followers
    user = User.find(params[:id])
    @users = user.follower_users.page(params[:page]).per(3).reverse_order
  end



   private
   def user_params
     params.require(:user).permit(:name, :email, :profile, :profile, :profile_image)
   end
  end
