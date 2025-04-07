class StudyMaterialsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if current_user.admin?
      @study_materials = StudyMaterial.includes(:group).all
    else
      @study_materials = StudyMaterial.joins(:group)
                                    .where(groups: { id: current_user.groups.pluck(:id) })
    end
  end

  def show
    @study_material = StudyMaterial.find(params[:id])
    unless current_user.admin? || current_user.groups.include?(@study_material.group)
      redirect_to study_materials_path, alert: "You are not authorized to view this material."
    end
  end
end