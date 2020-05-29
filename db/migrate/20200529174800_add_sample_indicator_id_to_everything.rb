class AddSampleIndicatorIdToEverything < ActiveRecord::Migration[5.2]
  def change
    tables = ActiveRecord::Base.connection.tables - ["schema_migrations"]
      tables.each do |table|
        add_column table, :sample_indicator_id, :string
      end
  end
end
