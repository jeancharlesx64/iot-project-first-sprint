# Projeto IoT - 1º Semestre | SPTech School

Projeto desenvolvido no 1º Semestre da SPTech School, é um projeto que deve ser integrado com IoT. Devemos buscar um problema relevante com alto impacto social/econômico, e a solução deve ser simples e eficiente, baseada na simulação usando Arduino, devemos construir um projeto embarcado usando algum dos sensores abaixo para resolver o problema definido pelo grupo:

- Sensor de temperatura;
- Sensor de umidade;
- Sensor de travamento;
- Sensor de luminosidade.

Apenas estes devem ser usados, não mais, e devem ser consideradas premissas que se trata de uma SIMULAÇÃO, sim, uma simulação, não necessariamente os sensores serão de nível industrial, você pode verificar a documentação do repositório sobre os componentes eletrônicos envolvidos [aqui](https://github.com/jeancharlesx64/base-sensor-script). A solução deve usar no máximo 2 sensores e no mínimo 1 sensor, esta é uma regra a ser seguida por todas as equipes envolvidas.

As equipes devem ter como requisitos alguns "entregáveis", que são tarefas que devem ser obrigatoriamente demandadas em cada Sprint (1 semestre, são 3 sprints, são períodos curtos em que são apresentados em fragmentos de um projeto, 1/3, 2/3, 3/3), que serão apresentados e analisados pelo professor orientador de Pesquisa e Inovação.

### 10º Grupo
Somos o 10º grupo, uma equipe composta por 6 membros:
- Jean Charles - [@jeancharlesx64](https://github.com/jeancharlesx64)
- Pedro Miguel - [@spedro-miguel](https://github.com/spedro-miguel)
- Isabella Matos - [@IsabellaMatos44801](https://github.com/IsabellaMatos44801)
- Isaque Borges - [@IsaqueBorges01](https://github.com/IsaqueBorges01)
- Kaique Sotero - [@kaiquetozim](https://github.com/kaiquetozim)
- Marcelo Alves - [@marcelo-alves-silva](https://github.com/marcelo-alves-silva)

---

### Problema identificado - Falta de gerenciamento de temperatura e umidade no armazenamento dos grãos de milho

A falta de gerenciamento adequado de temperatura e umidade no armazenamento de milho pode resultar em uma série de problemas significativos. O milho é um produto sensível que pode ser facilmente afetado por condições ambientais adversas. Aqui estão algumas das consequências da falta de controle de temperatura e umidade:

- **Degradação da qualidade:** O excesso de umidade pode levar à proliferação de fungos e bactérias, resultando em mofo, fermentação e apodrecimento do milho. Isso compromete não apenas a qualidade do produto, mas também pode torná-lo inadequado para consumo humano ou animal.

- **Perda de peso e valor nutricional:** Condições inadequadas de armazenamento podem levar à perda de umidade no milho, resultando em perda de peso e diminuição do valor nutricional. Isso pode afetar negativamente a lucratividade dos agricultores e a qualidade da ração animal.

- **Riscos para a saúde animal e humana:** O milho contaminado por micotoxinas, que são subprodutos de fungos presentes em condições de alta umidade, pode representar sérios riscos para a saúde animal e humana se consumido. Micotoxinas podem causar doenças graves e até ser fatais em animais e humanos.

- **Desperdício econômico:** A deterioração do milho devido à falta de controle de temperatura e umidade resulta em desperdício econômico para agricultores e para a indústria alimentícia como um todo. Isso inclui custos adicionais de disposição de produtos danificados e perda de potencial de lucro.

Existem inúmeros problemas identificados pela equipe 10, que afetam a sociedade e a economia em geral, uma vez que **20% da produção de milho** é perdida devido à falta de gestão devido no armazenamento dos grãos do milho, sendo 50% das perdas sendo pela falta de monitoramento da temperatura e umidade.

---

### Solução

A solução definida pelo grupo é criar um protótipo simulado de um dispositivo que irá monitorar constantemente as medições capturadas pelos sensores de temperatura e umidade com a protoboard (arduino), onde esses dados serão enviados via API para um servidor Node em execução em uma máquina virtual, onde os dados serão enviados para uma plataforma Web onde apenas nosso cliente de aplicação pode ter acesso e assim poder tomar uma decisão definitiva para seus negócios.

<table>
    <tr>
        <th>Dispositivo</th>
        <th>Nome</th>
        <th>Dados Técnicos</th>
    </tr>
    <tr>
        <td>
            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/Arduino-uno-perspective-transparent.png/1200px-Arduino-uno-perspective-transparent.png" width="150px"  align/>
        </td>
        <td>
            <h5>Arduino Uno </h5>
        </td>
        <td>
            Tensão de operação: 5V. Limite de tensão: 6V a 20V. Saídas digitais: 14 pinos (dos quais 6 podem ser saídas PWM). Saídas analógicas: 6 saídas com 3.3V.
        </td>
    </tr>
    <tr>
        <td>
            <img src="https://www.dedcomponentes.com.br/wp-content/uploads/2023/02/sensor_lm35dz-ded-componentes_1_c252362b-e4dc-4e48-89b3-ce121c8d2520.png" width="150px"  align/>
        </td>
        <td>
            <h5>LM35 </h5>
        </td>
        <td>
            O sensor de temperatura produz um sinal de tensão que varia 10mV para cada ºC, e é capaz de operar em uma faixa de temperatura que pode variar entre -55ºC a 150ºC. A proximidade entre o resultado medido e o valor real do sinal produzido pode variar de + -0.4ºC a + -1.5ºC.
        </td>
    </tr>
    <tr>
        <td>
            <img src="https://www.newpecas.com.br/imagem/web/sensor-de-temperatura-umidade-dht11.webp" width="150px"  align/>
        </td>
        <td>
            <h5>DHT11 </h5>
        </td>
        <td>
            O DHT11 é um sensor digital de temperatura e umidade. Ele utiliza um sensor de umidade capacitivo e um termistor para medir com precisão as condições ambientais. O sensor fornece leituras de temperatura na faixa de 0 a 50 graus Celsius com uma precisão de aproximadamente ±2°C. Além disso, ele mede níveis de umidade variando de 20% a 90% com uma precisão de aproximadamente ±5%.
        </td>
    </tr>
</table>

---

<div align="center">
  <img src="/doc-assets/icon/guardtech-logo-white.png" height="70px"/>
</div>

<div align="center">
  <img src="/doc-assets/img/screenshot/full-website-prototype.png" />
</div>

Optamos pelo nome **GuardTech+** que referencia a tecnologia de monitoramento com o sinal de adição, mas também, em português representando a palavra "Mais", que em alguns países é como o milho é chamado, como em francês, espanhol, italiano e outros idiomas. Decidimos usar um logotipo simples representando o milho, com uma fonte e cor minimalistas simples com o slogan "Sempre Mais com você", com este trocadilho sugerindo que os produtores não devem mais perder seu milho no armazenamento usando nossa solução.
