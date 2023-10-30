require "test_helper"

class StudentsCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @students_course = students_courses(:one)
  end

  test "should get index" do
    get students_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_students_course_url
    assert_response :success
  end

  test "should create students_course" do
    assert_difference("StudentsCourse.count") do
      post students_courses_url, params: { students_course: { course_id: @students_course.course_id, student_id: @students_course.student_id } }
    end

    assert_redirected_to students_course_url(StudentsCourse.last)
  end

  test "should show students_course" do
    get students_course_url(@students_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_students_course_url(@students_course)
    assert_response :success
  end

  test "should update students_course" do
    patch students_course_url(@students_course), params: { students_course: { course_id: @students_course.course_id, student_id: @students_course.student_id } }
    assert_redirected_to students_course_url(@students_course)
  end

  test "should destroy students_course" do
    assert_difference("StudentsCourse.count", -1) do
      delete students_course_url(@students_course)
    end

    assert_redirected_to students_courses_url
  end
end
