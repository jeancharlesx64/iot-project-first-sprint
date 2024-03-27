

<h1 align="center">IoT Project - 1st Sprint | SPTech School</h1>

Project developed in the 1st Semester of SPTech Scool, is a project that must be integrated with IoT. We must look for a relevant problem with high social/economic impact, and the solution must be simple and efficient, based on the simulation using Arduino, we must build an embedded project using some of the sensors below to build the solution defined by the group:

- Temperature sensor;
- Humidity sensor;
- Lock sensor;
- Brightness sensor.

Only these must be used, no more, and must take as premises that it is a SIMULATION, yes, a simulation, not necessarily the sensors will be industrial level, you can check the repository documentation about the electronic components involved [here](https://github.com/jeancharlesx64/base-sensor-script). The solution must use a maximum of 2 sensors and a minimum of 1 sensor, this is a rule to be followed by all teams involved.

The Teams must have as requirements some "deliverables", these are tasks that must be mandatory to be demanded in each Sprint(1 semester, there are 3 sprints, are short periods in which fragments of a project are presented, 1/3, 2/3, 3/3), which will then be presented and analyzed by the Research and Innovation advisor professor.

#### 10th Group
We are 10th group, a team made up of 6 members:
- Jean Charles - [@jeancharlesx64](https://github.com/jeancharlesx64)
- Pedro Miguel - [@spedro-miguel](https://github.com/spedro-miguel)
- Isabella Matos - [@IsabellaMatos44801](https://github.com/IsabellaMatos44801)
- Isaque Borges - [@IsaqueBorges01](https://github.com/IsaqueBorges01)
- Kaique Sotero - [@kaiquetozim](https://github.com/kaiquetozim)
- Marcelo Alves - [@marcelo-alves-silva](https://github.com/marcelo-alves-silva)

<hr>

<h3 align="center">Problem encountered – Lack of temperature and humidity management when storing corn grains</h3>

Failure to properly manage temperature and humidity in corn storage can result in a number of significant problems. Corn is a sensitive product that can be easily affected by adverse environmental conditions. Here are some of the consequences of lack of temperature and humidity control:

- **Quality degradation:** Excessive moisture can lead to the proliferation of fungi and bacteria, resulting in mold, fermentation and rotting of corn. This not only compromises the quality of the product, but can also make it unsuitable for human or animal consumption.

- **Weight loss and nutritional value:** Improper storage conditions can lead to loss of moisture in corn, resulting in weight loss and decreased nutritional value. This can negatively affect profitability for farmers and the quality of animal feed.

- **Risks to animal and human health:** Corn contaminated by mycotoxins, which are by-products of fungi present in conditions of high humidity, can pose serious risks to animal and human health if consumed. Mycotoxins can cause serious illness and even be fatal in animals and humans.

- **Economic waste:** Corn spoilage due to lack of temperature and humidity control results in economic waste for farmers and the food industry as a whole. This includes additional costs of disposing of damaged products and lost profit potential.

There are numerous problems identified by team 10, which affect society and the economy in general, since **20% of corn production** is lost due to lack of management due to the storage of corn grains, with 50% of losses due to lack of monitoring of temperature and humidity(10% loss in total production).

<h3 align="center">Solution</h3>
The solution defined by the group is to create a simulative prototype of a device that will constantly monitor temperature and humidity sensor at protoboard(arduino), where this data will be sent via API to a Node server running on virtual machine, where data will travel to a Web platform where only our application client can have access and thus be able to make a definitive decision for their business
In terms of electronics, we will use these electronic components below, where they will capture the data we need: 

<br> 
<br>
<table>
    <tr>
        <th>Device</th>
        <th>Name</th>
        <th>Technical Data</th>
    </tr>
    <tr>
        <td>
            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/Arduino-uno-perspective-transparent.png/1200px-Arduino-uno-perspective-transparent.png" width="150px"  align/>
        </td>
        <td>
            <h5>Arduino Uno </h5>
        </td>
        <td>
            Operating voltage: 5V. Voltage limit: 6V to 20V. Digital Outputs: 14 Pins (of which 6 can be PWM outputs) Analog Outputs: 6 outputs with 3.3V.
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
            Temperature sensor produces a voltage signal that varies 10mV for each ºC, and it is capable of operating in a temperature range that can vary between -55ºC to 150ºC. The proximity between the measured result and the true value of the signal produced can vary from + -0.4ºC to + -1.5ºC
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
The DHT11 is a digital temperature and humidity sensor. It utilizes a capacitive humidity sensor and a thermistor to accurately measure environmental conditions. The sensor provides temperature readings in the range of 0 to 50 degrees Celsius with an accuracy of approximately ±2°C. Additionally, it measures humidity levels ranging from 20% to 90% with an accuracy of approximately ±5%.        </td>
    </tr>
</table>

<h4 align="center">Corporate website</h4>


We chose the name **GuardTech+** which references monitoring technology with the + signifying Plus, but also, in Portuguese representing the word "Mais", which in some countries is what corn is called, as in French, Spanish, Italian and other languages. We decided to use a simple logo representing corn, with a simple minimalist font and color with the slogan "Sempre Mais com você" ("Always more with you") with this pun suggesting that producers should no longer lose their corn in storage using our solution.

<br>
<br>

<div align="center">
  <img src="/doc-assets/img/screenshot/full-website-prototype.png" />
</div>
<br>

<div align="center">
  <img src="/doc-assets/icon/guardtech-logo-white.png" height="70px"/>
</div>
<br>


