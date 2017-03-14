class AppointmentsController < ApplicationController
  before_action :today
  before_action :authenticate!
  def index
    @appointments = current_user.appointments
  end

  def ang_index
    render"ang_appointments.html.erb"
  end

  def show
    @appointment = Appointment.find_by(id: params[:id])
  end

  def new
    
  end

  def map
    render 'map.html.erb'
  end

  def update 
    appointment = Appointment.find_by(params[:id])
    appointment.update(title: params[:title], date: params[:date], start_time: params[:start_time], end_time: params[:end_time], location_id: params[:location].to_i)
  end
  def create
    appointment = Appointment.new(title: params[:title], date: params[:date], start_time: params[:start_time], end_time: params[:end_time], location_id: params[:location].to_i)

    if appointment.save
    invitees = params[:user_ids]
      invitees.each do |invitee|
        UserAppointment.create(appointment_id: appointment.id, user_id: invitee.to_i)
      end
    else
      flash[:error] = "#{appointment.errors.full_messages}"
    end
    redirect_to "/appointments"
  end
end
