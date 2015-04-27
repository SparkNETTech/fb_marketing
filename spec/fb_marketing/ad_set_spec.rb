require 'spec_helper'

describe FbMarketing::AdSet do
	let(:instance) { FbMarketing::AdSet.new 'identifier', {access_token: 'ABC'} }

	context 'instance' do
		subject { instance }

		describe '#create' do
			it 'should modify identifier and POST to API' do
				expect do
					instance.create
				end.to request_to 'act_identifier/adcampaigns', :post
			end
		end
	end

end