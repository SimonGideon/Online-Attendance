require "application_system_test_case"

class StudentsCoursesTest < ApplicationSystemTestCase
  setup do
    @students_course = students_courses(:one)
  end

  test "visiting the index" do
    visit students_courses_url
    assert_selector "h1", text: "Students courses"
  end

  test "should create students course" do
    visit students_courses_url
    click_on "New students course"

    fill_in "Course", with: @students_course.course_id
    fill_in "Student", with: @students_course.student_id
    click_on "Create Students course"

    assert_text "Students course was successfully created"
    click_on "Back"
  end

  test "should update Students course" do
    visit students_course_url(@students_course)
    click_on "Edit this students course", match: :first

    fill_in "Course", with: @students_course.course_id
    fill_in "Student", with: @students_course.student_id
    click_on "Update Students course"

    assert_text "Students course was successfully updated"
    click_on "Back"
  end

  test "should destroy Students course" do
    visit students_course_url(@students_course)
    click_on "Destroy this students course", match: :first

    assert_text "Students course was successfully destroyed"
  end
end
