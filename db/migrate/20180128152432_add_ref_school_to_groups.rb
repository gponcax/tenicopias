class AddRefSchoolToGroups < ActiveRecord::Migration[5.1]
  def change
    add_reference :groups, :school, foreign_key: true
  end
end
