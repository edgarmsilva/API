class Auth
  include HTTParty
  base_uri "https://restful-booker.herokuapp.com"

  # inicialização da estrutura do body
  def initialize(bodyteste)
    $auth = { 'Content-Type': "application/json" }

    #     # "opção" de envio para o método POST, body recebe o body montado mais abaixo na leitura do CSV
    @sendDocument = {
      :headers => $auth,
      :body => bodyteste,
    }
  end

  def post
    self.class.post("/auth", @sendDocument)
  end

  #   def getCard
  #     @query = "customerId=80c7594f-c998-45a9-897b-02acf6be6779&email=helder.automatizado123456@gmail.com"
  #     #método get que traz os cartões cadastrados na base.
  #     self.class.get("/cards?#{@query}", getData)
  #     # def getStatus(idkey)
  #     #     #
  #     #     self.class.get("/account/status/#{idkey}", @getData)
  #     #     # STDOUT.puts "chave recebida: #{idkey}"
  #     # end
  #   end
end

class Booking
  include HTTParty
  base_uri "https://restful-booker.herokuapp.com"

  # inicialização da estrutura do body
  def initialize()
    $auth = { 'Content-Type': "application/json" }

    #     # "opção" de envio para o método POST, body recebe o body montado mais abaixo na leitura do CSV
    @sendDocument = {
      :headers => $auth,
    }
  end

  def get
    self.class.get("/booking", @sendDocument)
  end

  def getbyId(id)
    self.class.get("/booking/#{id}", @sendDocument)
  end
end

def CreateToken(password)
  body = {
    "username": "admin",
    "password": password
  }
  @body = JSON.generate(body)
  @createToken = Auth.new(@body)
  return @body
end


def GetbookingId() 
  booking = Booking.new
  response = booking.get
  jobject = JSON.parse(response.body) 
  id = jobject[0]['bookingid']
  return id
end
  