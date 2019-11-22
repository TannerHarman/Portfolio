class SchoolsController < ApplicationController
  before_action :set_school, only: [:edit, :show, :update, :destroy]

  def index
    @schools = School.all
  end

  def new
    @school = School.new
  end

  def create 
    @school = School.new(school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to(qualifications_path, notice: 'School Created') }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to qualifications_path, notice: 'School Sucessfully updated' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy
    @school.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to qualifications_path, notice: 'School was removed.' }
    end
  end

  private
  def school_params
    params.require(:school).permit(:name, 
                                   :location, 
                                   :description, 
                                   :start_date, 
                                   :end_date, 
                                   :logo,
                                   :img
                                  )
  end

  def set_school
    @school = School.find(params[:id])
  end
end