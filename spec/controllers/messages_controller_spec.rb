require 'rails_helper'
describe MessagesController do
  let(:group) { create(:group) }
  let(:user) { create(:user) }

  describe '#index' do
    context "ログインしている場合" do
      before do
        login user
        get :index, params: { group_id: group.id }
      end

      it "@messageに期待した値が入っているか" do
        expect(assigns(:message)).to be_a_new(Message)
      end

      it "@groupに期待した値が入っているか" do
        expect(assigns(:group)).to eq group
      end

      it "該当するビューが作られているか（index.html.hamlに遷移するか）" do
        expect(response).to render_template :index
      end
    end

    context "ログインしてない場合" do
      before do
        get :index, params: { group_id: group.id }
      end

      it "ログイン画面にリダイレクトすること" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end