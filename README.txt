Small niceties for Ruby and Rails.

For Rails:
	Acts like a Rails plugin (has init.rb).
	Rails-specific code in lib/tidbits/rails
	
	Example usage:
	
	#validate that Person has a valid email address
	class Person < ActiveRecord::Base
		validates_presence_of :email
		validates_email							#assumes :email
	end
	
	#validate several email addresses, but only if present:
	class User < ActiveRecord::Base
		validates_email :email, :email2
	end

	#validate that Person has a valid Blog URL
	class Person < ActiveRecord::Base
		validates_presence_of :blog
		validates_uri :blog
	end

	#validate several URLs, if present
	class User < ActiveRecord::Base
		validates_uri :blog, :website
	end