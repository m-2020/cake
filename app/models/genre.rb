class Genre < ApplicationRecord

    has_one :products, dependent: :destroy

    def display_presence_str
        self.display_presence ? "有効" : "無効"
	end

end
