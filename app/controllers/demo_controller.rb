class DemoController < ApplicationController
	
  def index
	end
	
  def show_image
	   # next 6 lines use R to plot a histogram
  	 @r = InitR()
  	 @d = @r.rnorm(100)
  	 @l = @r.range(-1,1,@d)
  	 @r.png "/tmp/plot.png"
     @r.par(:bg => "cornsilk")
  	 @r.hist(@d, :range => @l, :col => "lavender", :main => "My Plot")
     
  	 @r.eval_R("dev.off()")  #required for png output
  	 # then read the png file and deliver it to the browser
  	 @g = File.open("/tmp/plot.png", "rb")
  	 send_file @g, :type=>"assets/images", :disposition=>'inline'
  end


end
