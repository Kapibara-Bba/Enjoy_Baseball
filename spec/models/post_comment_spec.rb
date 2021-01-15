require 'rails_helper'

RSpec.describe PostComment, type: :model do
  describe 'アソシエーションのテスト' do
    context 'teamモデルとの関係' do
      it '1:Nとなっている' do
        expect(PostComment.reflect_on_association(:team).macro).to eq :belongs_to
      end
    end
    context 'userモデルとの関係' do
      it '1:Nとなっている' do
        expect(PostComment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'notificationモデルとの関係' do
      it '1:Nとなっている' do
        expect(PostComment.reflect_on_association(:notifications).macro).to eq :has_many
      end
    end
  end
end
