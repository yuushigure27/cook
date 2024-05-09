class Admin::HomesController < ApplicationController
 before_action :authenticate_admin!
  def top
    # topアクションの処理を記述
  end
end