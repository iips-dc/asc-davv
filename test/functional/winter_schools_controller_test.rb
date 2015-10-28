require 'test_helper'

class WinterSchoolsControllerTest < ActionController::TestCase
  setup do
    @winter_school = winter_schools(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:winter_schools)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create winter_school" do
    assert_difference('WinterSchool.count') do
      post :create, winter_school: { category: @winter_school.category, city: @winter_school.city, college: @winter_school.college, course: @winter_school.course, date_of_joining: @winter_school.date_of_joining, district: @winter_school.district, dob: @winter_school.dob, email: @winter_school.email, gender: @winter_school.gender, landline: @winter_school.landline, marital_status: @winter_school.marital_status, mobile: @winter_school.mobile, name: @winter_school.name, payscale: @winter_school.payscale, phd: @winter_school.phd, pin: @winter_school.pin, position: @winter_school.position, pref_date1: @winter_school.pref_date1, pref_date2: @winter_school.pref_date2, religion: @winter_school.religion, res_address: @winter_school.res_address, state: @winter_school.state, stream: @winter_school.stream, university: @winter_school.university, university_pin: @winter_school.university_pin }
    end

    assert_redirected_to winter_school_path(assigns(:winter_school))
  end

  test "should show winter_school" do
    get :show, id: @winter_school
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @winter_school
    assert_response :success
  end

  test "should update winter_school" do
    put :update, id: @winter_school, winter_school: { category: @winter_school.category, city: @winter_school.city, college: @winter_school.college, course: @winter_school.course, date_of_joining: @winter_school.date_of_joining, district: @winter_school.district, dob: @winter_school.dob, email: @winter_school.email, gender: @winter_school.gender, landline: @winter_school.landline, marital_status: @winter_school.marital_status, mobile: @winter_school.mobile, name: @winter_school.name, payscale: @winter_school.payscale, phd: @winter_school.phd, pin: @winter_school.pin, position: @winter_school.position, pref_date1: @winter_school.pref_date1, pref_date2: @winter_school.pref_date2, religion: @winter_school.religion, res_address: @winter_school.res_address, state: @winter_school.state, stream: @winter_school.stream, university: @winter_school.university, university_pin: @winter_school.university_pin }
    assert_redirected_to winter_school_path(assigns(:winter_school))
  end

  test "should destroy winter_school" do
    assert_difference('WinterSchool.count', -1) do
      delete :destroy, id: @winter_school
    end

    assert_redirected_to winter_schools_path
  end
end
