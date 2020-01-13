class Genre < ApplicationRecord

    has_many :products, dependent: :destroy

    def display_presence_str
        self.display_presence ? "有効" : "無効"
	end

end
