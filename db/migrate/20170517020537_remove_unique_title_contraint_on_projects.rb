class RemoveUniqueTitleContraintOnProjects < ActiveRecord::Migration
  def up
    remove_index :projects, :title
  end

  def down
    add_index :projects, :title, :unique => true
  end
end
