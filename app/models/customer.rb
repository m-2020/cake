class Customer < ApplicationRecord
 before_validation :before_validations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :adresses, dependent: :destroy
    has_many :cart_products, dependent: :destroy
    has_many :orders, dependent: :destroy

    validates :last_name, presence: true
    validates :first_name, presence: true
    validates :last_name_kana, presence: true
    validates :first_name_kana, presence: true
    validates :post_code, presence: true
    validates :address, presence: true
    validates :phone_number, presence: true
    validates :tel,numericality: { only_integer: true}

    def entry_status_str
        self.entry_status ? "有効" : "退会"
	end

    private
  def before_validations

    post_code.strip!
    phone_number.strip!
  end

end
