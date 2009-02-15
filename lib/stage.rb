# stage.rb
module Stages 
  def stage n
    background dimgray
    style Shoes::LinkHover, :fill => nil
    para link(strong('edit'), :click => "/m#{n}", :stroke => white) , :left => 330, :top => 445
    go_next n.next
    
    cells = []
    mk_cells cells
    path = set_path cells, n
    
    s, g = set_start_goal cells
    loogink = image '../imgs/loogink.png', :left => s.style[:left], :top => s.style[:top], :width => W, :height => W
    
    px, py = -1, -1
    loogink.translate 10, 30
    a = animate do |i|
      cx, cy = loogink.style[:left], loogink.style[:top]
      around = [[0, W], [W, 0], [0, -W], [-W, 0]]
      (i / (50 + rand(50))).times{around << around.shift}
      around.collect! do |x, y|
        [x, y] if path.include? [(x += cx).to_s, (y += cy).to_s]
      end
      around -= [nil]
      nx, ny = around.size == 1 ? around[0] : (around - [[px, py]])[0]
      loogink.move nx, ny
      px, py = cx, cy
      (a.stop; alert "GOAL! (#{i}steps)") if [nx, ny] == [g.style[:left], g.style[:top]]
    end
  end
end
