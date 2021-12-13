require 'rails_helper'

RSpec.describe 'Calculators', type: :request do
  describe 'POST /calculate' do
    it 'should Calculate' do
      post '/calculate', params: { A: 1, B: 1, OPERATION: 'SUM' }

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('2.0')

      post '/calculate', params: { A: 2, B: 1, OPERATION: 'SUB' }
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('1.0')

      post '/calculate', params: { A: 5, B: 1, OPERATION: 'TIMES' }
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('5.0')

      post '/calculate', params: { A: 10, B: 5, OPERATION: 'DIVIDE' }
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('2.0')

      post '/calculate', params: { A: 0, B: 5, OPERATION: 'DIVIDE' }
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('0')
    end

    it 'should Return a Bad Request' do
      post '/calculate', params: { A: 1, B: 1, OPERATION: 'SUMM' }

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:bad_request)
      expect(response.body).to include('Invalid Operator')

      post '/calculate', params: { A: 1, B: 'abc', OPERATION: 'SUM' }
      expect(response).to have_http_status(:bad_request)
      expect(response.body).to include('Invalid or missing Values')
    end
  end
end
