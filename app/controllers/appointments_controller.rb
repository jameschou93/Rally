class AppointmentsController < ApplicationController
  before_action :today
  before_action :authenticate!
  def index
    render"ang_appointments.html.erb"
  end

  def ang_index
    
  end

  def show
    @appointment = Appointment.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def map
    render 'map.html.erb'
  end

  def update 
    appointment = Appointment.find_by(params[:id])
    appointment.update(title: params[:title], date: params[:date], start_time: params[:start_time], end_time: params[:end_time], location_id: params[:location].to_i)
  end
  def create
    location = Location.create(address: params[:address], city: params[:city], state: params[:state], zip_code: params[:zip_code])

    appointment = Appointment.new(title: params[:title], date: params[:date], start_time: params[:start_time], end_time: params[:end_time], location_id: location.id)

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
