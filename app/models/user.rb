class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :username

  def change_balance(params)
    if !!params[:deposite]
      amount = params[:deposite].to_i
      total = user.balance.to_i + amount
    else
      amount = params[:withdraw].to_i
      total = user.balance.to_i - amount
    end
  end
end
