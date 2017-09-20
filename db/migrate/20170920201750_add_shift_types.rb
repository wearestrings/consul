class AddShiftTypes < ActiveRecord::Migration
  def change
    add_column :poll_shifts, :collect_vote, :boolean, null: false, default: false
    add_column :poll_shifts, :recount_scrutiny, :boolean, null: false, default: false
  end
end
