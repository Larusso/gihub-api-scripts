require 'octokit'

client = Octokit::Client::new(access_token:ENV["TOKEN"])
client.auto_paginate = true

result = client.search_repositories(ARGV[0], sort: 'updated', order: 'asc')

puts "found #{result.items.size} repos to delete"
result.items.each {|repo|
  puts "delete repository #{repo.full_name}"
  client.delete_repository(repo.full_name)
}