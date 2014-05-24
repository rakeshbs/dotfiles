filename = ARGV[0]
links_list = File.readlines(filename)

while links_list.count > 0
	link = links_list[0]
 	 system("viddl-rb "+link+" --save-dir ~/DownloadedVideos --quality *:720:* --downloader aria2c")

  	links_list.shift
  
 	 File.open(filename, "w+") do |f|
  		links_list.each { |element| f.puts(element) }
  		f.close
	end

end
