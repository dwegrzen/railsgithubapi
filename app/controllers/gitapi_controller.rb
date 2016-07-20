class GitapiController < ApplicationController

  before_action :set_page

  def index
    client = Octokit::Client.new(:access_token => ENV["octokit_token"])
    @logins = client.search_users("location:indianapolis language:ruby sort:joined-asc",page: params[:page])
    @pages = (@logins[:total_count]/30.0).ceil
    @userdata = @logins[:items].map{|x| client.user(x.login)}
  end

  def show
    client = Octokit::Client.new(:access_token => ENV["octokit_token"])
    @repos = client.search_repos("user:#{params[:user]} sort:stars",page: params[:page])
    @repopages = (@repos[:total_count]/30.0).ceil
    @repodata = @repos[:items]
  end



  private
  def set_page
    unless params[:page]
      params[:page]="1"
    end
  end



end
