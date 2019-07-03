# Data Warehouse Crimes São Paulo

- Para acessar o mapa de calor é necessário ter o xampp instalado

- Descompactar o arquivo "heatmap-dw.zip" na pasta "htdocs" do xampp. (Normalmente fica no caminho: "C:\xampp\htdocs")

- Para poder visualizar o heatmap (mapa de calor), é necessário que você crie uma chave de API do Google Maps. Para criar uma chave de API, basta você acessar o [Google Cloud](https://cloud.google.com/) logado em uma conta do Google navegar até o Console, criar um projeto e solicitar sua chave de API que pode ser obtida na aba Credenciais do Console. Após isso você deve substituir onde tem SUA_CHAVE_DA_API_AQUI com a sua chave de API em cada uma das páginas consulta.php do projeto :
```
src="https://maps.googleapis.com/maps/api/js?key=SUA_CHAVE_DA_API_AQUI&libraries=visualization&callback=initMap">
```
- Inicializar o servidor apache no xampp

- Acesse pelo navegador o endereço "http://localhost/heatmap-dw"

- Algumas consultas são grandes e podem exceder o tempo limite ou a memória alocada do php, para resolver isto, basta você ir na pasta /php que fica dentro da pasta do Xampp e procurar pelo arquivo chamado php.ini, abra-o e procure por "memory_limit=" aumente o valor o necessário para rodar a aplicação.


