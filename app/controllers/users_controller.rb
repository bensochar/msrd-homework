class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  inertia_share flash: -> { flash.to_hash }

  # GET /users
  def index
    @users = User.all
    render inertia: 'User/Index', props: {
      users: @users.map do |user|
        serialize_user(user)
      end
    }
  end

  # GET /users/1
  def show
    render inertia: 'User/Show', props: {
      user: serialize_user(@user)
    }
  end

  # GET /users/new
  def new
    session.delete(:user_step)

    session[:user_params] ||= {}
    @user = User.new(session[:user_params])
    @user.current_step = session[:user_step]
    render inertia: 'User/New', props: {
      user: serialize_user(@user.attributes.merge(current_step: @user.current_step))
    }
  end

  # GET /users/1/edit
  def edit
    render inertia: 'User/Edit', props: {
      user: serialize_user(@user)
    }
  end

  # POST /users
  def create
    session[:user_params].deep_merge!(user_params) if user_params
    @user = User.new(session[:user_params])
    @user.current_step = session[:user_step]
    if @user.valid?
      if @user.last_step?
        if @user.all_valid?
          if @user.save
            session.delete(:user_step)
            session.delete(:user_params)
            redirect_to @user, notice: "User was successfully created."

          else
            redirect_to new_user_url, inertia: { errors: @user.errors }
          end
        end
      else
        @user.next_step
        render inertia: 'User/New', props: {
          user: serialize_user(@user.attributes.merge(current_step: @user.current_step))
        }
      end
      session[:user_step] = @user.current_step
    else
      redirect_to new_user_url, inertia: { errors: @user.errors }
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User was successfully updated."
    else
      redirect_to edit_user_url(@user), inertia: { errors: @user.errors }
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy!
    redirect_to users_url, notice: "User was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:email, :weight, :birthdate)
  end

  def serialize_user(user)
    user.as_json(only: [
      :id, :email, :weight, :birthdate, :current_step
    ]) 
  end
end
