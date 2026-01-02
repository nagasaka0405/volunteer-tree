class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(5).reverse_order
  end

  def show
    @user = User.find(params[:id])
    # 相互フォロー判定
    @is_mutual_follow = current_user.following_users.include?(@user) && @user.following_users.include?(current_user)
    #DM機能は相互フォローのときだけ許可
    if @is_mutual_follow
      #既存のroomを探す
      @room = Room.joins(:entries)
                  .where(entries: { user_id: current_user.id })
                  .joins(:entries)
                  .where(entries: { user_id: @user.id })
                  .first
      #なければ作る
      if @room.nil?
        @room = Room.create!
        Entry.create!(room_id: @room.id, user_id: current_user.id)
        Entry.create!(room_id: @room.id, user_id: @user.id)
      end
 
      @message = Message.new
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
