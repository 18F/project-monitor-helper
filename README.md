Setup
=====

### Prerequisites
On a Mac, you'll need a development environment that includes Git, Homebrew,
and Ruby. The easiest way to make sure you have all the
prerequisite tools is to run the [18F laptop script][laptop].

[laptop]: https://github.com/18F/laptop

### Set the GitHub environment variables
1. Generate a new [GitHub access token](https://github.com/settings/tokens/new)
2. Create a `.env` file in the root of the project and set the variables to
your GitHub username and access token:
```
GITHUB_LOGIN=[username]
GITHUB_PASSWORD=[access token]
```

Run the script
==============

`dotenv ruby octokit.rb`
