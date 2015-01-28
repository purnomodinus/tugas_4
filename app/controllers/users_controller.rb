class UsersController < ApplicationController
  def index
    @users=User.all
  end

  def new
    @user=User.new
  end

  def edit
    @user=User.find_by_id(params[:id])
  end
  def update
    @user=User.find_by_id(params[:id])
    if @user.update(user_params)
      flash[:notice]="success to update"
      redirect_to action: "index"
    else
      flash[:error]= 'data not valid'
      render 'edit'
    end
  end

  def show
  	@user=User.find_by_id(params[:id])
  end
  def create
    @user=User.new(user_params)
    if @user.save
    flash[:notice]="success add record"
    redirect_to action: 'index'
    else
      flash[:error]= 'data not valid'
      render 'new'
    end

  end
  def destroy
    @user=User.find_by_id(params[:id])
    if @user.destroy
      flash[:notice]= "success to delete"
      redirect_to action: "index"
    else
      flash[:error]= "failed to delete"
      redirect_to action: "index"
    end
  end
  private
  def user_params
  	params.require(:user).permit(:name,:content,:avatar)
  end
end
