class Admin::GroupsController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin
    before_action :set_group, only: [:show, :edit, :update, :destroy]
  
    def index
      @groups = Group.all
    end
  
    def show
      @students = @group.users.where(role: 'Student')
      @study_materials = @group.study_materials
    end
  
    def new
      @group = Group.new
    end
  
    def create
      @group = Group.new(group_params)
      if @group.save
        redirect_to admin_groups_path, notice: 'Group was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @group.update(group_params)
        redirect_to admin_groups_path, notice: 'Group was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @group.destroy
      redirect_to admin_groups_path, notice: 'Group was successfully deleted.'
    end
  
    private
  
    def set_group
      @group = Group.find(params[:id])
    end
  
    def group_params
      params.require(:group).permit(:name)
    end
  
    def require_admin
      unless current_user.admin?
        redirect_to root_path, alert: 'You are not authorized to access this page.'
      end
    end
  end