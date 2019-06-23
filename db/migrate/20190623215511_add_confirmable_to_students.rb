class AddConfirmableToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :unconfirmed_email, :string
    add_column :students, :confirmation_token, :string
    add_index :students, :confirmation_token, unique: true
    add_column :students, :confirmed_at, :string
    add_column :students, :confirmation_sent_at, :datetime
    add_column :students, :password_reset_token, :string
    add_index :students, :password_reset_token, unique: true

    User.update_all(:confirmed_at => Time.now)
  end
end
