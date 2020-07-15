module ActionDispatch::Cookies::AbstractCookieJarDecorator
  # We want changes the user made to persist even
  # when the guest token changes, so here we're
  # updating everything that uses the old guest
  # token to the new one.
  def []=(name, options)
    if name == :guest_token
      token = options.is_a?(String) ? options : options[:value]
      move_changes_to_new_token(token) if token != self[:guest_token]
    end

    super
  end

  private

  def move_changes_to_new_token(token)
    model_classes.each do |model_class|
      if model_class.method_defined?(:sample_indicator_id) && self[:guest_token]
        model_class.unscoped.where(
          sample_indicator_id: self[:guest_token]
        ).update_all(
          sample_indicator_id: token
        )
      end
    end
  end

  def model_classes
    ActiveRecord::Base.descendants
  end
end

ActionDispatch::Cookies::AbstractCookieJar.prepend ActionDispatch::Cookies::AbstractCookieJarDecorator
