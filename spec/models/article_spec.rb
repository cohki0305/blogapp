require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'タイトルと内容が入力されている場合' do
    before do
      user = User.create!({
        email: 'test@example.com',
        password: 'password'
      })
      @article = user.articles.build({
        title: Faker::Lorem.characters(number: 10),
        content: Faker::Lorem.characters(number: 300)
      })
    end

    it '記事を保存できる' do
      expect(@article).to be_valid
    end
  end
end
