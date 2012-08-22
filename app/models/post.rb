class Post < ActiveRecord::Base
  attr_accessible :content, :name, :title, :tags_attributes, :name_confirmation

  validates :name,  :presence => true, :confirmation => true
  validates :name_confirmation, presence: true
  validates :title, :presence => true, :length => { :minimum => 5 }

  has_many :comments, :dependent => :destroy
  has_many :tags

   accepts_nested_attributes_for :tags, :allow_destroy => :true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
