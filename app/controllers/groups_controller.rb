class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user, only: [:edit,:update]
  
  def new
    @group = Group.new
  end
  
  def index
    @groups = Group.all
    @book = Book.new
  end
  
  def show
    @group = Group.find(params[:id])
    @book = Book.new
  end
  
  def create
    @group = Group.new
    @group.owner_id = current_user.id
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end
  
end
