class Customer < ApplicationRecord

def active_for_authentication?
    super && self.entry_status == true
end

 before_validation :before_validations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :addresses, dependent: :destroy
    has_many :cart_products, dependent: :destroy
    has_many :orders, dependent: :destroy

    validates :last_name, presence: true
    validates :first_name, presence: true
    validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :post_code, presence: true
    validates :address, presence: true
    VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
    validates :phone_number, presence: true, format: { with: VALID_PHONE_REGEX }

    def entry_status_str
        self.entry_status ? "有効" : "退会"
	end

    private
  def before_validations

    post_code.strip!
    phone_number.strip!
  end

end
