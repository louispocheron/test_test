//FLATPICKR POUR LA SAISIE DATE
import 'flatpickr';
import 'flatpickr/dist/l10n/fr';
require("flatpickr/dist/themes/material_green.css");

document.querySelector('.flatpickr').flatpickr({
    locale: 'fr',
    dateFormat: 'd/m/Y',
})



 const heuredepart = document.querySelector('#form_heureDepart_hour');
    const minutesdepart = document.querySelector('#form_heureDepart_minute');
    const heurearrivee = document.querySelector('#form_heureArrivee_hour');
    const minutesarrivee = document.querySelector('#form_heureArrivee_minute');
    const duree = document.querySelector('.duration');
    const dureeInput = document.querySelector('.dureeInput');
    const btnSubmitSaisie = document.querySelector('.btnSubmitSaisie');

    //set default value to heuredepart to 00

    dureeInput.value = 0;
    let heureDepartBase =  heuredepart.value = 0;
    let minutesDepartBase = minutesdepart.value = 0;
    let heureArriveeBase = heurearrivee.value = 0;
    let minutesArriveeBase = minutesarrivee.value = 0;


    [heuredepart, minutesdepart, heurearrivee, minutesarrivee].forEach(evt => {
        evt.addEventListener('change', () => {

            heureDepartBase = heuredepart.value;
            minutesDepartBase = minutesdepart.value;
            heureArriveeBase = heurearrivee.value;
            minutesArriveeBase = minutesarrivee.value;


            let dureeHeure = heureArriveeBase - heureDepartBase;
            let dureeMinute = minutesArriveeBase - minutesDepartBase;
            if(dureeMinute < 0){
                dureeHeure = dureeHeure - 1;
                dureeMinute = 60 + dureeMinute;
            }
            if(dureeMinute < 10){
                dureeMinute = '0' + dureeMinute;
            }
            dureeInput.value = dureeHeure + 'h' + dureeMinute;


    });
});




    // BAREME SAISIE  KILOMETRAGE 
    const bareme = document.querySelector('.bareme');
    const kmInput = document.querySelector('.kmInput');
    const fraisInput = document.querySelector('.fraisInput');
    console.log(fraisInput);
    

    bareme.value = 0.319;
    kmInput.value = 0;
    fraisInput.value = 0;

    let baremeValue = bareme.value;
    let kmValue = kmInput.value;
  
    [bareme, kmInput].forEach(evt => {
        evt.addEventListener('keyup', () => {
            baremeValue = bareme.value;
            kmValue = kmInput.value;

            // fraisInput equal to km * bareme with 2 decimals
            fraisInput.value = (kmValue * baremeValue).toFixed(2);
            console.log(typeof fraisInput.value);
            // max decimal of 2
        
        });
    });

