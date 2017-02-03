class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy

  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :catorizations

  has_many :votes, dependent: :destroy
  has_many :voted_users, through: :votes, source: :user
  #validates_presence_of :title
  validates :title, presence: {message: "must be there"}  , uniqueness:true

  validates_presence_of :description, message: "must be present"

  # after_intitialize :set_defaults

  # a default scope will be used for al queries
  default_scope {order("title ASC")}

  # "->" is shorthand for lambda
  # to pass in a variable, use "->(x)"
  # scope :recent_tn, lambda { order("created_at DESC").limit(10) }

  scope :recent, lambda {|x| order("created_at DESC").limit(x) }
  scope :recent_ten, -> { order("created_at DESC").limit(10) }

  # this can be shorted by writing a scope
  def self.recent_ten
    order("created_at DESC").limit(10)
  end

  def self.recent(x)
    order("created_at DESC").limit(x)
  end

  before_save :capitalize_title             # call the before_save action :capitalize_title

  private

  def capitalize_title                 # create a method to capitalize the title before saving
    self.title.capitalize!
  end
end
