class TreatController < ApplicationController
  def trick
  	flash[:notice] = "You were TRICKED! Hahaha! There was no second option!"
  	redirect_to :controller => 'calculation', :action => 'enter', flash: {notice: "You were TRICKED! Hahaha!"}
  end
end
