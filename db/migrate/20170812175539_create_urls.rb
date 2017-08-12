class CreateUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :urls do |t|
      t.string :original,  null: false, unique: true
      t.string :shortened, null: false, unique: true
      t.timestamps
    end
  end
end
