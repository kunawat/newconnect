class DocUser < ActiveRecord::Base
 
  attr_accessible :email, :name, :attach, :pic
  validates :name, :presence => true    
  validates :email, :presence => true
   has_attached_file :pic, :styles =>  { :medium => "300x300>", :thumb => "100x100>" }
   has_attached_file :attach
end

