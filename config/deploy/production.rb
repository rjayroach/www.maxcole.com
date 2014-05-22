set :stage, :production

server "www.maxcole.com",
  user: 'maxcole',
  roles: %w{app web db},
  ssh_options: {
    #verbose: :debug, # add this to find exact issue when your deployment fails
    forward_agent: true
  }

