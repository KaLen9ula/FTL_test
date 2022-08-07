require 'rails_helper'

RSpec.describe Expense, type: :model do

  let (:user) { build(:user) }
  let (:expense) { build(:expense, user: user) }

  describe 'validations' do
    context 'name' do
      it { is_expected.to have_db_column(:title).of_type(:string) }
      it { is_expected.to have_db_column(:description).of_type(:text) }
      it { is_expected.to have_db_column(:category).of_type(:string) }
      it { is_expected.to have_db_column(:amount).of_type(:decimal) }
    end
  end
end
