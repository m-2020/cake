class Genre < ApplicationRecord

    has_one :products, dependent: :destroy

end
