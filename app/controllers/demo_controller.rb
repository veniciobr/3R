class DemoController < ApplicationController

  Rails.logger.level = 0 # at any time

  def index
	end
	
  def show
        begin
       # next 6 lines use R to plot a histogram
    #logger.debug '22222222222222222222222222222222222222222222222222222222'
       @r = InitR()
       @d = @r.rnorm1(100)
       @l = @r.range(-1,1,@d)
       @r.png "/tmp/plot.png"
       @r.par(:bg => "cornsilk")
       @r.hist(@d, :range => @l, :col => "lavender", :main => "My Plot")
       
       @r.eval_R("dev.off()")  #required for png output
       # then read the png file and deliver it to the browser
       @g = File.open("/tmp/plot.png", "rb") 
       send_file @g, :type=>"assets/images", :disposition=>'inline'
    rescue  => exc
       logger.error("Message for the log file #{exc.message}")
       flash[:error] = exc.message
       redirect_to static_pages_errorR_path, :method => :get
    end
  end

  def show_image

    begin
       # next 6 lines use R to plot a histogram
    #logger.debug '22222222222222222222222222222222222222222222222222222222'
       @r = InitR()
       @d = @r.rnorm1(100)
       @l = @r.range(-1,1,@d)
       @r.png "/tmp/plot.png"
       @r.par(:bg => "cornsilk")
       @r.hist(@d, :range => @l, :col => "lavender", :main => "My Plot")
       
       @r.eval_R("dev.off()")  #required for png output
       # then read the png file and deliver it to the browser
       @g = File.open("/tmp/plot.png", "rb") 
       send_file @g, :type=>"assets/images", :disposition=>'inline'
    rescue  => exc
       logger.error("Message for the log file #{exc.message}")
       flash[:error] = exc.message
       redirect_to static_pages_errorR_path, :method => :get
    end


  end
end
