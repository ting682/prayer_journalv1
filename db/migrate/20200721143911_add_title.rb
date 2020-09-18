class AddTitle < ActiveRecord::Migration

  def up
    add_column :wallprayers, :title, :string
  end

  def down
    remove_column :wallprayers, :title
  end

end
