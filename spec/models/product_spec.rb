require 'rails_helper'

RSpec.describe Product, type: :model do
	let(:product) {create(:product)}
	let(:transport_tax) {create(:transport_tax)}
	let(:landfill_tax) {create(:landfill_tax)}
	subject { 
		product.taxes << transport_tax
		product.taxes << landfill_tax
	}

	describe "fields" do
		it { should have_db_column(:name).of_type(:string) }
	end

	describe "validations" do
		it { should validate_presence_of(:name)}
	end

	describe "relations" do
		subject
		# it { }
	end
end
