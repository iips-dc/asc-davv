require 'test_helper'

class PrincipalWorkshopsControllerTest < ActionController::TestCase
  setup do
    @principal_workshop = principal_workshops(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:principal_workshops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create principal_workshop" do
    assert_difference('PrincipalWorkshop.count') do
      post :create, principal_workshop: { academic_qualification: @principal_workshop.academic_qualification, designation: @principal_workshop.designation, email: @principal_workshop.email, fax_code: @principal_workshop.fax_code, fax_number: @principal_workshop.fax_number, mobile: @principal_workshop.mobile, name: @principal_workshop.name, office_address: @principal_workshop.office_address, office_number: @principal_workshop.office_number, res_address: @principal_workshop.res_address, std_code: @principal_workshop.std_code, univ_type: @principal_workshop.univ_type, university: @principal_workshop.university }
    end

    assert_redirected_to principal_workshop_path(assigns(:principal_workshop))
  end

  test "should show principal_workshop" do
    get :show, id: @principal_workshop
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @principal_workshop
    assert_response :success
  end

  test "should update principal_workshop" do
    put :update, id: @principal_workshop, principal_workshop: { academic_qualification: @principal_workshop.academic_qualification, designation: @principal_workshop.designation, email: @principal_workshop.email, fax_code: @principal_workshop.fax_code, fax_number: @principal_workshop.fax_number, mobile: @principal_workshop.mobile, name: @principal_workshop.name, office_address: @principal_workshop.office_address, office_number: @principal_workshop.office_number, res_address: @principal_workshop.res_address, std_code: @principal_workshop.std_code, univ_type: @principal_workshop.univ_type, university: @principal_workshop.university }
    assert_redirected_to principal_workshop_path(assigns(:principal_workshop))
  end

  test "should destroy principal_workshop" do
    assert_difference('PrincipalWorkshop.count', -1) do
      delete :destroy, id: @principal_workshop
    end

    assert_redirected_to principal_workshops_path
  end
end
