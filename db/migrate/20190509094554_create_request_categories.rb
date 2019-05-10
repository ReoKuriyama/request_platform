class CreateRequestCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :request_categories do |t|
      t.integer :parent_id
      t.string :name

      t.timestamps
    end
  end
end
