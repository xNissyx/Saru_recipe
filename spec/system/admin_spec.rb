require 'rails_helper'

RSpec.describe "Admin", type: :system do
  let(:admin) { create(:admin) }

  before do
    driven_by(:selenium_chrome_headless)
    visit new_admin_session_path
    fill_in 'Email', with: admin.email
    fill_in 'パスワード', with: admin.password
    click_on 'Log in'
    expect(page).to have_content('管理者ダッシュボード')
  end

  describe "管理者ログイン" do
    it "ログインメッセージが表示される" do
      expect(page).to have_content("ログインしました。")
    end

    it "ヘッダーの内容が変わっている" do
      find(".navbar-toggler").click
      expect(page).to have_content("管理者ログアウト")
    end
  end

  describe "管理者ダッシュボード" do
    it "コメント管理画面に遷移する" do
      click_link '全てのコメントを表示'
      expect(page).to have_content('コメント管理画面')
    end

    it "ユーザー管理画面に遷移する" do
      click_link '全てのユーザーを表示'
      expect(page).to have_content('ユーザー管理画面')
    end

    it "タグ管理画面に遷移する" do
      click_link '全てのタグを表示'
      expect(page).to have_content('タグ管理画面')
    end
  end

  describe "コメント管理画面" do
    let!(:comment) { create(:comment) }

    before do
      click_link '全てのコメントを表示'
    end

    it "コメント削除機能" do
      accept_confirm do
        click_link '', href: "/admin/comments/#{comment.id}"
      end

      expect(page).not_to have_content(comment.content)
    end
  end

  describe "ユーザー管理画面" do
    let!(:user) { create(:user) }

    before do
      click_link '全てのユーザーを表示'
    end

    it "ユーザーステータス更新機能" do
      find("#update_user_#{user.id}").click
      user.reload
      expect(user.is_deleted).to eq(true)
    end
  end

  describe "タグ管理画面" do
    let!(:tag) { create(:tag) }

    before do
      click_link '全てのタグを表示'
    end

    it "タグ削除機能" do
      accept_confirm do
        click_link "", href: "/admin/tags/#{tag.id}"
      end

      expect(page).not_to have_content(tag.name)
    end

    it "タグ作成機能" do
      fill_in '名前', with: 'new_tag'
      click_button 'タグを作成する'
      expect(page).to have_content('new_tag')
    end
  end

  describe "ログアウト" do
    it "ee" do
      find(".navbar-toggler").click
      click_on '管理者ログアウト'
      expect(page).to have_current_path(root_path)
    end
  end
end
