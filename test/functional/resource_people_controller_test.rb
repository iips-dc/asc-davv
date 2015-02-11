require 'test_helper'

class ResourcePeopleControllerTest < ActionController::TestCase
  setup do
    @resource_person = resource_people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resource_people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resource_person" do
    assert_difference('ResourcePerson.count') do
      post :create, resource_person: { mobile: @resource_person.mobile, person_email: @resource_person.person_email, person_name: @resource_person.person_name }
    end

    assert_redirected_to resource_person_path(assigns(:resource_person))
  end

  test "should show resource_person" do
    get :show, id: @resource_person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @resource_person
    assert_response :success
  end

  test "should update resource_person" do
    put :update, id: @resource_person, resource_person: { mobile: @resource_person.mobile, person_email: @resource_person.person_email, person_name: @resource_person.person_name }
    assert_redirected_to resource_person_path(assigns(:resource_person))
  end

  test "should destroy resource_person" do
    assert_difference('ResourcePerson.count', -1) do
      delete :destroy, id: @resource_person
    end

    assert_redirected_to resource_people_path
  end
end
