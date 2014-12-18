class AddEnableToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :Enable, :boolean
  end
end
