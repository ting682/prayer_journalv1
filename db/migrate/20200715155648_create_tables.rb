class CreateTables < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      
    end

    create_table :wallprayers do |t|
      t.string :prayer
      t.boolean :anonymous
      t.integer :user_id
    end

    create_table :journals do |t|
      t.text :heart
      t.text :teachme
      t.text :prayer
      t.text :answer
      t.text :thankful
      t.string :date
      t.integer :user_id
    end
  end

  def down
    drop_table :users
    drop_table :wallprayers
    drop_table :journals
  end
end
