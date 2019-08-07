RSpec.describe 'User Registration', type: :request do
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }

  context 'with valid credentials' do
    it 'returns a user and a token' do
      post '/api/v1/auth', params: { email: 'fatbob@gmail.com',
                                      password: 'password',
                                      password_confirmation: 'password'
                                    }, headers: headers
                                    
                                    
      expect(response_json['status']).to eq 'success'
      expect(response.status).to eq 200
    end
  end

  context 'returns an error message when user submits' do
    it 'non-matching password confirmation' do
      post '/api/v1/auth', params: { email: 'hackerman@gmail.com',
                                      password: 'password',
                                      password_confirmation: 'wrong_password'
                                    }, headers: headers
       
      expect(response_json['errors']['password_confirmation']).to eq ["doesn't match Password"]
      expect(response.status).to eq 422
      end

      it 'has an invalid email address' do
        post '/api/v1/auth', params: { email: 'crap@notreal',
                                        password: 'password',
                                        password_confirmation: 'password'
                                      }, headers: headers

        expect(response_json['errors']['email']).to eq ['is not an email']
        expect(response.status).to eq 422
      end

      it 'is already a registered email' do
        FactoryBot.create(:user, email: 'sethnejame@gmail.com',
                                  password: 'password',
                                  password_confirmation: 'password')

        post '/api/v1/auth', params: { email: 'sethnejame@gmail.com',
                                        password: 'password',
                                        password_confirmation: 'password'
                                      }, headers: headers
                              
        expect(response_json['errors']['email']).to eq ['has already been taken']
        expect(response.status).to eq 422
      end
    end
  end