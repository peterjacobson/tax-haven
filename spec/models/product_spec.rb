require 'rails_helper'

RSpec.describe Product, type: :model do
	let(:product) {create(:product)}

	describe "fields" do
		it { should have_db_column(:name).of_type(:string) }
	end

	describe "validations" do
		it { should validate_presence_of(:name)}
	end
end
