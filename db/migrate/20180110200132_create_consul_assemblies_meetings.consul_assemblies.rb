# This migration comes from consul_assemblies (originally 20180110193614)
class CreateConsulAssembliesMeetings < ActiveRecord::Migration
  def change
    create_table :consul_assemblies_meetings do |t|

      t.string 'title', null: false
      t.string 'general_description'
      t.string 'status', null: false
      t.string 'about_venue'
      t.integer 'assembly_id', null: false, index: true

      t.datetime 'scheduled_at'

      t.timestamps null: false
    end
  end
end
