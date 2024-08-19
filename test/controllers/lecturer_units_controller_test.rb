require "test_helper"

class LecturerUnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lecturer_unit = lecturer_units(:one)
  end

  test "should get index" do
    get lecturer_units_url
    assert_response :success
  end

  test "should get new" do
    get new_lecturer_unit_url
    assert_response :success
  end

  test "should create lecturer_unit" do
    assert_difference("LecturerUnit.count") do
      post lecturer_units_url, params: { lecturer_unit: { course_id: @lecturer_unit.course_id, created_at: @lecturer_unit.created_at, lecturer_id: @lecturer_unit.lecturer_id, updated_at: @lecturer_unit.updated_at } }
    end

    assert_redirected_to lecturer_unit_url(LecturerUnit.last)
  end

  test "should show lecturer_unit" do
    get lecturer_unit_url(@lecturer_unit)
    assert_response :success
  end

  test "should get edit" do
    get edit_lecturer_unit_url(@lecturer_unit)
    assert_response :success
  end

  test "should update lecturer_unit" do
    patch lecturer_unit_url(@lecturer_unit), params: { lecturer_unit: { course_id: @lecturer_unit.course_id, created_at: @lecturer_unit.created_at, lecturer_id: @lecturer_unit.lecturer_id, updated_at: @lecturer_unit.updated_at } }
    assert_redirected_to lecturer_unit_url(@lecturer_unit)
  end

  test "should destroy lecturer_unit" do
    assert_difference("LecturerUnit.count", -1) do
      delete lecturer_unit_url(@lecturer_unit)
    end

    assert_redirected_to lecturer_units_url
  end
end
