namespace :db do
  
  desc "Fill database with sample data"
  
  task populate: :environment do
    make_users
  end

  def make_users
    admin = User.create!(name: "Paul Cobley",
                 email: "paul.cobley@gmail.com",
                 password: "password",
                 password_confirmation: "password")
    admin.toggle!(:admin)
  end

end