describe "Test Double" do
  it "--" do
    user = double("User")
    # allow(user).to receive_messages(name: 'Maria', password:"123")
    allow(user).to receive(:name).and_return('Maria')
    allow(user).to receive(:password).and_return('1235')
    puts user.name
    puts user.password
  end
end
