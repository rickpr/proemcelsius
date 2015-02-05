class HomeController < ApplicationController
  def index
    @courses=Course.all.map(&:name).group_by{ |c| c.match(/^\S*/).to_s }.to_a
  end

  def theprolog
    @plan=degree_request params
    prolog=Prolego::Query.new Rails.root.join 'prolog','Top.pl'
    track=params["track"]
    courses=params["course"].reject &:empty?
    prolog.command track,["BS",courses]
    @epilog=prolog.epilog
  end

  def degree_request params
    base_url="http://degrees.unm.edu/2014-15/"
    alldegrees=HTTParty.get "#{base_url}show_all_undergrad_programs.json"
    degree=alldegrees.find { |d| d["name"]==Predicate.find_by_prolog(params["track"]).name }
    ptype=degree["program_types"].find { |p| p["program_type"] =~ /#{params["program"]}/ }
    HTTParty.get([base_url,degree["name"],
                  degree["degree"],
                  ptype["program_type"]].map { |u| URI.escape u }
    .join("/")+".json")["terms"].map { |d| d["requirements"] }
  end

end
