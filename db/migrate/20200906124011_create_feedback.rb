class CreateFeedback < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :message
      t.timestamps
    end
  end
end
