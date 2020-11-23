class RecordsController < ApplicationController
  
  def batter_index
    @user = User.all
    @records = Record.all
  end
  
  def pitch_index
    @user = User.all
    @records = Record.all
  end
  
end
