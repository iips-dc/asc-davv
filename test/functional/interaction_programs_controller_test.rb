require 'test_helper'

class InteractionProgramsControllerTest < ActionController::TestCase
  setup do
    @interaction_program = interaction_programs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interaction_programs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interaction_program" do
    assert_difference('InteractionProgram.count') do
      post :create, interaction_program: { category: @interaction_program.category, city: @interaction_program.city, college: @interaction_program.college, date_of_joining_phd: @interaction_program.date_of_joining_phd, district: @interaction_program.district, email: @interaction_program.email, gender: @interaction_program.gender, landline: @interaction_program.landline, marital_status: @interaction_program.marital_status, mobile: @interaction_program.mobile, name: @interaction_program.name, pin: @interaction_program.pin, religion: @interaction_program.religion, res_address: @interaction_program.res_address, research_experience: @interaction_program.research_experience, state: @interaction_program.state, stream: @interaction_program.stream, university: @interaction_program.university, university_pin: @interaction_program.university_pin }
    end

    assert_redirected_to interaction_program_path(assigns(:interaction_program))
  end

  test "should show interaction_program" do
    get :show, id: @interaction_program
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @interaction_program
    assert_response :success
  end

  test "should update interaction_program" do
    put :update, id: @interaction_program, interaction_program: { category: @interaction_program.category, city: @interaction_program.city, college: @interaction_program.college, date_of_joining_phd: @interaction_program.date_of_joining_phd, district: @interaction_program.district, email: @interaction_program.email, gender: @interaction_program.gender, landline: @interaction_program.landline, marital_status: @interaction_program.marital_status, mobile: @interaction_program.mobile, name: @interaction_program.name, pin: @interaction_program.pin, religion: @interaction_program.religion, res_address: @interaction_program.res_address, research_experience: @interaction_program.research_experience, state: @interaction_program.state, stream: @interaction_program.stream, university: @interaction_program.university, university_pin: @interaction_program.university_pin }
    assert_redirected_to interaction_program_path(assigns(:interaction_program))
  end

  test "should destroy interaction_program" do
    assert_difference('InteractionProgram.count', -1) do
      delete :destroy, id: @interaction_program
    end

    assert_redirected_to interaction_programs_path
  end
end
