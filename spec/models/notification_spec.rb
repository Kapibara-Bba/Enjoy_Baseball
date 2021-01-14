require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe 'アソシエーションのテスト' do
    context 'teamモデルとの関係' do
      it '1:Nとなっている' do
        expect(Notification.reflect_on_association(:team).macro).to eq :belongs_to
      end
    end
    context 'post_commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Notification.reflect_on_association(:post_comment).macro).to eq :belongs_to
      end
    end
  end
end
