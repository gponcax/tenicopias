class RemoveRefAdminAndPrinterToStatuses < ActiveRecord::Migration[5.1]
  def change
    remove_reference :statuses, :admin, foreing_key: true
    remove_reference :statuses, :printer, foreing_key: true
  end
end
