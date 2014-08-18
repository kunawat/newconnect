class Event < ActiveRecord::Base
  attr_accessible :name, :date, :time, :description
    
	validates_presence_of :name
  	validates_length_of :name, :within => 1..255
end
