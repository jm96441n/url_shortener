class UpdateShortenedColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :urls, :shortened, :string, null: true
  end
end
