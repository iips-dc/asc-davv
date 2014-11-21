require 'test_helper'

class ShorttermCoursesControllerTest < ActionController::TestCase
  setup do
    @shortterm_course = shortterm_courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shortterm_courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shortterm_course" do
    assert_difference('ShorttermCourse.count') do
      post :create, shortterm_course: { category: @shortterm_course.category, city: @shortterm_course.city, college: @shortterm_course.college, course: @shortterm_course.course, date_of_joining: @shortterm_course.date_of_joining, district: @shortterm_course.district, dob: @shortterm_course.dob, email: @shortterm_course.email, gender: @shortterm_course.gender, landline: @shortterm_course.landline, marital_status: @shortterm_course.marital_status, mobile: @shortterm_course.mobile, name: @shortterm_course.name, payscale: @shortterm_course.payscale, phd: @shortterm_course.phd, pin: @shortterm_course.pin, position: @shortterm_course.position, pref_date1: @shortterm_course.pref_date1, pref_date2: @shortterm_course.pref_date2, religion: @shortterm_course.religion, res_address: @shortterm_course.res_address, state: @shortterm_course.state, stream: @shortterm_course.stream, university: @shortterm_course.university, university_pin: @shortterm_course.university_pin }
    end

    assert_redirected_to shortterm_course_path(assigns(:shortterm_course))
  end

  test "should show shortterm_course" do
    get :show, id: @shortterm_course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shortterm_course
    assert_response :success
  end

  test "should update shortterm_course" do
    put :update, id: @shortterm_course, shortterm_course: { category: @shortterm_course.category, city: @shortterm_course.city, college: @shortterm_course.college, course: @shortterm_course.course, date_of_joining: @shortterm_course.date_of_joining, district: @shortterm_course.district, dob: @shortterm_course.dob, email: @shortterm_course.email, gender: @shortterm_course.gender, landline: @shortterm_course.landline, marital_status: @shortterm_course.marital_status, mobile: @shortterm_course.mobile, name: @shortterm_course.name, payscale: @shortterm_course.payscale, phd: @shortterm_course.phd, pin: @shortterm_course.pin, position: @shortterm_course.position, pref_date1: @shortterm_course.pref_date1, pref_date2: @shortterm_course.pref_date2, religion: @shortterm_course.religion, res_address: @shortterm_course.res_address, state: @shortterm_course.state, stream: @shortterm_course.stream, university: @shortterm_course.university, university_pin: @shortterm_course.university_pin }
    assert_redirected_to shortterm_course_path(assigns(:shortterm_course))
  end

  test "should destroy shortterm_course" do
    assert_difference('ShorttermCourse.count', -1) do
      delete :destroy, id: @shortterm_course
    end

    assert_redirected_to shortterm_courses_path
  end
end
