require 'rails_helper' 

describe "Albums API" do 
  it 'returns a JSON collection all of albums' do 
    FactoryGirl.create_list(:album, 25) 

    get '/v1/albums'

    json = JSON.parse(response.body) 

    expect(response).to be_success 

    expect(json.length).to eq(25)
  end

  describe 'get /v1/albums/:id' do 
    it '' do 
      # album = FactoryGirl.create(:album) 
      album  = Album.create(title: 'I See You', release_date: Date.today, genre: 'Indie')

      get "/v1/albums/#{album.id}"

      json = JSON.parse(response.body)

      expect(response).to be_success 
      expect(json['id']).to eq(1) 
      expect(json['title']).to eq(album.title)
    end
  end

 describe 'post /v1/albums' do 
    it 'creates a album from post request' do 
      data = { album: { title: 'Sylvan Esso' } } 
      count = Album.count

      post "/v1/albums/", params: data 
      json = JSON.parse(response.body)
      expect(response).to have_http_status(201)

      expect(Album.count).to eq(count + 1)
      expect(json['title']).to eq('Sylvan Esso')
    end
 end

 describe 'put /v1/albums/:id' do 
    it 'updates a album from put request' do 
      album = FactoryGirl.create(:album) 
      title = album.title
      new_album_data = { album: {id: album.id, title: 'XO'} }

      put "/v1/albums/#{album.id}", params: new_album_data 
      json = JSON.parse(response.body)
    
      expect(title).to_not eq(json['title'])
      expect(response).to have_http_status(200)
    end
 end

 describe 'destroy /v1/albums/:id' do 
  it 'destroys the albums record' do 
    album =  Album.create(title: 'Purpose')
    delete "/v1/albums/#{album.id}"
    
    expect(response).to be_success 

    expect(Album.count).to eq(0)
  end
 end

 describe 'Resource not found' do 
   it 'returns 404 when album is not found' do 
      get "/v1/albums/9000" 

      expect(response.status).to eq(404) 
   end
 end
end
