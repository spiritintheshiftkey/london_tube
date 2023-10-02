class OysterCard < ApplicationRecord
  has_many :journeys, -> { order(created_at: :desc) }
  validates :balance_pence, numericality: { greater_than_or_equal_to: 0 }
  
  def balance_pounds
    balance_pence / 100.0
  end

  def add_pounds(pounds)
    update!(balance_pence: balance_pence + 100 * pounds)
  end

  def charge(amount_pence, entry_station = nil)
    ActiveRecord::Base.transaction do
      # If journey would cause negative balance, update will fail validation
      # and the transaction will roll back
      update!(balance_pence: balance_pence - amount_pence)
      journeys.create!(amount_pence:, entry_station:)
    end
  end
end
