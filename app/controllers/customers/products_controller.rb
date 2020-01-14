class Customers::ProductsController < ApplicationController


	def top
		@genres = Genre.all
	    # urlにgenre_id(params)がある場合
	    if params[:genre_id]
	      # genreのデータベースのテーブルから一致するidを取得
	      @genre = Genre.find(params[:genre_id])
	      # genre_idと紐づく投稿を取得
	      @products = @genre.products.order(created_at: :desc).all
	    # urlにgenre_id(params)がない場合
	    else
	      # 投稿すべてを取得
	      @products = Product.order(created_at: :desc).all
	    end
	end


	def index
		@genres = Genre.all
	    # urlにgenre_id(params)がある場合
	    if params[:genre_id]
	      # genreのデータベースのテーブルから一致するidを取得
	      @genre = Genre.find(params[:genre_id])
	      # genre_idと紐づく投稿を取得
	      @products = @genre.products.order(created_at: :desc).all
	    # urlにgenre_id(params)がない場合
	    else
	      # 投稿すべてを取得
	      @products = Product.order(created_at: :desc).all
	    end
  	end



	def show
		@genres = Genre.all
		# urlにgenre_id(params)がある場合
	    if params[:genre_id]
	      # genreのデータベースのテーブルから一致するidを取得
	      @genre = Genre.find(params[:genre_id])
	      # genre_idと紐づく投稿を取得
	      @products = @genre.products.order(created_at: :desc).all
	    # urlにgenre_id(params)がない場合
	    else
	      # 投稿すべてを取得
	      @products = Product.order(created_at: :desc).all
	    end

		@product = Product.find(params[:id])
		tax = 1.1
		@product_price = Product.select("price")
	end


	# private
	# def product_params
	# 	params.require(:product).permit(:genre_id, :name, :price, :image_id, :text, :sale_status, :quantity)
	# end

end
