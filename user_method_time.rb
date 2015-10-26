require 'benchmark'
time=Benchmark.measure do
g_time=0
p_time=0
print "give user_id:"
user_id=gets.chomp
somefile = File.open("Assingment_2_output.txt", "w")
file = File.new("therap.log.ms-2.2013-10-21", "r")
while (line = file.gets)
	if line=~/#{user_id}/ && line=~/[PROFILER:132]/
		a=line.split
		i=0
		n=a.length
		while i<n
			s="#{a[i]}"
			u=s.split('')
			b="#{a[i]}"
			b=s.split('')
			if b[0]=='P'
				i=i+1
				s="#{a[i]}"
				b=s.split('')
				if b[0]=='t'
					t=s.sub("time=","").sub("ms","")
					time=t.to_i
					p_time=p_time+time
				end
			end
			if b[0]=='G'
				i=i+1
				s="#{a[i]}"
				b=s.split('')
				if b[0]=='t'
					t=s.sub("time=","").sub("ms","")
					time=t.to_i
					g_time=g_time+time
				end
			end
		i=i+1
		end
	end	
end
somefile.write "#{user_id} user get method time: #{g_time}ms\n#{user_id} user post method time:#{p_time}ms\ntotal time: #{p_time+g_time}ms"
file.close
somefile.close
end.total

print time