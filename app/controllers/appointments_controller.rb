class AppointmentsController < ApplicationController
  def index
    @appointments = current_user.appointments
  end

  def new
    
  end

  def create
    appointment = Appointment.create(title: params[:title], date: params[:date], start_time: params[:start_time], end_time: params[:end_time])
  end
end
