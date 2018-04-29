class Message
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :text, type: String


  validates :text, presence: true

  belongs_to :user
  belongs_to :room
end
