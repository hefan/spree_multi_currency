Spree::Core::ControllerHelpers::Order.class_eval do
  def current_currency
    # ensure session currency is supported
    #
    unless request.xhr? # does interfere with APIs getting state list
      if session.key?(:currency) && supported_currencies.map(&:iso_code).include?(session[:currency])
        session[:currency]
      else
        Spree::Config[:currency]
      end
    end
  end
end
