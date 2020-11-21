class AddConditionToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :condition, :string
  end
end
