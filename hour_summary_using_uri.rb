require 'benchmark'
time=Benchmark.measure do
total_time=0
g_count=Array.new(25,0)
p_count=Array.new(25,0)
g_time=Array.new(25,0)
p_time=Array.new(25,0)
track_hour=1
total_user=0
print "give URI="
user_uri=gets.chomp
somefile = File.open("Assingment_1_output.txt", "w")
file = File.new("therap.log.ms-2.2013-10-21", "r")
somefile.write "#{user_uri} URI summary \n\n\n"
while (line = file.gets)
	if line=~/#{user_uri}/ && line=~/[PROFILER:132]/
		a=line.split
		n=a.length
		s="#{a[1]}"
		hr=s.split(':')
		h=hr[0]
		hour=h.to_i+1
		method_time=a[n-1]
		method=a[n-2]
			if method=~/G/
				g_count[hour]=g_count[hour]+1
				t=method_time.sub("time=","").sub("ms","")
				time=t.to_i
				g_time[hour]=g_time[hour]+time
			end
			if method=~/P/
				p_count[hour]=p_count[hour]+1
				t=method_time.sub("time=","").sub("ms","")
				time=t.to_i
				p_time[hour]=p_time[hour]+time
			end
	end
end

i=1
 while i<=24
	g_tm=g_time[i]
	p_tm=p_time[i]
	g_cnt=g_count[i]
	p_cnt=p_count[i]
	  total_time=total_time+g_tm+p_tm
	  total_user=total_user+g_cnt+p_cnt
	 somefile.write("#{i}th hour total user#{total_user}---get reqs #{g_cnt}---post reqs#{p_cnt}---get reqs time#{g_tm}---post reqs time#{p_tm}---total time #{total_time}\n")
	 i=i+1
 end
file.close
somefile.close

end.total

print time