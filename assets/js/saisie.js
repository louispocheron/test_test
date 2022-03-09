
import 'flatpickr';
import 'flatpickr/dist/l10n/fr';
require("flatpickr/dist/themes/material_green.css");


document.querySelector('.flatpickr').flatpickr({
    locale: 'fr',
    dateFormat: 'd/m/Y',
})



// ON RECUPERE L'HEURE DE DEPART
const departHours = document.querySelector('#form_heureDepart_hour');
const departMinutes = document.querySelector('#form_heureDepart_minute');
let value1
let value2
// get the value of the dropdown depart
departHours.addEventListener('change', (e) => {
    const departHoursValue = e.target.value;
    value1 = departHoursValue;
});
departMinutes.addEventListener('change', (e) => {
    const departMinutesValue = e.target.value;
    value2 = departMinutesValue;
});

function getHeureDepart(){
    if(typeof value1 !== "undefined" && typeof value2 !== "undefined"){
        if(value1 < 10){
            value1 = '0' + value1;
        }
        if(value2 < 10){
            value2 = '0' + value2;
        }
        console.log(value1 + ":" + value2);
    }
    else{
        console.log("undefined")
        setTimeout(getHeureDepart, 250);
    }
}
getHeureDepart();



// ON RECUPERE L'HEURE D'ARRIVEE
const arriveHours = document.querySelector('#form_heureArrivee_hour');
const arriveMinutes = document.querySelector('#form_heureArrivee_minute');
let value3
let value4
// get the value of the dropdown arrive
arriveHours.addEventListener('change', (e) => {
    const arriveHoursValue = e.target.value;
    value3 = arriveHoursValue;
}
);
arriveMinutes.addEventListener('change', (e) => {
    const arriveMinutesValue = e.target.value;
    value4 = arriveMinutesValue;
});

function getHeureArrivee(){
    if(typeof value3 !== "undefined" && typeof value4 !== "undefined"){
        if(value3 < 10){
            value3 = "0" + value3;
        }
        if(value4 < 10){
            value4 = "0" + value4;
        }
        console.log(value3 + ":" + value4);
    }
    else{
        console.log("undefined")
        setTimeout(getHeureArrivee, 250);
    }
}
getHeureArrivee();




