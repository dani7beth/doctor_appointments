class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
    
  end

  def show
    @doctor = Doctor.find(params[:id])
    @checkups = @doctor.appointments.where(condition: "Routine Checkup")
    @vaccines = @doctor.appointments.where(condition: "Vaccination")
    @walkins = @doctor.appointments.where(condition: "Walk-In")
    @procedures = @doctor.appointments.where(condition: "In-Patient Procedure")
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to @doctor
    else
      redirect :new
    end
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
    redirect_to doctors_path
  end
  
  private 
  def doctor_params
    params.require(:doctor).permit(:name)
  end
end
