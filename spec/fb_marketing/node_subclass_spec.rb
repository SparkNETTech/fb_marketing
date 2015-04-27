require 'spec_helper'

module FbMarketing
  class NodeSubClass < Node
  end
end

describe FbMarketing::NodeSubClass do
  let(:klass) { FbMarketing::NodeSubClass }
  let(:instance) { klass.new 'identifier' }

  context 'class' do
    subject { klass }
    it { should respond_to :register_attributes }
    it { should respond_to :registered_attributes_test }
    it { should respond_to :registered_attributes_test= }
  end

  context 'instance' do
    subject { instance }
    it { should respond_to :assign }
  end
end