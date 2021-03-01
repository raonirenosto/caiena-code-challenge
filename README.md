# Caiena Code Challenge

Código da API que tuíta a previsão atual da cidade informada e a previsão para os próximos 5 dias.

## Endpoints

<b>POST /api/v1/tweets<b>

Payload da request é composto por um objeto JSON com os seguintes campos:
  - api_key - Chave para o open weather map api
  - city - Nome da cidade. Seguindo o padrão (https://openweathermap.org/current#name)

Ex:

```JSON
{
  "api_key": "api_key_aqui",
  "city": "rio de janeiro,BR"
}
```

## Configuração

As seguinte variáveis de ambiente deverão ser setadas:

- CONSUMER_KEY 
- CONSUMER_SECRET
- ACCESS_TOKEN
- ACCESS_TOKEN_SECRET

Os valores das variáveis acima devem ser preenchidos com os valores disponibilizados na página do desenvolvedor:
(https://developer.twitter.com/)
