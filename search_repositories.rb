require 'octokit'

client = Octokit::Client::new(access_token:ENV["TOKEN"])
client.auto_paginate = true

result = client.search_repositories(ARGV[0], sort: 'updated', order: 'asc')

puts "name,url,last_updated"
result.items.each {|repo|
  puts "wooga/#{repo.name},#{repo.html_url},#{repo.pushed_at}"
}