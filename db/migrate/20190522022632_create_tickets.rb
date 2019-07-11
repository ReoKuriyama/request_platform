class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :subject
      t.text :description
      t.integer :office_id
      t.integer :jira_issue_id
      t.integer :zendesk_ticket_id
      t.string :zendesk_reporter
      t.references :request

      t.timestamps
    end
  end
end
