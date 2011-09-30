class Order < ActiveRecord::Base
  belongs_to :cart
  has_many :transactions

  attr_accessor :card_number, :card_verification_value

  validate(:validate_card, :on => :create)
  
  def purchase
    response = STANDARD_GATEWAY.purchase(total_in_cents, credit_card, purchase_options)
    transactions.create!(:action => "purchase", :amount => total_in_cents, :response => response)
    cart.update_attribute(:purchased_at, Time.now) if response.success?
    response.success?
  end

  def total_in_cents
    (cart.total_price*100).round
  end

  private

  def purchase_options
    {
      :ip => ip_address,
      :billing_address => {
        :name     => cart.user.name,
        :address1 => cart.user.street,
        :city     => cart.user.city,
        :state    => cart.user.state,
        :country  => "US",
        :zip      => cart.user.zip
      }
    }
  end

  def validate_card
    unless credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        errors.add_to_base message
      end
    end
  end

  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
    :type               => card_type,
    :number             => card_number,
    :verification_value => card_verification_value,
    :month              => card_expires_on.month,
    :year               => card_expires_on.year,
    :first_name         => first_name,
    :last_name          => last_name
    )
  end

end


# == Schema Information
#
# Table name: orders
#
#  id              :integer         not null, primary key
#  user_id         :integer
#  ip_address      :string(255)
#  first_name      :string(255)
#  last_name       :string(255)
#  card_type       :string(255)
#  card_expires_on :date
#  created_at      :datetime
#  updated_at      :datetime
#  cart_id         :integer
#

