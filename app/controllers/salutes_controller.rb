
class SalutesController < ApplicationController
  def index
    @salutes = current_user.received_salutes.order("created_at DESC")
    @salute = Salute.new
  end

  def create
    @salute = current_user.sent_salutes.create(target_user_params)
    html_salute = render @salute
    Pusher[target_user_params[:receiver_id].to_s].trigger("new-salute", {:salute => html_salute})
  end

  private

  def target_user_params
    params.require(:salute).permit(:receiver_id).merge(
      body:"Salute")
  end

end
