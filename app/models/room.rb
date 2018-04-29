class Room
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String


  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :messages
end
