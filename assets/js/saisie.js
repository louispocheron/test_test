// //FLATPICKR POUR LA SAISIE DATE
import 'flatpickr';
import 'flatpickr/dist/l10n/fr';


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

    let chargeData = document.querySelector('#chargeInputId').dataset.charges;
    const chargesInput = document.querySelector('.chargesInput');
    let groupeSelect = document.querySelector('.groupeSelect');
    const heureValoriseesInput = document.querySelector('.heureValoriseesInput');



    //set default value to heuredepart to 00

    dureeInput.value = 0;
    let heureDepartBase =  heuredepart.value = 0;
    let minutesDepartBase = minutesdepart.value = 0;
    let heureArriveeBase = heurearrivee.value = 0;
    let minutesArriveeBase = minutesarrivee.value = 0;


    [heuredepart, minutesdepart, heurearrivee, minutesarrivee, groupeSelect].forEach(evt => {
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

            let dureeHeureValorisee = dureeHeure + '.' + dureeMinute;
            // parseFloat(dureeHeureValorisee); 


            heureValoriseesInput.value = (groupeSelect.value * chargeData * dureeHeureValorisee).toFixed(2);
            console.log(chargeData * dureeHeureValorisee);


    });
});




    // BAREME SAISIE  KILOMETRAGE 
    const bareme = document.querySelector('.bareme');
    const kmInput = document.querySelector('.kmInput');
    const fraisInput = document.querySelector('.fraisInput');
    const donsInput = document.querySelector('.donsInput');
    const coutInput = document.querySelector('.coutInput');
    const totalNote = document.querySelector('.totalNote');

    

    bareme.value = 0.319;
    kmInput.value = 0;
    coutInput.value = 0;
    fraisInput.value = 0;
    donsInput.value = 0;
    totalNote.value = 0;

    let baremeValue = bareme.value;
    let kmValue = kmInput.value;
    let coutValue = coutInput.value;
  
    [bareme, kmInput, coutInput].forEach(evt => {
        evt.addEventListener('keyup', () => {
            coutValue = coutInput.value;
            baremeValue = bareme.value;
            kmValue = kmInput.value;

            //avoid before the NaN output
            if(coutValue == ''){
                coutValue = 0;
            }

            fraisInput.value = (kmValue * baremeValue).toFixed(2);

            donsInput.value = parseInt(fraisInput.value) + parseInt(coutValue);
            // put donsInput.value in localStorage
            localStorage.setItem('donsInput', donsInput.value);
            totalNote.value = parseFloat(fraisInput.value) + parseInt(coutValue);
        });
    });

    const apayerInput = document.querySelector('.apayerInput');

    apayerInput.addEventListener('keyup', () => {
        let apayerValue = apayerInput.value;
        
        if(apayerValue == ''){
            apayerValue = 0;
        }
        setTimeout(() => {
         donsInput.value = parseFloat(apayerValue) - parseFloat(donsInput.value);
        }, 1000);
    });    



    // const form_association = document.querySelector('#form_association');
    // form_association.select2({
    //     placeholder: 'Association',
    //     maximumSelectionLength: 1,
    //     allowClear: true,   
    // });

        



