require 'test_helper'

class OrientationCoursesControllerTest < ActionController::TestCase
  setup do
    @orientation_course = orientation_courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orientation_courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create orientation_course" do
    assert_difference('OrientationCourse.count') do
      post :create, orientation_course: { category: @orientation_course.category, city: @orientation_course.city, college: @orientation_course.college, course: @orientation_course.course, date_of_joining: @orientation_course.date_of_joining, district: @orientation_course.district, dob: @orientation_course.dob, email: @orientation_course.email, gender: @orientation_course.gender, landline: @orientation_course.landline, marital_status: @orientation_course.marital_status, mobile: @orientation_course.mobile, name: @orientation_course.name, payscale: @orientation_course.payscale, phd: @orientation_course.phd, pin: @orientation_course.pin, position: @orientation_course.position, pref_date1: @orientation_course.pref_date1, pref_date2: @orientation_course.pref_date2, religion: @orientation_course.religion, res_address: @orientation_course.res_address, state: @orientation_course.state, stream: @orientation_course.stream, university: @orientation_course.university, university_pi: @orientation_course.university_pi }
    end

    assert_redirected_to orientation_course_path(assigns(:orientation_course))
  end

  test "should show orientation_course" do
    get :show, id: @orientation_course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @orientation_course
    assert_response :success
  end

  test "should update orientation_course" do
    put :update, id: @orientation_course, orientation_course: { category: @orientation_course.category, city: @orientation_course.city, college: @orientation_course.college, course: @orientation_course.course, date_of_joining: @orientation_course.date_of_joining, district: @orientation_course.district, dob: @orientation_course.dob, email: @orientation_course.email, gender: @orientation_course.gender, landline: @orientation_course.landline, marital_status: @orientation_course.marital_status, mobile: @orientation_course.mobile, name: @orientation_course.name, payscale: @orientation_course.payscale, phd: @orientation_course.phd, pin: @orientation_course.pin, position: @orientation_course.position, pref_date1: @orientation_course.pref_date1, pref_date2: @orientation_course.pref_date2, religion: @orientation_course.religion, res_address: @orientation_course.res_address, state: @orientation_course.state, stream: @orientation_course.stream, university: @orientation_course.university, university_pi: @orientation_course.university_pi }
    assert_redirected_to orientation_course_path(assigns(:orientation_course))
  end

  test "should destroy orientation_course" do
    assert_difference('OrientationCourse.count', -1) do
      delete :destroy, id: @orientation_course
    end

    assert_redirected_to orientation_courses_path
  end
end
