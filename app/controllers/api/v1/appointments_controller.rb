class Api::V1::AppointmentsController < ApplicationController
  before_action :today
  before_action :authenticate!, except: [:create, :update]
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
    @appointment.date = DateTime.parse(params[:date]).to_date.to_s || @appointment.date
    @appointment.start_time = Time.parse(params[:start_time]).strftime("%H:%M") || @appointment.start_time
    @appointment.end_time = Time.parse(params[:end_time]).strftime("%H:%M")  || @appointment.end_time
    @appointment.save
    render 'show.json.jbuilder'
  end
  def new
    
  end

  def create
    location = Location.create(address: params[:address], 
                               city: params[:city], 
                               state: params[:state], 
                               zip_code: params[:zip_code])
    appointment = Appointment.new(title: params[:title],
                                  date: DateTime.parse(params[:date]).to_date, 
                                  start_time: Time.parse(params[:start_time]).strftime("%H:%M"), 
                                  end_time: Time.parse(params[:end_time]).strftime("%H:%M"), 
                                  location_id: location.id)

    if appointment.save
      invitees = params[:user_ids]
        invitees.each do |invitee|
          UserAppointment.create(appointment_id: appointment.id, user_id: invitee.to_i)
        end
        render '/api/v1/appointments/#appointment.id'
    else
      render json: {errors: "#{appointment.errors.full_messages}"}
    end
  end
end
