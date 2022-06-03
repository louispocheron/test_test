import { sumHours } from "./sumHours";
import { sumEuros } from "./sumEuros";
import { sumPay } from "./sumPay";


const totalH1 = document.querySelector(".totalH1");


// GRAB LES ELEMENTS DU DOM
const selectYear = document.getElementById('selectYear');
const totalParagraph = document.querySelector('.total-paragraphe');
const dureeP = document.querySelector('.total-heure');
const payerP = document.querySelector('.total-payer');
const donP = document.querySelector('.total-don');
const valoriseeP = document.querySelector('.total-valorisees');
const duree = document.querySelectorAll('.duree');
const payerTd = document.querySelectorAll('.payerTd');
const donTd = document.querySelectorAll('.donTd');
const valoriseesTd = document.querySelectorAll('.valoriseesTd');





// OPTION DE BASE POUR LE SELECT YEAR
let baseOption  = document.createElement('option');
baseOption.text = 'Tous';
baseOption.value = 'rien';
baseOption.className = 'select-dd';
selectYear.add(baseOption);

// OPTION AVEC LES ANNNES 
let currentYear = new Date().getFullYear();    
let earliestYear = 1965;     
while (currentYear >= earliestYear) {      
    let dateOption = document.createElement('option');          
    dateOption.text = currentYear;      
    dateOption.value = currentYear;
    dateOption.className = 'select-dd';
    selectYear.add(dateOption);      
    currentYear -= 1;    
}

// CREATION SELECT MONTH
const selectMonth = document.getElementById('selectMonth');
const table = document.querySelector('.table');
console.log(table);
const btnSubmit = document.querySelector(".btn-submit")

const months = [
    {value: '', text: 'Tous'},
    {value: '01', text: 'Janvier'},
    {value: '02', text: 'Février'},
    {value: '03', text: 'Mars'},
    {value: '04', text: 'Avril'},
    {value: '05', text: 'Mai'},
    {value: '06', text: 'Juin'},
    {value: '07', text: 'Juillet'},
    {value: '08', text: 'Août'},
    {value: '09', text: 'Septembre'},
    {value: '10', text: 'Octobre'},
    {value: '11', text: 'Novembre'},
    {value: '12', text: 'Décembre'}
];

for(let i=0; i<months.length; i++){
    const monthOption = document.createElement('option');
    monthOption.text = months[i].text;
    monthOption.value = months[i].value;
    monthOption.className = 'select-month';
    selectMonth.add(monthOption);
}

btnSubmit.addEventListener('click', Ajaxyear);


// APPEL AJAX POUR AFFICHER LES DONNEES
function Ajaxyear(){
    let data = selectYear.options[selectYear.selectedIndex];
    console.log(data.value);
    let month = selectMonth.options[selectMonth.selectedIndex].value;
    let queryString = new URLSearchParams();
    queryString.append('year', data.value);
    queryString.append('month', month);
    let url = new URL(window.location.href);

    axios.post(url.pathname + "?" + queryString.toString() + "&ajax=1", {
        'year': data.value,
        'month': month
    })
    .then(data => {
        // ON APPEND LES DONNEES SI ON LES RECOIS
        // SI ON LES RECOIS PAS ON APPEND UN MSG EN ROUGE A UNE DIV
        const trContainer = document.querySelector('.ajaxDivContent');
        const content = document.querySelectorAll('.trtest');
        const content2 = document.querySelector('.totalDiv');
        let dataUser = data.data.content;

        // CAS OU ON RECOIS RIEN DU SERV
        if (dataUser == "") {
            const h3 = document.createElement('h3');
            totalH1.innerHTML = "<h5 style='color: red; font-size: 13px;'> Aucun résultat trouvé pour cette recherche </h5>";
            content2.appendChild(h3);

            // TIMEOUT POUR SUPPR LE MESSAGE D ERREUR
            setTimeout(()=>{
                h3.remove();
            }, 3000);

        // CAS OU ON RECOIS DES DONNEES
        } else {
            const contentInfo = document.querySelector('.content-info');
            let year = selectYear.options[selectYear.selectedIndex].value;
            trContainer.innerHTML = dataUser;
            const tr = document.querySelectorAll('.duree');
            const trData = Array.from(tr).map(el => el.dataset.duree)

            // APPEL DES FONCTIONS POUR CALCULER LES DONNEES
            const payerTdAjax = document.querySelectorAll('.payerTd');
            const trpayer = Array.from(payerTdAjax).map(el => el.dataset.payer)
            let aPayerSumAjax = sumPay(trpayer);
            payerP.innerHTML = `A payer :<span>${aPayerSumAjax}</span> €`;


            const donTdAjax = document.querySelectorAll('.donTd');
            const trdon = Array.from(donTdAjax).map(el => el.dataset.don)
            let donSumAjax = sumEuros(trdon);
            donP.innerHTML = `Don :<span>${donSumAjax}</span> €`;


            const valoriseesTdAjax = document.querySelectorAll('.valoriseesTd');
            const trvalorisees = Array.from(valoriseesTdAjax).map(el => el.dataset.valorisees)
            let valoriseesSumAjax = sumEuros(trvalorisees);
            valoriseeP.innerHTML = `Valorisees :<span>${valoriseesSumAjax}</span> €`;

      
            let htmlAjaxSum = sumHours(trData);
           
            if(month == ''){
                totalParagraph.innerHTML = `Total pour l'année ${year}:`
            }
            if(data.value == 'rien' && month == ''){
                totalParagraph.innerHTML = "Total de toutes vos saisies :";
            }
            if(data.value != 'rien' && month != ''){

                totalParagraph.innerHTML = `Total pour le ${month}/${year}:`;

            }

        }
    })
    .catch(err => {
        console.log(err);
    })  
}





// CALCUL AVEC LA FONCTION QU'ON IMPORTE LIGNE 1 ET APPEND POUR LA DUREE 
const data = Array.from(duree).map(el => el.dataset.duree);
let dureeAjax = sumHours(data);
dureeP.innerHTML = `Durée : ${dureeAjax}`;


// CALCUL AVEC LA FONCTION QU'ON IMPORTE LIGNE 3 ET APPEND POUR LE REMBOURSEMENT
const dataPayer = Array.from(payerTd).map(el => el.dataset.payer);
let aPayerSum = sumPay(dataPayer);
payerP.innerHTML = `A payer : ${aPayerSum} €`;

// CALCUL AVEC LA FONCTION QU'ON IMPORTE LIGNE 2 ET APPEND POUR LE DON
const dataDon = Array.from(donTd).map(el => el.dataset.don);
let donSum = sumEuros(dataDon);
donP.innerHTML = `Don : ${donSum} €`;

// CALCUL AVEC LA FONCTION QU'ON IMPORTE LIGNE 2 ET APPEND POUR LA VALORISATION
const dataValorisees = Array.from(valoriseesTd).map(el => el.dataset.valorisees);
let valoriseesSum = sumEuros(dataValorisees);
valoriseeP.innerHTML = `Valorisation : ${valoriseesSum} €`;

    // // ON SPLIT LES HEURES ET LES MINUTES ET ON LES CHANGE EN NUMBER AVEC PARSEINT POUR LES ADDITIONNER
    // let dureeHours = parseInt(duree.split('h')[0]);
    // // ALL RESULTS OF DUREEHOURS IN A ARRAY
    // let dureeHoursArray = dureeHours.toString().split('');

    // let totalHours = dureeHours.reduce(function(val1, val2){
    //     return val1 + val2;
    // }, 0);

    // console.log(totalHours);

    // let dureeMinutes = parseInt(duree.split('h')[1]);

    // SUM TOGETHER THE NUMBERS OF dureeHours AND dureeMinutes
    
    
    

    // newD = 
    // console.log(duree);

    // let dureeInt = parseInt(single.dataset.duree);
    // console.log(dureeInt);
    // add the hours and minutes together
    // dureeInt.forEach(singleInt => {
    //     singleInt 
    // })

// console.log('newfun');

// for(let i = 0; i < trtest.length; i++){
//     trtest[i].addEventListener('click', pdfOpen);
// }


// function pdfOpen(){
//     let newHref = trtest.dataset.href
//     window.open(newHref, '_blank');
// }    







