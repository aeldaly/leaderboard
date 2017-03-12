# frozen_string_literal: true
require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #log' do
    let!(:player_1) { create(:user) }
    let!(:player_2) { create(:user) }
    let!(:player_3) { create(:user) }

    before do
      sign_in player_3
      get :log
    end

    it { expect(assigns(:opponents).size).to eql 2 }
    it { expect(assigns(:opponents).include?(player_3)).to be false }
  end
end
