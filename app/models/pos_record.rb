class PosRecord < ApplicationRecord
  belongs_to :student
  has_many :items

  validates :total, presence: true

  def receipt
    @item = TransactionItem.where(:pos_record_id === id)
    Receipt::Receipt.new(
      id: id,
      subheading: "RECEIPT FOR CHARGE #%{id}",
      product: "",
      company: {
        name: "Fusion Martial Arts"
        address: "8511 W Overland Rd \nBoise, ID 83709"
        email: "traditionalata@gmail.com",
      },
      line_items: [
        ["Product", item[:name]],
        ["Amount", item[:price]]
      ]
    )
  end
end
