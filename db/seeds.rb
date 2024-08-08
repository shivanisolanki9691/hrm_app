# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Department.create(name: "hr", location: "indore",)
Position.create( title: "software developer", department_id: 1)
Employee.create(email: "shivani.s@example.com", first_name: "shivani", last_name: "solanki", phone_number: "1234567890", hire_date: "2024-07-10", salary: 50000, address: "indore",  position_id: 1, department_id: 1)
Attendance.create( employee_id: 1, date: "2024-08-01", clock_in: Sat, 01 Jan 2000 14:01:45.000000000 UTC +00:00, clock_out: Sat, 01 Jan 2000 15:02:55.000000000 UTC +00:00)
Leave.create(employee_id: 1, start_date: "2024-08-01", end_date: "2024-31-01", leave_type: "Sick Leave", status: "Approved",)