## Application deployment configuration
set :server,      'QA_SERVER'
set :users, 'QA_USER'
set :deploy_to,   -> { "/srv/services/#{fetch(:users)}" }
set :log_level,   :debug

## Server configuration
server fetch(:server), users: fetch(:users), roles: %w{web app db}

## Additional tasks
namespace :deploy do
  task :seed do
    on primary :db do within current_path do with rails_env: fetch(:stage) do
      execute :rake, 'db:seed'
    end end end
  end
end
