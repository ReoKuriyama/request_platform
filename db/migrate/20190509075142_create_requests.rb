class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :creator
      t.string :summary 
      t.text :current_problem
      t.text :improvement_idea
      t.bigint :office_id
      t.string :estimate
      t.integer :count, default: 1, null: false
      t.integer :status, default: 0, null: false
      t.boolean :will_do

      t.integer :request_category_id

      t.timestamps
    end
  end
end
