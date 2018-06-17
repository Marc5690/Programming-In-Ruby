class CalculationController < ApplicationController

  #Begin by following "http://localhost:3000/calculation/enter" and entering two numbers. Rails form elements should guarantee that only numbers get through.
  #If the parameters exist, then proceed to render "calculate"
  def enter
	@num1 = params[:num1]
  	@num2 = params[:num2]
  	if @num1 && @num2 then render "calculate" end
  end

  #Here, the method expects two parameters, which should alreayd be numbers. If they are not, they are cast to numbers.
  #Based on the mathematical function chosen, this method should receive one of four parameters that will tell this
  #method what to do with the numbers (add them, subtract them, etc.). If the user attempts to get to this controller/view without
  #first visiting the enter view/controller, the errorhandling page will be shown, along with a flash message error.
  def calculate
  	@num1 = params[:num1].to_i
  	@num2 = params[:num2].to_i

  	if params[:addition] then
        @result = @num1 + @num2
    elsif params[:subtraction] then
        @result = @num1 - @num2
    elsif params[:multiplication] then
        @result = @num1 * @num2
    elsif params[:division] then
        @result = @num1/@num2
    else
    	render "errorhandling"
    	flash[:error] = "Couldn't calculate!"
    end
  	
  end

  #This method/view is only used when the user visits "http://localhost:3000/calculation/calculate" directly.
  #The view displays an error message and allows the user to return to the first page.
  def errorhandling
  end
end
