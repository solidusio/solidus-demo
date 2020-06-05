Spree::Order.class_eval do

  def billing_name
    "#{billing_firstname} #{billing_lastname}"
  end

end
