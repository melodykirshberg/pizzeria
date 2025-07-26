class HomeController < ApplicationController
  def index
    return redirect_to new_user_session_path unless user_signed_in?

    if user_chef?
      redirect_to pizzas_path
    elsif user_owner?
      redirect_to toppings_path
    end
  end
end
