require "test_helper"

class StudyMaterialsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get study_materials_index_url
    assert_response :success
  end

  test "should get show" do
    get study_materials_show_url
    assert_response :success
  end
end
