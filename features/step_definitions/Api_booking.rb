
Dado('a rota da api de busca de agendamentos') do
    @reservas = Booking.new
  end
  
  Quando('realizar uma requisição de agendamentos utilizando o método GET') do
    @response = @reservas.get
  end
  
  Então('a API irá retornar o código {int} e a lista de agendamentos') do |code|
    expect(@response.code).to eq(code)
    jobject = JSON.parse(@response.body) 
    log("Status Code  : #{@response.code}")
    jobject.each do |item|
      expect(item).to include("bookingid")
    #   log("Agendamentos : #{item["bookingid"]}")
    end
  end

  Então('valido o contrato busca de todos os agendamentos') do
    expect(@response.body).to match_json_schema('booking')
  end

  Quando('realizar uma requisição de agendamentos utilizando o método GET informando um id') do
    id = GetbookingId()
    @response = @reservas.getbyId(id)
  end
  
  Então('a API irá retornar o código {int} e o agendamento correspondente') do |code|
    expect(@response.code).to eq(code)
    jobject = JSON.parse(@response.body) 
    log("Status Code  : #{@response.code}")
    log("Agendamento  : #{jobject}")

  end
  
  Então('valido o contrato busca de agendamento por id') do
    expect(@response.body).to match_json_schema('booking_by_id')
  end