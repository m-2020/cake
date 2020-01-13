class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :adresses, dependent: :destroy
    has_many :cart_products, dependent: :destroy
    has_many :orders, dependent: :destroy

    def entry_status_str
        self.entry_status ? "有効" : "退会"
	end

end
