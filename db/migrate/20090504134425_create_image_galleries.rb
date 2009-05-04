class CreateImageGalleries < ActiveRecord::Migration
  def self.up
    create_table :image_galleries do |t|
      t.string :name
      t.string :permalink
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :image_galleries
  end
end
