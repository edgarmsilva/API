Dado("a rota da api de criação de token") do
  @body = CreateToken("password123")
end

Quando("realizar uma requisição utilizando o método POST") do
  @response = @createToken.post
end

Então('a API irá retornar o código {int} e o token gerado') do |code|
  expect(@response.code).to eq(code)
  expect(JSON.parse(@response.body)).to include('token')
  log("Status Code  : #{@response.code}")
  log("Token gerado : #{@response['token']}")
  expect(@response.body).to match_json_schema('create_token')
end
