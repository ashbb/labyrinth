# config.rb
module Stages
  X, Y, W = 20, 20, 20
  Fs = Dir.glob('../data/*').collect{|f| File.basename f}
end