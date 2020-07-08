module Spree::BaseDecorator
  def self.prepended(base)
    base.class_eval do
      before_create :set_token
      before_update :verify_token
      default_scope { where(sample_indicator_id: [nil, Current.token].uniq) }

      # Set the sample data attributes to equal the changed data
      after_find do |user|
        changeable = find_changeable
        self.attributes = changeable.changed_data if changeable
      end
    end
  end

  def set_token
    self.sample_indicator_id = Current.token
  end

  def verify_token
    apply_changes_to_changeable unless sample_indicator_id?
  end

  def destroy!
    super if sample_indicator_id?
  end

  private

  # Apply changes to the changeable object instead of the sample object
  def apply_changes_to_changeable
    if changes.any?
      changeable = find_changeable || Spree::SampleChanges.new(changeable_type: self.class.name, changeable_id: id)
      changeable.changed_data = attributes
      # This method on Stores does not play well with this ActiveRecord hackery
      changeable.changed_data.delete("available_locales")
      changeable.save
      # Mark changes as already applied so the original object is unaffected
      changes_applied
    end
  end

  def find_changeable
    Spree::SampleChanges.find_by(changeable_type: self.class.name, changeable_id: id)
  end

end

Spree::Base.prepend Spree::BaseDecorator
