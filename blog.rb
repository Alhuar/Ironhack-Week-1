class Blog
	attr_reader :post_container

	def initialize(posts_per_page)
		@posts_per_page = posts_per_page
		@post_container = []
		@index = 0
	end
	
	def add_post(post)
		@post_container.push(post)
	end

	def sort_posts
		@post_container.sort { |a, b| b.date <=> a.date}
	end
	
	def create_front_page
		
		posts_by_page = sort_posts.slice(@index, @index + 3)
		publish_front_page(posts_by_page)
	end
	

	def publish_front_page(array)
		array.each do |post|

		if post.sponsored == true
			puts "********#{post.title}********"
		else
			puts "#{post.title}"
		end
		puts "****************************"
		puts "#{post.text}"
		puts "----------------------------"
		end

		input = gets.chomp
		if input == "next"
			@index += 3
		end
		create_front_page
	end
end


class Post
	attr_accessor :title, :date, :text, :sponsored

	def initialize(title, date, text, sponsored)
		@title = title
		@date = date
		@text = text
		@sponsored = sponsored
	end

end

blog = Blog.new(3)
blog.add_post Post.new("Post 1 Title", "1985-04-30", "Sed ut perspiciatis unde omnis ist...", true)
blog.add_post Post.new("Post 2 Title", "1990-09-10", "Totam rem aperiam, eaque ipsa quae ab illo inventore verit...", false)
blog.add_post Post.new("Post 3 Title", "1992-05-01", "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis...", false)
blog.add_post Post.new("Post 4 Title", "1960-02-28", "Nam libero tempore, cum soluta nobis est eligendi....", false)
blog.add_post Post.new("Post 5 Title", "1978-10-28", "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis  ex ea commodi consequatur?....", true)
blog.add_post Post.new("Post 6 Title", "1988-02-18", "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis  ex ea commodi consequatur?....", true)
blog.add_post Post.new("Post 7 Title", "1973-01-05", "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis  ex ea commodi consequatur?....", true)

blog.create_front_page



