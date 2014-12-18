class AddOwnerUserIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :OwnerUserId, :integer
  end
end
