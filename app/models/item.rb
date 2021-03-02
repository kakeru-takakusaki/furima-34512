class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status

  with_options presence: true do
    validates :name
    validates :text
    validates :price
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
  end

end
