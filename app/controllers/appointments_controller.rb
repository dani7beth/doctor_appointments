class AppointmentsController < ApplicationController
  def index
    
    @appointments = Appointment.all
    @checkups = @appointments.where(condition: 'Routine Checkup')
    @vaccines = @appointments.where(condition: 'Vaccination')
    @walkins = @appointments.where(condition: 'Walk-In')
    @procedures = @appointments.where(condition: 'In-Patient Procedure')
   
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
      redirect_to @doctor
    else
      render :new
    end
  end
 

  def destroy
    @doctor = Doctor.find(params[:doctor_id])
    @appointment = @doctor.appointments.find(params[:id])
    @appointment.destroy
    redirect_to @doctor
  end

 private
   def appointment_params
     params.require(:appointment).permit(:appointment_date, :doctor_id, :user_id, :condition)
   end  
end
