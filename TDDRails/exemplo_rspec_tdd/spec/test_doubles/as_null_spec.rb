describe "Test Double" do
  it "As null object" do
    user = double("User").as_null_object
    # allow(user).to receive_messages(name: 'Maria', password:"123")
    allow(user).to receive(:name).and_return('Maria')
    allow(user).to receive(:password).and_return('1235')
    puts user.name
    puts user.password
    user.abc
  end
end