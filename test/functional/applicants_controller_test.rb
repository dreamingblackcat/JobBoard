require 'test_helper'

class ApplicantsControllerTest < ActionController::TestCase
  setup do
    @applicant = applicants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:applicants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create applicant" do
    assert_difference('Applicant.count') do
      post :create, applicant: { app_address: @applicant.app_address, app_contact_email: @applicant.app_contact_email, app_description: @applicant.app_description, app_dob: @applicant.app_dob, app_gender: @applicant.app_gender, app_language: @applicant.app_language, app_marital_status: @applicant.app_marital_status, app_name: @applicant.app_name, app_nrc: @applicant.app_nrc, app_phone_number: @applicant.app_phone_number, app_skills: @applicant.app_skills, app_url: @applicant.app_url, user_id: @applicant.user_id }
    end

    assert_redirected_to applicant_path(assigns(:applicant))
  end

  test "should show applicant" do
    get :show, id: @applicant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @applicant
    assert_response :success
  end

  test "should update applicant" do
    put :update, id: @applicant, applicant: { app_address: @applicant.app_address, app_contact_email: @applicant.app_contact_email, app_description: @applicant.app_description, app_dob: @applicant.app_dob, app_gender: @applicant.app_gender, app_language: @applicant.app_language, app_marital_status: @applicant.app_marital_status, app_name: @applicant.app_name, app_nrc: @applicant.app_nrc, app_phone_number: @applicant.app_phone_number, app_skills: @applicant.app_skills, app_url: @applicant.app_url, user_id: @applicant.user_id }
    assert_redirected_to applicant_path(assigns(:applicant))
  end

  test "should destroy applicant" do
    assert_difference('Applicant.count', -1) do
      delete :destroy, id: @applicant
    end

    assert_redirected_to applicants_path
  end
end
