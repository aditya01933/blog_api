require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_uniqueness_of(:name) }
  it { should_not allow_value('Ad!@@ Ad').for(:name) }
  it { should allow_value('Foo').for(:name) }
end
