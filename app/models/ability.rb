class Ability
  include CanCan::Ability

  def initialize(employee)
    employee ||= Employee.new # guest user (not logged in)

    if employee.admin?
      can :manage, :all # Admin can manage everything
    else
      can :read, Attendance, employee_id: employee.id # Employees can read their own attendance
      can :create, Attendance # Employees can create their own attendance
      can :update, Attendance, employee_id: employee.id # Employees can update their own attendance
      can :destroy, Attendance, employee_id: employee.id # Employees can delete their own attendance
    end
  end
end

