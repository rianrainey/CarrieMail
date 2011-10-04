class CartsController < ApplicationController
  def show
    if !anyone_signed_in?
      deny_access
    else
      @cart = current_cart
      @user = current_or_guest_user
      @catalog = @user.catalog
    end
  end

end
