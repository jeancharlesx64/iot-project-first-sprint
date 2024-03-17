var btnProductivity = document.querySelector('#btn_produtividade'); 

btnProductivity.addEventListener('click', function(){ 
    var amountHectare = Number(document.querySelector('#txt_qtdHectare').value); //quantidade de hectares no total
    var plantAmountSq =  Number(document.querySelector('#txt_qtdPlantaMq').value) // quantidade média de plantas por metro quadrado?
    var cobAmount = Number(document.querySelector('#txt_qtdEspigaPlanta').value)  // quantidade média de espigas por planta
    var cobWeightG = Number(document.querySelector('#txt_pesoEspiga').value); // peso médio das espigas em gamas
    var humidityPercentage = Number(document.querySelector('#txt_qtdUmidadePercentual').value); // percentual de umidade onde os milhos estão sendo armazenados
    var celciusDegree = Number(document.querySelector('#txt_temperaturaCelcius').value); // temperatura em celsius onde os milhos estão sendo armazenados


    // verificando campos vazios
    if(amountHectare != '' && plantAmountSq != '' && cobAmount != '' && cobWeightG != '' && humidityPercentage != '' && celciusDegree != ''){
        var plantAmountHectare = plantAmountSq * 10000; // convertendo as plantas por metro quadrado em plantas por hectares
        var cobWeightKg = cobWeightG/1000;  // convertendo o peso da espiga de gramas para kg   

        // calculando a potencial produtividade em KG por hectare
        // (sem contar com a perda por conta da umidade)
        var potentialProductivity = plantAmountHectare * cobAmount * cobWeightKg; 

        // calculando a potencial produtividade em Sacas por hectare
        // (considerando o potencial em KG, e Sacas de 60Kg, média)
        var potencialProductivityPerBag = potentialProductivity / 60; 

        // calculando a real produtividade em KG por hectare
        // (considerando as perdas pela umidade elevada)
        var realProductivity = potentialProductivity * (100 - humidityPercentage) / (100 - 13);

        // retirando os 10% de perdas que ocorrem por outros motivos da produtividade real do produtor
        // 20% da produção total é perdido, enquanto 50% das perdas é pela umidade/temperatura
        // ou seja, 10% da produção total é perdido pela umidade e temperatura e outros 10% perdido por outros fatores
        realProductivity = realProductivity - (realProductivity * 0.10);

        // real produtividade de novo, mas agora em sacas por hectares
        // (considerando sacas de 60kg)
        var realProductivityPerBag = realProductivity / 60; 

        // diferença em porcentagem da real produtividade vs a potencial produtividade que o produtor poderia ter
        var potentialPercentage = (((potentialProductivity - realProductivity) / potentialProductivity) * 100); 

        // potencial dinheiro que o produtor poderia estar ganhando
        // considerando o valor da saca de R$63 reais
        var potentialMoney = ( (potencialProductivityPerBag) - (realProductivityPerBag) ) * 63

        var producerStatus;
        var grainQuality;
        var grainQualitySentence;

        if(realProductivityPerBag < 90){
            producerStatus = `iniciante`;
        }else if(realProductivityPerBag < 110){
            producerStatus = `médiano`;
        }else if(realProductivityPerBag >= 110){
            producerStatus = 'avançado';
        }

        if(celciusDegree < 10 ){
            grainQuality = 'baixa';
            grainQualitySentence = 'A temperatura do milho está muito abaixo do normal'
        }else if(celciusDegree < 20){
            grainQuality = `média`;
            grainQualitySentence = 'Temperatura baixa causa uma maturação tardia, elevando as perdas de forma significativa'
        }else if(celciusDegree < 22){
            grainQuality = `boa`;
            grainQualitySentence = 'Temperatura quase perfeita, os grãos deveriam estar entre 22-24°C';
        }else if(celciusDegree <= 24){
            grainQuality = `perfeita`;
            grainQualitySentence = 'Temperatura perfeita! os grãos devem estar entre 22-24°C, continue assim';
        }else if(celciusDegree <= 30) {
            grainQuality = `média`;
            grainQualitySentence = 'Temperatura alta deterioram o grão, elevando as perdas de forma significativa';
        }else{
            grainQuality = `baixa`;
            grainQualitySentence = 'Temperatura muito elevada pode agravar as perdas em até 40%';
        }

        // tornando o modal visível
        var modalLoader = document.querySelector('.modal-loader');
        modalLoader.style.display = 'block';

        // capturando os containers onde será apresentado o resultado
        var responseContainer = document.querySelector('.response-container')
        var dataAnalysisResponse = document.querySelector('.data-analysis');

        // aumentando a altura dos containers
        responseContainer.style.height = '1450px';
        dataAnalysisResponse.style.height = '1180px';

        // simulando o carregamento (loader)
        setTimeout(function() {
            modalLoader.style.display = 'none';
        }, 1500); // 1 segundo para tornar o modal invisível denovo

        // apresentando o resultado na tela
        dataAnalysisResponse.innerHTML = `
            <!-- adding later via js -->
            <h1 class="analysis-title">Análise <i class="fa-solid fa-magnifying-glass-chart"></i></h1>
            <div class="row data-row">
                <div class="col data-col">
                    <img width="48" height="48" src="https://img.icons8.com/fluency/48/bar-chart.png" alt="bar-chart"/>
                    <h2 class="data-info-title">Produtividade</h2>
                    <p class="data-info-text">Total de <b>${realProductivity.toFixed(1)}kg/ha</b></p>
                    <p class="data-info-text">O que se traduz para <span class="green-text">R$${(realProductivityPerBag * 54).toFixed(1)} reais</span></p>
                </div>
                <div class="col data-col">
                    <img width="48" height="48" src="https://img.icons8.com/fluency/48/bearish.png" alt="bearish"/>   
                    <h2 class="data-info-title">Perdas</h2>
                    <p class="data-info-text">Você está perdendo cerca de <span class="red-text">${(potentialProductivity - realProductivity).toFixed(1)}kg/ha</span></p>
                    <p class="data-info-text">O que significa que é necessário realizar alguns <b>ajustes no seu armazenamento</b></p>
                </div>
                <div class="col data-col">
                    <img width="48" height="48" src="https://img.icons8.com/fluency/48/line-chart.png" alt="line-chart"/>                    
                    <h2 class="data-info-title">Produtor</h2>
                    <p class="data-info-text">Você é um produtor <b>${producerStatus}(${realProductivityPerBag.toFixed(1)}sa)</b></p>
                    <p class="data-info-text">em relação aos produtores do mercado média (105sa)</p>
                </div>
            </div>

            <div class="row data-row">
                <div class="col data-col">
                    <img width="48" height="48" src="https://img.icons8.com/fluency/48/stocks-growth--v1.png" alt="stocks-growth--v1"/>                    <h2 class="data-info-title">Potencial</h2>
                    <p class="data-info-text">Potêncial de escala em até <span class="green-text">${potentialProductivity.toFixed(1)}kg/ha</span></p>
                    <p class="data-info-text">Podendo aumentar seus ganhos em <b>${potentialPercentage.toFixed(1)}%</b></p>
                </div>
                <div class="col data-col">
                    <img width="48" height="48" src="https://img.icons8.com/fluency/48/corn.png" alt="corn"/>
                    <h2 class="data-info-title">Qualidade</h2>
                    <p class="data-info-text">Seu grão tem uma <b>${grainQuality} qualidade</b></p>
                    <p class="data-info-text">${grainQualitySentence}</p>
                </div>
                <div class="col data-col">
                    <img width="48" height="48" src="https://img.icons8.com/fluency/48/delete-dollar.png" alt="delete-dollar"/>
                    <h2 class="data-info-title">Lucratividade</h2>
                    <p class="data-info-text">Você esta deixando de ganhar cerca de <span class="red-text">RS${(potentialMoney * amountHectare).toFixed(2)} Reais</span>, de toda sua plantação</p>
                </div>
            </div>
            <div class="row data-row-last">
                <div class="col data-col-last">
                    <img width="48" height="48" src="https://img.icons8.com/fluency/48/growing-money.png" alt="growing-money"/>
                    <h2 class="data-info-title">GuardTech+ te salva</h2>
                    <p class="data-info-text">Com a nossa solução, a gente não te deixa na mão!<br>
                    conheça a nossa tecnologia e tenha lucro em qualquer canto do Brasil e do Mundo</p>
                    <p class="data-info-text">Veja abaixo a diferença da SUA lucratividade entre os maiores estados produtores de milho no Brasil:</p>
                    <table>
                        <tr>
                            <th>Estado</th>
                            <th>Valor p/60kg</th>
                            <th><img width="25" height="25" src="https://img.icons8.com/fluency/48/cancel.png" alt="cancel"/></th>
                            <th><img width="25" height="25" src="https://img.icons8.com/fluency/48/ok--v1.png" alt="ok--v1"/></th>
                        </tr>
                        <tr>
                            <td>São Paulo</td>
                            <td>R$64.00</td>
                            <td><span class="red-text">R$${(realProductivityPerBag * 64).toFixed(2)}/ha</span></td>
                            <td><span class="green-text">R$${(potencialProductivityPerBag * 64).toFixed(2)}/ha</span></td>
                        </tr>
                        <tr>
                            <td>Mato Grosso</td>
                            <td>R$47.90</td>
                            <td><span class="red-text">R$${(realProductivityPerBag * 47.90).toFixed(2)}/ha</span></td>
                            <td><span class="green-text">R$${(potencialProductivityPerBag * 47.90).toFixed(2)}/ha</span></td>
                        </tr>
                        <tr>
                            <td>Paraná</td>
                            <td>R$55.10</td>
                            <td><span class="red-text">R$${(realProductivityPerBag * 55.10).toFixed(2)}/ha</span></td>
                            <td><span class="green-text">R$${(potencialProductivityPerBag * 55.10).toFixed(2)}/ha</span></td>
                        </tr>
                        <tr>
                            <td>Goiás</td>
                            <td>R$53.00</td>
                            <td><span class="red-text">R$${(realProductivityPerBag * 53).toFixed(2)}/ha</span></td>
                            <td><span class="green-text">R$${(potencialProductivityPerBag * 53).toFixed(2)}/ha</span></td>
                        </tr>
                        <tr>
                            <td>Rio Grande do Sul</td>
                            <td>R$50.00</td>
                            <td><span class="red-text">R$${(realProductivityPerBag * 50).toFixed(2)}/ha</span></td>
                            <td><span class="green-text">R$${(potencialProductivityPerBag * 50).toFixed(2)}/ha</span></td>
                        </tr>
                        <tr>
                            <td>Média (Brasil)</td>
                            <td>R$64.00</td>
                            <td><span class="red-text">R$${(realProductivityPerBag * 54).toFixed(2)}/ha</span></td>
                            <td><span class="green-text">R$${(potencialProductivityPerBag * 54).toFixed(2)}/ha</span></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <h4 class="response-subtitle" style="margin-top: 30px;">GuardTech+</h4>
                    <h1 class="response-title">Nós temos a solução</h1>
                    <p class="response-subtext">Venha conhecer a nossa empresa, somos a GuardTech+ e temos a solução para o seu negócio, clique em saiba mais, confira e entre em contato com a gente, estamos te esperando ;)</p>
                    <button class="btn-know">Saiba Mais</button>
                </div>
            </div>
        `
        
    }else{
        alert('Há campos vazios. Preencha todos para calcular!');
    }
})