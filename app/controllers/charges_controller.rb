class ChargesController < ApplicationController
  def new
  end

  def create
   
    @amount = (params[:amount].to_i * 100)
 
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => (@amount),
      :description => 'Rails Stripe customer',
      :currency    => 'aud'
    )
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path 
 
 end
 
end
