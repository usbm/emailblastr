require 'capistrano/ext/multistage'
require 'bundler/capistrano'

set :application, "emailblastr"
set :user, "rails"
set :use_sudo, false
set :repository,  "git@github.com:usbm/emailblastr.git"

set :scm, :git

set :stages, %w(staging production)

role :web, "emailblastr.com"
role :app, "emailblastr.com"
role :db,  "emailblastr.com", :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end