require "application_system_test_case"

class LecturerUnitsTest < ApplicationSystemTestCase
  setup do
    @lecturer_unit = lecturer_units(:one)
  end

  test "visiting the index" do
    visit lecturer_units_url
    assert_selector "h1", text: "Lecturer units"
  end

  test "should create lecturer unit" do
    visit lecturer_units_url
    click_on "New lecturer unit"

    fill_in "Course", with: @lecturer_unit.course_id
    fill_in "Created at", with: @lecturer_unit.created_at
    fill_in "Lecturer", with: @lecturer_unit.lecturer_id
    fill_in "Updated at", with: @lecturer_unit.updated_at
    click_on "Create Lecturer unit"

    assert_text "Lecturer unit was successfully created"
    click_on "Back"
  end

  test "should update Lecturer unit" do
    visit lecturer_unit_url(@lecturer_unit)
    click_on "Edit this lecturer unit", match: :first

    fill_in "Course", with: @lecturer_unit.course_id
    fill_in "Created at", with: @lecturer_unit.created_at
    fill_in "Lecturer", with: @lecturer_unit.lecturer_id
    fill_in "Updated at", with: @lecturer_unit.updated_at
    click_on "Update Lecturer unit"

    assert_text "Lecturer unit was successfully updated"
    click_on "Back"
  end

  test "should destroy Lecturer unit" do
    visit lecturer_unit_url(@lecturer_unit)
    click_on "Destroy this lecturer unit", match: :first

    assert_text "Lecturer unit was successfully destroyed"
  end
end
