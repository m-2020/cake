class Customers::ProductsController < ApplicationController


	def top
		@genres = Genre.all
	    # urlにgenre_id(params)がある場合
	    if params[:genre_id]
	      # genreのデータベースのテーブルから一致するidを取得
	      @genre = Genre.find(params[:genre_id])
	      # genre_idと紐づく投稿を取得
	      @products = @genre.products.order(created_at: :asc).page(params[:page]).reverse_order
	      @count = Product.where(genre_id: @genre.id).count
	    # urlにgenre_id(params)がない場合
	    else
	      # 投稿すべてを取得
	      @products = Product.order(created_at: :asc).page(params[:page]).reverse_order
	      @count = Product.all.count
	  	end

	end


	def index
		@genres = Genre.all
	    # urlにgenre_id(params)がある場合
	    if params[:genre_id]
	      # genreのデータベースのテーブルから一致するidを取得
	      @genre = Genre.find(params[:genre_id])
	      # genre_idと紐づく投稿を取得
	      @products = @genre.products.order(created_at: :asc).page(params[:page]).reverse_order
	      @count = Product.where(genre_id: @genre.id).count
	    # urlにgenre_id(params)がない場合
	    else
	      # 投稿すべてを取得
	      @products = Product.order(created_at: :asc).page(params[:page]).reverse_order
	      @count = Product.all.count
	    end

  	end



	def show
		@genres = Genre.all
		# urlにgenre_id(params)がある場合
	    if params[:genre_id]
	      # genreのデータベースのテーブルから一致するidを取得
	      @genre = Genre.find(params[:genre_id])
	      # genre_idと紐づく投稿を取得
	      @products = @genre.products.order(created_at: :asc).all
	    # urlにgenre_id(params)がない場合
	    else
	      # 投稿すべてを取得
	      @products = Product.order(created_at: :asc).all
	    end

		@product = Product.find(params[:id])

		@cart_product = CartProduct.new


	end



end
