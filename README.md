Description
===========

Project Monitor Helper is a Ruby utility that generates the `projects.json`
required by [Project Monitor](https://github.com/18F/project-monitor).

It uses the GitHub API to find all repos within an organization that have
a `.travis.yml`.

Setup
=====

### Prerequisites
On a Mac, you'll need a development environment that includes Git, Homebrew,
Ruby, RVM (or rbenv), and Bundler. The easiest way to make sure you have all
the prerequisite tools is to run the [18F laptop script][laptop].

[laptop]: https://github.com/18F/laptop

### Install
```
script/bootstrap
```

### Set the GitHub environment variables
1. Generate a new [GitHub access token](https://github.com/settings/tokens/new)
2. In the `.env` file, set `GITHUB_ACCESS_TOKEN` to the token you generated.
3. In `.env`, set `GITHUB_ORG` to your organization's name.


Run the script
==============

`dotenv ruby projects_generator.rb`

This will generate a `projects.json` in the root directory.
