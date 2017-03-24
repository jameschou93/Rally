class Api::V1::AppointmentsController < ApplicationController
  before_action :today
  before_action :authenticate!
  def index
    @appointments = Appointment.all
    render"index.json.jbuilder"
  end

  def myappointments
    @appointments = current_user.appointments
    render "myappointments.json.jbuilder"
  end

  def show
    @appointment = Appointment.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @appointment = Appointment.find_by(id: params[:id])
    @appointment.title = params[:title] || @appointment.title
    @appointment.date = params[:date] || @appointment.date
    @appointment.start_time = params[:start_time] || @appointment.start_time
    @appointment.end_time = params[:end_time] || @appointment.end_time
    render 'show.json.jbuilder'
  end
  def new
    
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
