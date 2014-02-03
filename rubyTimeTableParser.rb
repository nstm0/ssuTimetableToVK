require 'open-uri'
require './rubyVkTable'


File.open("timetable.html",'w') { |file| 
	content = open('http://www.sgu.ru/schedule/knt/do/151') {
	|f| f.each_line{|line| file.write(line)}
}
}

timetable = File.open("timetable.html",'r', :encoding => "utf-8") #куда без еботы с русским языком?

mytable = String.new()

timetable.each_line {|line|
	if line=~/\b id='schedule'/ then
		mytable = line
	end
}

mytable = mytable.sub(/.*?(?=<tr>)/,"")
mytable = mytable.gsub(/<([a-z][a-z0-9]*)[^>]*?(\/?)>/i,"")
mytable = mytable.gsub(/<\/table>.*$/,"")

result = File.open("result.txt","w")
tc = TableConstrutor.new(result)
