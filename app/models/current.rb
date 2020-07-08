class Current < ActiveSupport::CurrentAttributes
  attribute :user

  def token
    user&.spree_api_key
  end
end
