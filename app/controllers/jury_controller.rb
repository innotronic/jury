class JuryController < ApplicationController

  before_action :current_judge
  
  
  def main
    @score = Score.new
    render layout: false
  end
  
  
  def score
    @score = Score.new( params.permit( :contestant_id, :value ))
    @score.judge = current_judge
    
    if @score.save
      render json: :show, status: :created, location: @score
    else
      render json: @score.errors, status: :unprocessable_entity
    end
  end
  
  
  def judge
    current_judge_id = params[ 'current_judge_id' ]
    
    if judge = Judge.find_by( id: current_judge_id )
      session[ :current_judge_id ] = judge.id
    end
    
    redirect_to jury_path
  end
  
  
  private
  
    def current_judge
      @current_judge ||= session[ :current_judge_id ] && Judge.find_by( id: session[ :current_judge_id ] )
    end
end
