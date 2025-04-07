class StudyMaterial < ApplicationRecord
  belongs_to :group
  
  def tag_list
    tags.to_s.split(',')
  end
  
  def tag_list=(value)
    self.tags = value.split(',').map(&:strip).join(',')
  end
end