class Article < ActiveRecord::Base
  after_initialize do |user|
  puts "You have initialized an object!"
end

after_find do |user|
  puts "You have found an object!"
end
  include Validators
    has_many :comments, dependent: :destroy
    validates :title, presence: true, :'validators/title' => true

end
