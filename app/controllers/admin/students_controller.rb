class Admin::StudentsController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin
    before_action :set_group, only: [:index, :create, :destroy]
  
    def index
      if params[:group_id]
        @group_students = @group.users.where(role: 'Student')
        @available_students = User.where(role: 'Student').where.not(id: @group.user_ids)
      else
        @students = User.where(role: 'Student')
      end
    end
  
    def create
      @student = User.find(params[:student_id])
      @group.users << @student
      redirect_to admin_group_students_path(@group), notice: 'Student added to group.'
    end
  
    def destroy
      @student = User.find(params[:id])
      @group.users.delete(@student)
      redirect_to admin_group_students_path(@group), notice: 'Student removed from group.'
    end
  
    private
  
    def set_group
      @group = Group.find(params[:group_id]) if params[:group_id]
    end
  
    def require_admin
      unless current_user.admin?
        redirect_to root_path, alert: 'You are not authorized to access this page.'
      end
    end
  end