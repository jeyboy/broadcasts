class AddViewings < ActiveRecord::Migration
  def change
    create_table :viewings do |t|
      t.references :viewer, polymorphic: true
      t.references :broadcast

      t.datetime :hidden_at
      t.integer :impressions

      t.timestamps
    end
  end
end
