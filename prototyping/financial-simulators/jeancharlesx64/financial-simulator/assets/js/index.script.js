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
    
        var realProductivity = potentialProductivity * (100 - humidityPercentage) / (100 - 13); // the real productivity
 
        var realProductivityPerBag = realProductivity / 60; // discovering productivity per 60kg bagssc ha-1

        var modalLoader = document.querySelector('.modal-loader');
        modalLoader.style.display = 'block';

          // simulating the loader process
        setTimeout(function() {
            modalLoader.style.display = 'none'; // closing modal
        }, 1500); // 3 seconds


    }else{
        alert('Há campos vazios. Preencha todos para calcular!');
    }
})