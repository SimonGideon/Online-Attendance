# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_a?(Lecturer)
      can :manage, LecturerUnit, lecturer_id: user.id
      can :read, Course
      can :read, Attendance, lecturer_unit: { lecturer_id: user.id }
    end

    # Abilities for Student
    if user.is_a?(Student)
      can :manage, StudentsCourse, student_id: user.id
      can :read, Course
      can :manage, Attendance, student_course: { student_id: user.id }
    end

    # Abilities for Admin
    if user.is_a?(Admin)
      can :manage, :all
    end
  end
end
