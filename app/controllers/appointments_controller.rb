class AppointmentsController < ApplicationController
	# Default Values
	SEARCH_START = "2021-01-04"
	SEARCH_END = "2021-01-07"

	# Config
	DAY_START = "08:00:00"
	DAY_END = "18:00:00"
	LUNCH_START = "12:00:00"
	LUNCH_END = "13:00:00"
	SLOT_SIZE = 1800 # 00:30:00

	def index

		@searchStart = params[:start] ? Date.parse(params[:start]) : Date.parse(SEARCH_START)
		@searchEnd = params[:end] ? Date.parse(params[:end]) : Date.parse(SEARCH_END)

		@patients = Patient.all
		@patient = Patient.find(params[:patient] ? params[:patient] : 1)
		@appointments = Appointment.where("start >= ? AND end <= ?", @searchStart, @searchEnd.next_day).order("start")
		@slots = [];

		@searchStart.upto(@searchEnd) do |day|
			dayChange = {year: day.year, month: day.month, day: day.day}
			
			lunchStart = Time.parse(LUNCH_START).change(dayChange)
			lunchEnd = Time.parse(LUNCH_END).change(dayChange)

			startDay = Time.parse(DAY_START).change(dayChange)
			endDay = Time.parse(DAY_END).change(dayChange)
			
			slot = startDay

			while slot < endDay
				if lunchStart >= slot + SLOT_SIZE || lunchEnd <= slot
					if @appointments.all? { |app| (app.start.localtime >= slot + SLOT_SIZE || app.end.localtime <= slot) }
						@slots.push(slot)
					end
				end

				slot += SLOT_SIZE
			end
		end
	end

	def show
		@appointment = Appointment.find(params[:id])
		@patient = Patient.find(@appointment.patient_id)
	end

	def new
		slot = Time.parse(params[:slot])
		patient_id = params[:patient_id]

		@appointment = Appointment.new({title: "New Appointment", start: slot, end: slot + SLOT_SIZE, patient_id: patient_id})
		@patient = Patient.find(patient_id)
	end

	def create
		@appointment = Appointment.new(appointment_params)

		if @appointment.save
			redirect_to @appointment
		else
			render :new, status: :unprocessable_entity
		end
	end

	private
		def appointment_params
			params.require(:appointment).permit(:title, :start, :end, :patient_id)
		end
end
