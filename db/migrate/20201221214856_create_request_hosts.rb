class CreateRequestHosts < ActiveRecord::Migration[6.1]
  def change
    create_table :request_hosts do |t|
      t.integer :user_id
      t.string :email
      t.string :username
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end
