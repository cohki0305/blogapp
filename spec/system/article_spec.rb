require 'rails_helper'

RSpec.describe 'Article', type: :system do
  let!(:user) { create(:user) }
  let!(:articles) { create_list(:article, 3, user: user) }

  it '記事一覧がひょうじされる' do
    visit root_path
    articles.each do |article|
      expect(page).to have_content(article.title)
    end
  end
end
