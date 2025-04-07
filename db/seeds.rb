# db/seeds.rb
# Create roles
admin_role = Role.create!(name: 'Admin')
student_role = Role.create!(name: 'Student')

# Create admin user
admin = User.create!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password'
)
UserRole.create!(user: admin, role: admin_role)

# Create some students
5.times do |i|
  student = User.create!(
    email: "student#{i+1}@example.com",
    password: 'password',
    password_confirmation: 'password'
  )
  UserRole.create!(user: student, role: student_role)
  
  # Removed the avatar attachment part
end

# Create some groups
3.times do |i|
  Group.create!(name: "Group #{i+1}")
end