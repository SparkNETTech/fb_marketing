require 'spec_helper'
require 'yaml'

# @test = YAML.load(File.join(File.dirname(__FILE__), 'spec/mock_ruby', "object_story_spec.yml"))
@test = YAML.load(File.read(File.join(File.dirname(__FILE__), '../mock_ruby', "object_story_spec.yml")))
puts @test

describe FbMarketing::AdCreative do
	let(:instance) { FbMarketing::AdCreative.new 'identifier', {access_token: 'ABC'} }
	let(:instance_with_data) { FbMarketing::AdCreative.new 'identifier', {access_token: 'ABC', object_story_spec: @test} }

	context 'instance' do
		subject { instance }

		describe '#initialize' do
			its(:id) { should == 'identifier' }
			its(:access_token) { should == 'ABC' }
			its(:raw_attributes) { should == {access_token: 'ABC'} }
		end

		# context 'with data' do
		# 	subject { instance_with_data }

		# 	describe '#initialize' do
		# 		its(:object_story_spec) { should be_kind_of(Object) }
		# 	end
		# end

		describe '#create' do
			it 'should modify identifier and POST to API' do
				puts @test
				expect do
					instance.create
				end.to request_to 'act_identifier/adcreatives', :post
			end
		end
	end

end