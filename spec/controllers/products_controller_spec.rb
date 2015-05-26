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
end

