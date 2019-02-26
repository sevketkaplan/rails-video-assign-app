class CreateAssigns < ActiveRecord::Migration[5.2]
	def change
		create_table :assigns do |t|
			t.string :video_id
			t.string :user_id
			t.boolean :user_confirm , default: false
			t.boolean :admin_confirm , default: false

			t.timestamps
		end
	end
end
