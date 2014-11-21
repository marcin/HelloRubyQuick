class SayController < ApplicationController
  
  def hello
  	@time = Time.now
  	@files = quick_sort(Dir.glob '*')
  	#files = (Dir.glob '*').sort { |a, b| a.upcase <=> b.upcase }
  end

  def goodbye
  end

	#returns array of (distinct) strings sorted lexicographically
	def quick_sort str_arr
		return str_arr if str_arr.length <= 1
		pivot = str_arr.length/2
		less = []
		greater = []	
		#could have used polish flag algorithm (more memory-efficent, but less concise)
		str_arr.each do |str|
			temp = str.upcase <=> str_arr[pivot].upcase
			if temp < 0 
				less << str
			elsif temp > 0
				greater << str
			end
		end
		quick_sort(less) + [str_arr[pivot]] + quick_sort(greater)
	end

end
