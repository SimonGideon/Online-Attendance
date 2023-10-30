require "test_helper"

class LecturersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lecturer = lecturers(:one)
  end

  test "should get index" do
    get lecturers_url
    assert_response :success
  end

  test "should get new" do
    get new_lecturer_url
    assert_response :success
  end

  test "should create lecturer" do
    assert_difference("Lecturer.count") do
      post lecturers_url, params: { lecturer: { name: @lecturer.name, phone: @lecturer.phone, service_number: @lecturer.service_number, work_email: @lecturer.work_email } }
    end

    assert_redirected_to lecturer_url(Lecturer.last)
  end

  test "should show lecturer" do
    get lecturer_url(@lecturer)
    assert_response :success
  end

  test "should get edit" do
    get edit_lecturer_url(@lecturer)
    assert_response :success
  end

  test "should update lecturer" do
    patch lecturer_url(@lecturer), params: { lecturer: { name: @lecturer.name, phone: @lecturer.phone, service_number: @lecturer.service_number, work_email: @lecturer.work_email } }
    assert_redirected_to lecturer_url(@lecturer)
  end

  test "should destroy lecturer" do
    assert_difference("Lecturer.count", -1) do
      delete lecturer_url(@lecturer)
    end

    assert_redirected_to lecturers_url
  end
end
