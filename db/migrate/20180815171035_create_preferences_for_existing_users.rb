class CreatePreferencesForExistingUsers < ActiveRecord::Migration[5.2]
  def change
    User.all.each do |user|
      user.create_preference
    end
  end
end
