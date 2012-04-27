#该类需重写

class AddBooks

	def self.create_books
		agent = Mechanize.new
		agent.user_agent = "Season"
		[0,20,40,80,100].each do |url_param|
			url = "http://book.douban.com/tag/web?start=#{url_param}&type=T"
			doc = agent.get(url).parser
			
			doc.css(".item").each do |item|
				title = item.css(".nbg")[0].attributes["title"].text
				book = Book.find(:all , :conditions => ["name = ?" , title]).first
				begin
				if book.nil?
					book = Book.new
					book.name = title
					book.otherinfo = item.css(".pl")[0].text
					image_url = item.css(".nbg img")[0]
					file_name = image_url.attributes["src"].text.split("/").last
					book.imageurl = "booksimage/" + file_name
					image_file = agent.get(image_url.attributes["src"].text)
					image_file.save("D:\\xiangshuwang\\app\\assets\\images\\booksimage\\#{file_name}")
					book.save
				else
					book.otherinfo = item.css(".pl")[0].text
					image_url = item.css(".nbg img")[0]
					file_name = image_url.attributes["src"].text.split("/").last
					book.imageurl = "booksimage/" + file_name
					image_file = agent.get(image_url.attributes["src"].text)
					image_file.save("D:\\xiangshuwang\\app\\assets\\images\\booksimage\\#{file_name}")
					book.save
				end
				
				rescue 
					retry if true
				end
			end
		end
	end
	
end
