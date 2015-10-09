class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :first_name
      t.text :last_name
      t.text :reference
      t.text :status, default: 'Active'
    end
  end
end
