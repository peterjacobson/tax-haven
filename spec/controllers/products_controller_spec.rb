require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

	describe '#index' do
		
		before do
			5.times { create(:product) }
			get :index
		end

		it { should respond_with(200) }
		it { should render_template(:index) }
		it "should assign @products to all Products in DB" do
			expect(assigns(:products)).to eq(Product.all)
		end
	end

	describe '#show' do
		before do
			@product = create(:product)
			get :show, { id: @product.id }
		end

		it { should respond_with(200) }
		it { should render_template(:show) }
		it "should assign product with specified id to @product" do
			expect(assigns(:product)).to eq(@product)
		end
	end

	describe '#new' do
		before do 
			get :new
		end

		it { should respond_with(200) }
		it { should render_template(:new) }
	end

	describe '#create' do
		
		context "if valid params" do
			before do
				@product_params = attributes_for(:product)
				post :create, { product: @product_params }
			end

			it { should respond_with(302) }
			it "should redirect to the new product's page" do
				product = Product.find_by(@product_params)
				expect(response).to redirect_to("/products/#{product.id}")
			end
		end

		context "if invalid params" do
			before do
				@invalid_params = {story: 'no name'}
				post :create, { product: @invalid_params}
			end

			it { should respond_with(400) }			
			it { should render_template(:new) }
			it "should not create a new product" do
				expect(Product.where(@invalid_params)).to be_nil
			end
		end

	end
end































