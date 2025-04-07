class AddDefaultRoles < ActiveRecord::Migration[6.1]
  def up
    Role.find_or_create_by(name: 'Admin')
    Role.find_or_create_by(name: 'Student')
  end

  def down
    Role.where(name: ['Admin', 'Student']).destroy_all
  end
end