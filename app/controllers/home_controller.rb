class HomeController < ApplicationController
  def index
    @courses=Course.all.map(&:name).group_by{ |c| c.match(/^\S*/).to_s }.to_a
  end

  def theprolog
    plan=degree_request params
    prolog=Prolego::Query.new Rails.root.join 'prolog','Top.pl'
    track=params["track"]
    courses=params["course"].reject &:empty?
    courses += course_request(params["unmid"]) unless params["unmid"].empty?
    puts courses
    prolog.command track,["BS",courses]
    @epilog=prolog.epilog
    @plan=compare_reqs @epilog,plan
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

  def course_request unmid
    response = JSON.parse HTTParty.get("http://oias1.unm.edu:4567/student_check/#{unmid}") rescue [] 
    response.map{ |c| c["course_name"] + " " + c["course_number"] }.uniq
  end

  def compare_reqs reqs,plan
    prettyplan=[]
    complete = reqs.reject { |r| r =~ /NOT/ }
    courses = complete.select { |c| c =~ /\d/ }
    puts longreqs = complete.reject{ |c| c =~ /\d/ }.map { |c| c+" Core" }
    plan.each.with_index 1 do |term,index|
      prettyterm=[]
      term.each do |course|
        flag=false
        if course["name"] =~ /:/
          flag = true if courses.map{ |c| c.match(/^.*\d+/).to_s}.include? course["name"].split(":").first
        else
          longreqs.each do |req|
            comparison=course["name"].split(/[^[:alpha:]]/)+req.split(/[^[:alpha:]]/)
            flag = true if comparison.length - comparison.uniq.length > 1
          end
        end
        prettyterm.push({ name: course["name"], satisfied: flag })
      end
      prettyplan.push({ term: index, reqs: prettyterm })
    end
    prettyplan
  end

end
