class CreateSpreeSampleChanges < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_sample_changes do |t|
      t.references :changeable, polymorphic: true, index: { name: "index_spree_sample_changes_on_changeable" }
      t.json :changed_data
      t.string :sample_indicator_id, index: true
    end
  end
end
