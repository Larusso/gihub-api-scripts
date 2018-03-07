ARGF.readlines.each do |line|
  puts "repo: https://api.github.com/repos/#{line.chomp}/topics"
  `curl https://api.github.com/repos/#{line.chomp}/topics -X PUT -H "Authorization: token #{ENV['TOKEN']}" -H "Accept: application/vnd.github.mercy-preview+json" -H "Content-Type: application/json" -d '{"names":["#{ARGV[0]}"]}'`
end
