var btnProductivity = document.querySelector('#btn_produtividade'); // capturing de button

btnProductivity.addEventListener('click', function(){ // listening the "click" event, then runnning some function which
    // capturing all input value datas, converting to number and saving at some string
    var amountHectare = Number(document.querySelector('#txt_qtdHectare').value); // how many hectares?
    var plantAmountSq =  Number(document.querySelector('#txt_qtdPlantaMq').value) // how many plants by square meter?
    var cobAmount = Number(document.querySelector('#txt_qtdEspigaPlanta').value) // how many cobs by plants?
    var cobWeightG = Number(document.querySelector('#txt_pesoEspiga').value); // which is the average weight of each cobs?
    var humidityPercentage = Number(document.querySelector('#txt_qtdUmidadePercentual').value); // which is the humidty percentage of storage
    var celciusDegree = Number(document.querySelector('#txt_temperaturaCelcius').value); // capturing the temeperature (celcius)

    //dont allow the empty inputs
    if(amountHectare != '' && plantAmountSq != '' && cobAmount != '' && cobWeightG != '' && humidityPercentage != '' && celciusDegree != ''){
        var plantAmountHectare = plantAmountSq * 10000; // converting plants by square meters to plants by hectare
        var cobWeightKg = cobWeightG/1000; // converting cob weight in grams to kilograms

        var potentialProductivity = plantAmountHectare * cobAmount * cobWeightKg; // calculating potential productivity (no counting the loss because humidity)
        var potencialProductivityPerBag = potentialProductivity / 60; // discovering productivity per 60kg bagssc ha-1
        var realProductivity = potentialProductivity * (100 - humidityPercentage) / (100 - 13); // the real productivity
        realProductivity = realProductivity - (realProductivity * 0.10);
        var realProductivityPerBag = realProductivity / 60; // discovering productivity per 60kg bagssc ha-1
        var potencialPercentage = (potentialProductivity - realProductivity) * (100 / realProductivity); // diference in percentage real productivity vs potencial producitivity

        var potencialMoney = ( (potencialProductivityPerBag) - (realProductivityPerBag) ) * 54 // 54 medium value

        var producerStatus;
        var grainQuality
        var grainQualitySentence

        if(realProductivityPerBag < 90){
            producerStatus = `muito abaixo da média`;
        }else if(realProductivityPerBag < 110){
            producerStatus = `médiano`;
        }else if(realProductivityPerBag >= 110){
            producerStatus = 'avançado';
        }

        if(celciusDegree < 20){
            grainQuality = `baixa`;
            grainQualitySentence = 'Temperatura baixa causa uma maturação tardia, elevando perdas'
        }else if ( celciusDegree < 25){
            grainQuality = `boa`;
            grainQualitySentence = 'Temperatura ideal, os grãos deve ficar entre 20-24°C'
        }else{
            grainQuality = 'péssima qualidade';
            grainQualitySentence = 'Qualide abaixo do normal, que pode agravar as perdas em 40%';
        }

        var modalLoader = document.querySelector('.modal-loader');
        modalLoader.style.display = 'block';

        var responseContainer = document.querySelector('.response-container')
        var dataAnalysisResponse = document.querySelector('.data-analysis');

        responseContainer.style.height = '1450px';
        dataAnalysisResponse.style.height = '1180px';

          // simulating the loader process
        setTimeout(function() {
            modalLoader.style.display = 'none'; // closing modal
        }, 1500); // 3 seconds

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
                    <p class="data-info-text">Você está perdendo cerca de <span class="red-text">${(potentialProductivity - realProductivity).toFixed(1)} kg/ha</span></p>
                    <p class="data-info-text">Que pode ser resolvido de maneira simples e eficiente</p>
                </div>
                <div class="col data-col">
                    <img width="48" height="48" src="https://img.icons8.com/fluency/48/line-chart.png" alt="line-chart"/>                    
                    <h2 class="data-info-title">Produtor</h2>
                    <p class="data-info-text">Você é um produtor <b>${producerStatus}(${realProductivityPerBag}sa)</b></p>
                    <p class="data-info-text">em relação aos produtores do mercado média (105sa)</p>
                </div>
            </div>

            <div class="row data-row">
                <div class="col data-col">
                    <img width="48" height="48" src="https://img.icons8.com/fluency/48/stocks-growth--v1.png" alt="stocks-growth--v1"/>                    <h2 class="data-info-title">Potencial</h2>
                    <p class="data-info-text">Potêncial de escala em até <span class="green-text">${potentialProductivity.toFixed(1)}kg/ha</span></p>
                    <p class="data-info-text">Podendo aumentar seus ganhos em <b>${potencialPercentage.toFixed(1)}%</b></p>
                </div>
                <div class="col data-col">
                    <img width="48" height="48" src="https://img.icons8.com/fluency/48/corn.png" alt="corn"/>
                    <h2 class="data-info-title">Qualidade</h2>
                    <p class="data-info-text">Seu grão tem qualidade <b>${grainQuality}</b></p>
                    <p class="data-info-text">${grainQualitySentence}</p>
                </div>
                <div class="col data-col">
                    <img width="48" height="48" src="https://img.icons8.com/fluency/48/delete-dollar.png" alt="delete-dollar"/>
                    <h2 class="data-info-title">Lucratividade</h2>
                    <p class="data-info-text">Você esta deixando de ganhar cerca de <span class="red-text">RS${(potencialMoney * amountHectare).toFixed(2)} reais</span>, de toda sua plantação</p>
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
                            <td><span class="red-text">R$${(realProductivityPerBag * 64).toFixed(2)} p/ha</span></td>
                            <td><span class="green-text">R$${(potencialProductivityPerBag * 64).toFixed(2)}p/ha</span></td>
                        </tr>
                        <tr>
                            <td>Mato Grosso</td>
                            <td>R$47.90</td>
                            <td><span class="red-text">R$${(realProductivityPerBag * 47.90).toFixed(2)}p/ha</span></td>
                            <td><span class="green-text">R$${(potencialProductivityPerBag * 47.90).toFixed(2)}p/ha</span></td>
                        </tr>
                        <tr>
                            <td>Paraná</td>
                            <td>R$55.10</td>
                            <td><span class="red-text">R$${(realProductivityPerBag * 55.10).toFixed(2)}p/ha</span></td>
                            <td><span class="green-text">R$${(potencialProductivityPerBag * 55.10).toFixed(2)}p/ha</span></td>
                        </tr>
                        <tr>
                            <td>Goiás</td>
                            <td>R$53.00</td>
                            <td><span class="red-text">R$${(realProductivityPerBag * 53).toFixed(2)}p/ha</span></td>
                            <td><span class="green-text">R$${(potencialProductivityPerBag * 53).toFixed(2)}p/ha</span></td>
                        </tr>
                        <tr>
                            <td>Rio Grande do Sul</td>
                            <td>R$50.00</td>
                            <td><span class="red-text">R$${(realProductivityPerBag * 50).toFixed(2)}p/ha</span></td>
                            <td><span class="green-text">R$${(potencialProductivityPerBag * 50).toFixed(2)}p/ha</span></td>
                        </tr>
                        <tr>
                            <td>Média (Brasil)</td>
                            <td>R$54</td>
                            <td><span class="red-text">R$${(realProductivityPerBag * 54).toFixed(2)}p/ha</span></td>
                            <td><span class="green-text">R$${(potencialProductivityPerBag * 54).toFixed(2)}p/ha</span></td>
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