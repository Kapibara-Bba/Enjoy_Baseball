require 'rails_helper'
describe 'チーム作成のテスト' do
  let(:user) { create(:user) }
  let!(:team) { create(:team) }
  before do
    visit new_team_path
  end
  context 'チーム新規登録画面' do
    it '新規登録に成功する' do
      fill_in 'team[teamname]', with: Faker::Lorem.characters(number:10)
      fill_in 'team[prefecture_code]', with: Faker::Adress.rand(1..47)
      fill_in 'team[city]', with: '福岡市'
    end
    it '新規登録に失敗する' do
      fill_in 'team_teamname', with: ''
      fill_in 'team_prefecture_code', with: ''
      fill_in 'team_city', with: ''
    end
  end
end
