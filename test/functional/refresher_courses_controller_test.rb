require 'test_helper'

class RefresherCoursesControllerTest < ActionController::TestCase
  setup do
    @refresher_course = refresher_courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:refresher_courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create refresher_course" do
    assert_difference('RefresherCourse.count') do
      post :create, refresher_course: { category: @refresher_course.category, city: @refresher_course.city, college: @refresher_course.college, course: @refresher_course.course, date_of_joining: @refresher_course.date_of_joining, district: @refresher_course.district, dob: @refresher_course.dob, email: @refresher_course.email, gender: @refresher_course.gender, landline: @refresher_course.landline, marital_status: @refresher_course.marital_status, mobile: @refresher_course.mobile, name: @refresher_course.name, payscale: @refresher_course.payscale, phd: @refresher_course.phd, pin: @refresher_course.pin, position: @refresher_course.position, pref_date1: @refresher_course.pref_date1, pref_date2: @refresher_course.pref_date2, religion: @refresher_course.religion, res_address: @refresher_course.res_address, state: @refresher_course.state, stream: @refresher_course.stream, university: @refresher_course.university, university_pin: @refresher_course.university_pin }
    end

    assert_redirected_to refresher_course_path(assigns(:refresher_course))
  end

  test "should show refresher_course" do
    get :show, id: @refresher_course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @refresher_course
    assert_response :success
  end

  test "should update refresher_course" do
    put :update, id: @refresher_course, refresher_course: { category: @refresher_course.category, city: @refresher_course.city, college: @refresher_course.college, course: @refresher_course.course, date_of_joining: @refresher_course.date_of_joining, district: @refresher_course.district, dob: @refresher_course.dob, email: @refresher_course.email, gender: @refresher_course.gender, landline: @refresher_course.landline, marital_status: @refresher_course.marital_status, mobile: @refresher_course.mobile, name: @refresher_course.name, payscale: @refresher_course.payscale, phd: @refresher_course.phd, pin: @refresher_course.pin, position: @refresher_course.position, pref_date1: @refresher_course.pref_date1, pref_date2: @refresher_course.pref_date2, religion: @refresher_course.religion, res_address: @refresher_course.res_address, state: @refresher_course.state, stream: @refresher_course.stream, university: @refresher_course.university, university_pin: @refresher_course.university_pin }
    assert_redirected_to refresher_course_path(assigns(:refresher_course))
  end

  test "should destroy refresher_course" do
    assert_difference('RefresherCourse.count', -1) do
      delete :destroy, id: @refresher_course
    end

    assert_redirected_to refresher_courses_path
  end
end
