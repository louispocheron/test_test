
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

        //send dureeHeure and dureeMinute to the server

    //send dureeHeure and dureeMinute to the server

    });
    });


    btnSubmitSaisie.addEventListener('click', () => {
        if(dureeInput.value <= 0){
            alert('votre temps de trajet est nul ou négatif');
            return false;
        }
    })





// CALCUL AUTO DE LA DUREE DU TRAJET
// ON RECUPERE L'HEURE DE DEPART
// const heureDepart = document.querySelector('#form_heureDepart_hour');
// const minuteDepart = document.querySelector('#form_heureDepart_minute');
// const heureArrivee = document.querySelector('#form_heureArrivee_hour');
// const minuteArrivee = document.querySelector('#form_heureArrivee_minute');
// const temps = document.querySelector('#duree');

// // calculer l'heure la duree du trajet
// heureDepart.addEventListener('change', () => {
//     let heureDepart = parseInt(heureDepart.value);
//     let minuteDepart = parseInt(minuteDepart.value);
//     let heureArrivee = parseInt(heureArrivee.value);
//     let minuteArrivee = parseInt(minuteArrivee.value);

//     if (heureDepart > heureArrivee) {
//         heureDepart = heureDepart - 24;
//     }

//     let duree = (heureArrivee - heureDepart) * 60 + (minuteArrivee - minuteDepart);
//     temps.value = duree;
//     console.log(temps.value);
// });  






