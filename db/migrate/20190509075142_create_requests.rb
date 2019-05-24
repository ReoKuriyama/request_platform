class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :summary 
      t.text :description
      t.text :improvement_idea
      t.integer :estimate
      t.integer :count, default: 1, null: false
      t.integer :jira_ticket_id
      t.string :function_impact
      t.integer :office_scale
      t.integer :request_category_id

      t.timestamps
    end
  end
end
