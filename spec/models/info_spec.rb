require 'rails_helper'

RSpec.describe Info, type: :model do
  describe 'アソシエーションのテスト' do
    context 'teamモデルとの関係' do
      it '1:Nとなっている' do
        expect(Info.reflect_on_association(:team).macro).to eq :belongs_to
      end
    end
  end
end
