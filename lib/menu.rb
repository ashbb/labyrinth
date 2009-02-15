# menu.rb
module Stages
  def menu title, items, n, pr, color
    nostroke
    nofill
    tb = image(:left => 0, :top => 0, :width => 150, :height => 23){rect(0, 0, 150, 23)}
    para title, :stroke => color, :weight => 'bold'
    @f ||= []
    @f << flow do
      items.each_with_index do |e, i|
        nostroke
        nofill
        b = image(:width => 150, :height => 23){rect(0, 0, 150, 23)}
        f = image(:width => 150, :height => 23){rect(0, 0, 150, 23, :fill => orange,:curve => 8)}.hide
        yield b, f, i, e
        b.hover{f.show}
        b.leave{f.hide}
        b.click{pr.call(i, e); @f[n].toggle}
      end
    end.hide
    
    tb.click{@f[n].toggle}
  end
end
