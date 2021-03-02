class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
    validates :name
    validates :text
    validates :price
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
  end

end
