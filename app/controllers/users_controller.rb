class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_user!
  before_action :set_roles, only: [:create, :update]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, flash: {success: 'User was successfully created.'} }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    clean_passwords
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, flash: {success: 'User was successfully updated.'} }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation,
                                    :street_address1, :street_address2, :city, :state, :zip_code, :role)
    end

    def clean_passwords
      params[:user].except!(:password, :password_confirmation)
    end

    def set_roles
      if params[:role].present?
        @user.add_role params[:role].to_sym
      elsif @user.has_role? :admin
        @user.remove_role :admin
      end
    end
end
