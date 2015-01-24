class InteractionProgramsController < ApplicationController
  before_filter :authenticate_admin!, :only => [:show, :edit, :update, :destroy, :record]
  layout "adminDashboard", :only => [:show, :edit, :update, :destroy, :record]

  # GET /interaction_programs
  # GET /interaction_programs.json
  def index
    @courses = Course.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @interaction_programs }
    end
  end

  # GET /interaction_programs/1
  # GET /interaction_programs/1.json
  def show
    @interaction_program = InteractionProgram.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @interaction_program }
    end
  end

  def record
    @interaction_programs = InteractionProgram.all

    respond_to do |format|
      format.html 
      format.json { render json: @interaction_programs }
    end
  end


  # GET /interaction_programs/new
  # GET /interaction_programs/new.json
  def new
    @interaction_program = InteractionProgram.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @interaction_program }
    end
  end

  # GET /interaction_programs/1/edit
  def edit
    @interaction_program = InteractionProgram.find(params[:id])
  end

  # POST /interaction_programs
  # POST /interaction_programs.json
  def create
    @interaction_program = InteractionProgram.new(params[:interaction_program])

    respond_to do |format|
      if @interaction_program.save
        format.html { redirect_to registered_path }
        format.json { render json: @interaction_program, status: :created, location: @interaction_program }
      else
        format.html { render action: "new" }
        format.json { render json: @interaction_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /interaction_programs/1
  # PUT /interaction_programs/1.json
  def update
    @interaction_program = InteractionProgram.find(params[:id])

    respond_to do |format|
      if @interaction_program.update_attributes(params[:interaction_program])
        format.html { redirect_to @interaction_program, notice: 'Interaction program was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @interaction_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interaction_programs/1
  # DELETE /interaction_programs/1.json
  def destroy
    @interaction_program = InteractionProgram.find(params[:id])
    @interaction_program.destroy

    respond_to do |format|
      format.html { redirect_to interaction_record_path }
      format.json { head :no_content }
    end
  end
end
