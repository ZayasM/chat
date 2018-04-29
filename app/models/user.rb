class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :nick, type: String


  validates :nick, presence: true

  has_many :messages
end
