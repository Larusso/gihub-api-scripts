require 'octokit'

client = Octokit::Client::new(access_token:ENV["TOKEN"])
client.auto_paginate = true

result = client.organization_repositories(ARGV[0])

puts "cleanup pull request branches"
result.select{|repo| repo.name.start_with? ARGV[1]}.each {|repo|
  branches = client.branches(repo.id).select{|branch| branch.name.start_with? ARGV[2]}
  puts "#{ARGV[0]}/#{repo.name} PR branches" unless branches.size() == 0
  branches.each {|branch|
    puts branch.name
    client.delete_branch(repo.id, branch.name)
  }
}