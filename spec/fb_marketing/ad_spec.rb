require 'spec_helper'

describe FbMarketing::Ad do
	let(:instance) { FbMarketing::Ad.new 'identifier', {access_token: 'ABC'} }

	context 'instance' do
		subject { instance }

		describe '#create' do
			it 'should modify identifier and POST to API' do
				expect do
					instance.create
				end.to request_to 'act_identifier/adgroups', :post
			end
		end
	end

end