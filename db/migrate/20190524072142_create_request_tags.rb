class CreateRequestTags < ActiveRecord::Migration[5.1]
  def change
    create_table :request_tags do |t|
      t.references :request
      t.references :tag

      t.timestamps
    end
  end
end
