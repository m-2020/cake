class Customers::ProductsController < ApplicationController
	def top

	end

  	def index
	    # urlにproduct_id(params)がある場合
	    if params[:product_id]
	      # productのデータベースのテーブルから一致するidを取得
	      @product = Product.find(params[:product_id])
	      # product_idと紐づく投稿を取得
	      @genres = @product.genres.all
	    # urlにproduct_id(params)がない場合
	    else
	      # 投稿すべてを取得
	      @genres = Genre.all
	    end

	    @products = Product.all
  	end

	def show
		@genres = Genre.all
		@product = Product.find(params[:id])
		tax = 1.1
		@product_price = Product.select("price")
	end


	private
	def product_params
		params.require(:product).permit(:genre_id, :name, :price, :image_id, :text, :sale_status, :quantity)
	end
end
