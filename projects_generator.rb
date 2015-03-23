require_relative 'octokit_config'
require 'json'

class ProjectsGenerator
  @@travis_repos ||= []

  def self.generate_projects_json
    add_search_results_to_travis_repos
    add_forked_repos
    write_travis_repos_to_json_file
  end

  private

  def self.add_search_results_to_travis_repos
    travis_search_results.items.each do |item|
      @@travis_repos << hash_for(item.repository)
    end
  end

  def self.travis_search_results
    @results ||= Octokit.search_code("language user:#{org_name} filename:travis", per_page: 100)
  end

  def self.add_forked_repos
    forked_repos.each do |repo|
      begin
        Octokit.contents("#{org_name}/#{repo.name}", path: '.travis.yml')
        @@travis_repos << hash_for(repo)
      rescue Octokit::NotFound
      end
    end
  end

  def self.forked_repos
    @forked_repos ||= Octokit.org_repos "#{org_name}", type: 'forks'
  end

  def self.hash_for(repo)
    {
      'name' => repo.name,
      'guid' => repo.name.gsub(/_|\./, '-'),
      'travis url' => "https://travis-ci.org/#{org_name}/#{repo.name}"
    }
  end

  def self.write_travis_repos_to_json_file
    File.open('projects.json', 'w') do |f|
      f.write JSON.pretty_generate(@@travis_repos.uniq.sort_by { |h| h[:name] })
    end
  end

  def self.org_name
    ENV['GITHUB_ORG']
  end
end

ProjectsGenerator.generate_projects_json
