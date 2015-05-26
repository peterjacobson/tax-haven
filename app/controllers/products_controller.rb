class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def new
		@product = Product.new #hack
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to product_path(@product)
		else
			render 'new', status: 400
		end
	end

	private

		def product_params
			params.require(:product).permit(:name, :story, :image_url, :cost)
		end
end
