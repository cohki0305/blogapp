require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'タイトルと内容が入力されていれば、記事を保存できる' do
    user = User.create!({
      email: 'test@example.com',
      password: 'password'
    })
    article = user.articles.build({
      title: Faker::Lorem.characters(number: 10),
      content: Faker::Lorem.characters(number: 300)
    })

    expect(article).to be_valid
  end
end
