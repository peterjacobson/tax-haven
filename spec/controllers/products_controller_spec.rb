require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

	describe '#index' do
		
		before do
			5.times { Product.create }
			get :index
		end

		it { should respond_with(200) }
		it { should render_template(:index) }
		it "should assign @products to all Products in DB" do
			expect(assigns(:products)).to eq(Product.all)
		end
	end

end
