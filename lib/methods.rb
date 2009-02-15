# methods.rb
module Stages
  def mk_cells cells
    nostroke
    flow :left => 10, :top => 30 do
      Y.times do |j|
        X.times do |i|
          cells << rect(W*i, W*j, W, W, :fill => black)
        end
      end
    end
  end
  
  def set_path cells, n = '0'
    tagline Fs[n.to_i].gsub('_',' ').gsub('.data',''), :left => 5, :top => 0, :stroke => white
    path = IO.read("../data/#{Fs[n.to_i]}").collect{|line| a, b = line.chomp.split(',')}
    cells.each{|c| c.style :fill => white  if path.include? [c.style[:left].to_s, c.style[:top].to_s]}
    return path
  end
  
  def set_start_goal cells
    cells[4].style :fill => darkgoldenrod
    cells[395].style :fill => darkgoldenrod
    return cells[4], cells[395]
  end
  
  def clear_cells cells
    cells.each{|c| c.style :fill => black}
  end
  
  def go_next n
    n = '0' if n.to_i == Fs.length
    para link(strong('next'), :click => "/#{n}", :stroke => white) , :left => 370, :top => 445
  end
end