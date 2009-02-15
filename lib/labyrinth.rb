# labyrinth.rb
require 'config'
require 'methods'
require 'menu'
require 'init'
require 'mk_labyrinth'
require 'stage'

class Labyrinth < Shoes
  include Stages
  
  url '/', :index
  url '/(.*)', :index
  
end

Shoes.app :title => 'Labyrinth 0.1.0', :width => 420, :height => 470