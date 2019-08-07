require 'rails_helper'

RSpec.describe PerformanceData, type: :model do
  context 'Database table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :data }
  end

  context 'Relations' do
    it { is_expected.to belong_to :user }
  end
end
