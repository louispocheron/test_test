
import 'flatpickr';
import 'flatpickr/dist/l10n/fr';
require("flatpickr/dist/themes/material_green.css");


document.querySelector('.flatpickr').flatpickr({
    locale: 'fr',
    dateFormat: 'd/m/Y',
})


// INPUT FRAIS KILOMETRAGE A FAIRE EN FONCTION DE CE QUE LUTILISATEUR RENTRE
const frais = document.getElementById('frais');
frais.value = 2;

const departHeure = document.querySelector(".heureDepart");
console.log(departHeure);
// get selected value 
departHeure.addEventListener("change", function() {
    let vale = departHeure.options[departHeure.selectedIndex].value;
    console.log(vale);
});




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






