require 'octokit'

Octokit.configure do |c|
  c.access_token = ENV['GITHUB_ACCESS_TOKEN']
  c.auto_paginate = true
end
