Spree::Base.class_eval do
  validate :check_if_allowed

  def check_if_allowed
    errors.add(:records, "can't be adjusted on the sample admin") if $admin || $api
  end

end
