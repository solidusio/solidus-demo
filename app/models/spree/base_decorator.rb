Spree::Base.class_eval do
  before_create :set_token
  before_update :verify_token
  before_destroy :verify_token
  default_scope { where("#{table_name}.sample_indicator_id = ? OR #{table_name}.sample_indicator_id IS null", $token) }

  def set_token
    self.sample_indicator_id = $token
  end

  def verify_token
    raise_sample_error unless sample_indicator_id?
  end

  private

  def raise_sample_error
    raise("You can't edit pre-existing items - try creating a new one!")
  end

end
