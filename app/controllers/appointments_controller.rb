class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.where(doctor_id: params[:doctor_id])
    @doctor = Doctor.find(params[:doctor_id])
  end

  def new
    @doctor = Doctor.find(params[:doctor_id])
    @users = User.all - @doctor.users
    @appointment = Appointment.new
  end

  def create
    @doctor = Doctor.find(params[:doctor_id])
    @appointment = @doctor.appointments.new(appointment_params)
    if @appointment.save
      redirect_to doctor_appointments_path(@doctor)
    else
      render :new
    end
  end

  def destroy
    @doctor = Doctor.find(params[:doctor_id])
    @appointment = @doctor.appointments.find(params[:id])
    @appointment.destroy
    redirect_to doctor_appointments_path(@doctor)
  end

 private
   def appointment_params
     params.require(:appointment).permit(:appointment_date, :doctor_id, :user_id)
   end  
end
