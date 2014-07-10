class SalutesController < ApplicationController
def index
  @salutes = current_user.salutes
end

def create
  @salute = current_user.salutes.new(body: "Salute")
  @salute.save
  redirect_to "/salutes"
end

end
