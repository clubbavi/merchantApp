require 'test_helper'

class ProfileAnsweresControllerTest < ActionController::TestCase
  setup do
    @profile_answere = profile_answeres(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profile_answeres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile_answere" do
    assert_difference('ProfileAnswere.count') do
      post :create, profile_answere: { answere: @profile_answere.answere, profile_id: @profile_answere.profile_id, question_id: @profile_answere.question_id }
    end

    assert_redirected_to profile_answere_path(assigns(:profile_answere))
  end

  test "should show profile_answere" do
    get :show, id: @profile_answere
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile_answere
    assert_response :success
  end

  test "should update profile_answere" do
    patch :update, id: @profile_answere, profile_answere: { answere: @profile_answere.answere, profile_id: @profile_answere.profile_id, question_id: @profile_answere.question_id }
    assert_redirected_to profile_answere_path(assigns(:profile_answere))
  end

  test "should destroy profile_answere" do
    assert_difference('ProfileAnswere.count', -1) do
      delete :destroy, id: @profile_answere
    end

    assert_redirected_to profile_answeres_path
  end
end
