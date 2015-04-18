class HomesController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def who_we_are
  end

  def how_eve_work
  end

  def contacts
  end
  
  def payment

  	require "rubygems"
	require "active_merchant"
	require "active_merchant/billing/rails"

	ActiveMerchant::Billing::Base.mode = :test

	gateway = ActiveMerchant::Billing::PaypalGateway.new(
	  :login => "arvindyuvasoft112-facilitator_api1.gmail.com",
	  :password => "1381412536",
	  :signature => "ABAXPA6E4bx7kbvfR8FDomA.2M5UAw9Go1aCM--SvoBUePOuS8x0sLbZ"
	)

 #  gateway = ActiveMerchant::Billing::PaypalGateway.new(
	#   :login => "sandeepstar.up-facilitator_api1.gmail.com",
	#   :password => "E5DQ28R8ABP6KBS8",
	#   :signature => "AFcWxV21C7fd0v3bYYYRCpSSRl31AXkUXrt-1T-2oVAjm78zrKUCQzQK"
	# )

	credit_card = ActiveMerchant::Billing::CreditCard.new(
	  :type               => "Visa",
	  :number             => "4032033298941787",
	  :verification_value => "111",
	  :month              => 4,
	  :year               => 2020,
	  :first_name         => "sandeep",
	  :last_name          => "chauhan"
	)

	if credit_card.valid?
	  # or gateway.purchase to do both authorize and capture
	  response = gateway.authorize(1000, credit_card, :ip => "127.0.0.1")
	  if response.success?
	    gateway.capture(1000, response.authorization)
	    puts "Purchase complete!"
	    render text: "Success"
	  else
	    puts "Error: #{response.message}"
	    render text: "Faild #{response.message}"
	  end
	else
	  puts "Error: credit card is not valid. #{credit_card.errors.full_messages.join('. ')}"
	  render text: "Faildddddddddddddd #{response.message}"

	  end
	end
end
