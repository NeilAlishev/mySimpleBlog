5.times do
  user = FactoryGirl.create(:user)
  10.times do
    FactoryGirl.create(:article, user_id: user.id)
  end
end
