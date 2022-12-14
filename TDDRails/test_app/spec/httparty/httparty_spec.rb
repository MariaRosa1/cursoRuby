describe "HTTParty" do

  it "content_type com vcr gravando novos request", vcr: { cassette_name: 'jsonplaceholder/posts', :record => :new_episodes} do
    response = HTTParty.get("https://jsonplaceholder.typicode.com/posts/7")
    content_type = response.headers['content-type']
    expect(content_type).to match(/application\/json/)
    puts content_type
  end

  it "content_type com vcr só request body", vcr: { cassette_name: 'jsonplaceholder/posts', match_requests_on: [:body]  } do
    response = HTTParty.get("https://jsonplaceholder.typicode.com/posts/5")
    content_type = response.headers['content-type']
    expect(content_type).to match(/application\/json/)
    puts content_type
  end

  # it "content_type com vcr" do
  #   VCR.use_cassette("jsonplaceholder/posts") do
  #     response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
  #     content_type = response.headers['content-type']
  #     expect(content_type).to match(/application\/json/)
  #     puts content_type
  #   end
  # end


  # it "content_type com webmock" do
  #   stub_request(:get, "https://jsonplaceholder.typicode.com/posts/2").
  #        to_return(status: 200, body: "", headers: { 'content-type': 'application/json' })

  #   response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
  #   content_type = response.headers['content-type']
  #   expect(content_type).to match(/application\/json/)
  #   puts content_type
  # end


  # it "content_type" do
  #   response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
  #   content_type = response.headers['content-type']
  #   expect(content_type).to match(/application\/json/)
  #   puts content_type
  # end
end
