class AddColumnForViewCountToUrl < ActiveRecord::Migration[5.0]
  def change
    add_column :urls, :request_count, :integer, default: 1
  end
end
