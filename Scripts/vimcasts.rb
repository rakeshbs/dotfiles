require 'open-uri'

ROOT_URL = "http://media.vimcasts.org/videos/"

(1..70).each do |cast_number|
  cast_url = ROOT_URL + cast_number.to_s + "/"
  open(cast_url) do |f|
    page_string = f.read
    page_string.scan (/href=\"(.+\.m4v)\"/) do |m4v_file|
      video_link = cast_url + m4v_file[0]
      system("wget #{video_link} -O \"#{cast_number.to_s} - #{m4v_file[0]}\"")
    end

  end
end
# >> "http://media.vimcasts.org/videos/1/show_invisibles.m4v"
