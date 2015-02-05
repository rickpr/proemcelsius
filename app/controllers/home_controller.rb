class HomeController < ApplicationController
  def index
    @courses=(Course.all.map(&:name).group_by { |c| c.match(/^\S*/)[0] }).to_a
  end

  def theprolog
    prolog=Prolego::Query.new Rails.root.join 'prolog','Top.pl'
    track=params["track"]
    courses=params["course"].reject &:empty?
    prolog.command track,["BS",courses]
    @epilog=prolog.epilog
  end
end
