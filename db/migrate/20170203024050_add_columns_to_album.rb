class AddColumnsToAlbum < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :release_date, :date
    add_column :albums, :genre, :string
  end
end
