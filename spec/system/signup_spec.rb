require 'rails_helper'

RSpec.describe "登録からレシピ投稿までのテスト", type: :system do
  let(:user) { create(:user) }

  before do
    driven_by(:selenium_chrome_headless)
  end

  describe 'ユーザーが新規登録し、レシピを投稿する' do
    before do
      visit new_user_registration_path
      fill_in 'ユーザーネーム', with: 'Alice'
      fill_in 'Eメール', with: 'Alice@example.com'
      fill_in 'パスワード', with: 'password'
      fill_in 'パスワード(確認用)', with: 'password'
      click_on '登録'
    end

    it 'マイページに登録したユーザー名が表示される' do
      expect(page).to have_content 'Alice'
    end

    context 'レシピ投稿画面で' do
      before do
        visit new_recipe_path
        fill_in 'レシピ名', with: 'Test Recipe'
        fill_in 'レシピの作り方', with: 'This is a test recipe.'
        click_on '投稿'
      end

      it '投稿したレシピ名が表示される' do
        expect(page).to have_content 'Test Recipe'
      end
    end
  end

  describe 'ユーザーがレシピをブックマークする' do
    let!(:recipe) { create(:recipe) }

    before do
      visit recipes_path
    end

    it 'レシピが表示されている' do
      expect(page).to have_content(recipe.title)
    end

    it 'レシピをクリックすると、該当レシピのページに飛ぶ' do
      click_link recipe.title
      expect(current_path).to eq("/recipes/#{recipe.id}")
    end
  end
end
