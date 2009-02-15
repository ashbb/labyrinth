# init.rb
module Stages
  def index s = 'o'
    (s, n = s[0].chr, s[1..-1].to_s)  if s[0].chr == 'm'
    case s
      when 'o'
        opening
      when 'm'
        mk_labyrinth n
      else
        stage s
    end
  end

  def opening
    background '../imgs/art-and-code-collage-mini.png'
    style Shoes::Link, :stroke => white, :underline => nil
    style Shoes::LinkHover, :stroke => white, :fill => nil, :underline => nil
    para strong(link 'Labyrinth', :click => '/0'), :size => 30, :top => -10
    
    flow :left => 190, :top => 10, :width => 150 do
      pr1 = proc{|i, e| visit "/#{i}"}
      menu 'select', Fs.collect{|f| f.gsub('_',' ').gsub('.data','')}, 0, pr1, orange do |b, f, i, e|
        b.move 0, i*23
        f.move 0, i*23
        para e, "\n", :stroke => white, :weight => 'bold'
      end
    end
  end
  
end