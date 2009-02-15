# mk_labyrinth.rb
module Stages
  def mk_labyrinth n
    r1 = rect :left => 12, :top => 448, :width => 23, :height => 20
    r2 = rect :left => 52, :top => 448, :width => 38, :height => 20
    r3 = rect :left => 112, :top => 448, :width => 38, :height => 20
    background forestgreen
    style Shoes::LinkHover, :fill => nil
    go_next n
    
    cells = []
    mk_cells cells
    set_path cells, n
    s, g = set_start_goal cells
    cells -= [s, g]
    
    opt1 = para 'off', :left => 10, :top => 445, :stroke => white, :weight => 'bold'
    r1.click{opt1.text = opt1.text == 'on' ? 'off' : 'on'}
    opt2 = para 'save', :left => 50, :top => 445, :stroke => white, :weight => 'bold'
    r2.click do
      opt2.style :stroke => orange
      timer(1){opt2.style :stroke => white}
      open "../data/#{Fs[n.to_i]}", 'w' do |f|
        cells.each{|c| f.puts("#{c.style[:left]},#{c.style[:top]}") if c.style[:fill] == white}
        [s, g].each{|c| f.puts("#{c.style[:left]},#{c.style[:top]}")}
      end
    end
    opt3 = para 'clear', :left => 110, :top => 445, :stroke => white, :weight => 'bold'
    r3.click{clear_cells cells}
    
    cells.each do |c|
      c.hover{c.style(:fill => white) if opt1.text == 'on'}
      c.click{c.style :fill => (c.style[:fill] == black ? white : black)}
    end
  end
end
