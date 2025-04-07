class Admin::StudyMaterialsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  before_action :set_group
  before_action :set_study_material, only: [:destroy]

  def new
    @study_material = @group.study_materials.build
  end

  def create
    @study_material = @group.study_materials.build(study_material_params)
    if @study_material.save
      redirect_to admin_group_path(@group), notice: 'Study material was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @study_material.destroy
    redirect_to admin_group_path(@group), notice: 'Study material was successfully deleted.'
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_study_material
    @study_material = @group.study_materials.find(params[:id])
  end

  def study_material_params
    params.require(:study_material).permit(:title, :description, :file)
  end

  def require_admin
    unless current_user.admin?
      redirect_to root_path, alert: 'You are not authorized to access this page.'
    end
  end
end