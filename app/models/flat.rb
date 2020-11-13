class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings

  # For searching only in the Flar model:
  # include PgSearch::Model
  # pg_search_scope :search_by_name_and_address_and_price_and_description,
  #   against: [ :name, :address, :price, :description ],
  #   associated_against: {
  #     user: [ :first_name, :last_name ]
  #      },
  #   using: {
  #     tsearch: { prefix: true } # <-- now `superman batm` will return something!
  # }

  # Multisearch (flat and user model)
  include PgSearch::Model
  multisearchable against: [:name, :description, :address, :price]
end
