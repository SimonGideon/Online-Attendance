# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_a?(Lecturer)
      can :read, Lecturer
      can :read, Course
      can :read, Attendance
      can :manage, LecturerUnit
    end

    # Abilities for Student
    if user.is_a?(Student)
      can :manage, StudentsCourse, student_id: user.id
      can :read, Course
      can :manage, Attendance, student_course: { student_id: user.id }
    end
  end
end
