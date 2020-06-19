class CreateSpreeSampleChanges < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_sample_changes do |t|
      t.string :changeable_type
      t.integer :changeable_id
      t.json :changed_data
      t.string :sample_indicator_id
    end
  end
end
