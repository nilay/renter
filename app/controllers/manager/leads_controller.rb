# frozen_string_literal: true
class Manager::LeadsController < Manager::BaseController

  def show
    @lead = User.find(params[:id])
  end

  def create
    respond_to do |format|
      format.html

      format.json do
        user = User.new(lead_params.merge({ role: 1 }))
        user.appointment.datetime = Time.now
        if user.save
          flash[:notice] = 'Appointment created '
          render json: { message: 'Lead created successfully'}, status: :created
        else
          render json: { message: user.errors.full_messages.join(',') }, status: :bad_request
        end
      end
    end
  end

  private
  def lead_params
    params.require(:lead).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :city,
      :address,
      appointment_attributes:[
        :unit_id,
        :notes,
        :interest_level,
      ]
    )
  end
end