require 'spec_helper'

describe FbMarketing::Node do
	let(:klass) { FbMarketing::Node }
	let(:instance) { klass.new 'identifier', {access_token: 'ABC'} }

	describe 'API Versioning' do
		before do
			@original = FbMarketing.api_version
		end

		after do
			FbMarketing.api_version = @original
		end

		describe 'via global setting' do
			before do
				FbMarketing.api_version = 'v2.x'
			end

			describe '#update' do
				it 'should use api_version globally' do
					expect do
						instance.update
					end.to request_to 'v2.x/identifier', :post, disable_api_versioning: true
				end
			end
		end

		describe 'via per-call option' do
			describe '#update' do
				it 'should use api_version locally' do
					expect do
						instance.update api_version: 'v2.y'
					end.to request_to 'v2.y/identifier', :post, disable_api_versioning: true
				end
			end
		end
	end

	# context 'class' do
	# 	subject { klass }
	# 	it { should_not respond_to :register_attributes }
	# 	it { should_not respond_to :registered_attributes_test }
	# 	it { should_not respond_to :registered_attributes_test= }
	# end

	context 'instance' do
		subject { instance }
		it { should respond_to :assign }

		describe '#initialize' do
			its(:id) { should == 'identifier' }
			its(:access_token) { should == 'ABC' }
			its(:raw_attributes) { should == {access_token: 'ABC'} }
		end

		describe '#update' do
			it 'should call API with POST method' do
				expect do
					instance.update
				end.to request_to 'identifier', :post
			end
		end
	end

end