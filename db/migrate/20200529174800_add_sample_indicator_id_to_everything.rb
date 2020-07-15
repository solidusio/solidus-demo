class AddSampleIndicatorIdToEverything < ActiveRecord::Migration[5.2]
  def change
    tables = ActiveRecord::Base.connection.tables - [
      ActiveRecord::SchemaMigration.table_name,
      ActiveRecord::InternalMetadata.table_name,
    ]

    tables.each do |table|
      add_column table, :sample_indicator_id, :string

      # Need to limit the index name, because we have some long table names.
      index_name = "index_#{table.to_s[0..32]}_on_sample_indicator_id"
      add_index table, :sample_indicator_id, name: index_name
    end
  end
end
