class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    before_action :authenticate_user!
    protect_from_forgery with: :exception
  
    before_action :current_cart
  
    private
      def current_cart
        if session[:cart_id]
            
          cart = Cart.find_by(:id => session[:cart_id])
          byebug
          if cart.present?
            @current_cart = cart
          else
            session[:cart_id] = nil
          end
        end
  
        if session[:cart_id] == nil
            byebug
          @current_cart = Cart.create
          session[:cart_id] = @current_cart.id
        end
      end
  end
