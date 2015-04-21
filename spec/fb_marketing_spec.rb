require 'spec_helper'

describe FbMarketing do
	subject { FbMarketing }

	context 'as default' do
		its(:api_version) { should == 'v2.3' }
		its(:root_url) { should == 'https://graph.facebook.com' }
		its(:object_classes) { should contain_exactly *FbMarketing::Node.subclasses }
	end

end