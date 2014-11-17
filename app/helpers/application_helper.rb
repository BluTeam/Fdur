module ApplicationHelper
  def get_date
    Time.new.strftime('%m.%d') 
  end

  def get_week
    tmp = Time.new.strftime('%w')
    if tmp = "0"
      "周日"
    elsif tmp = "1"
      "周一"
    elsif tmp = "2"
      "周二"
    elsif tmp = "3"
      "周三"
    elsif tmp = "4"
      "周四"
    elsif tmp = "5"
      "周五"
    else
      "周六"
    end  
  end
end
