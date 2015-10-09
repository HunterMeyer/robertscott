class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :email
      t.text :name
      t.text :body
      t.timestamps
    end
  end
end
