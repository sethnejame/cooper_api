
RSpec.describe User, type: :model do
  it "should have a valid Factory" do
    expect(create(:user)).to be_valid
  end
end
