//NOMBRE D'HEURE ET MINUTES PAR ADHERENT
const duree = document.getElementsByClassName('duree');
const totalDiv = document.getElementsByClassName('total');
const totalP = document.querySelector('.totalP');

    // CALCUL DU TOTAL D'HEURES
    // get data attributes 'data-hihi' from test
    const data = Array.from(duree).map(el => el.dataset.duree);

    window.onload = () => {
    //parse int hours and minutes from data 
    const hours = data.map(el => parseInt(el.split(':')[0]));
    const minutes = data.map(el => parseInt(el.split('h')[1]));
    // sum hours and minutes
    let totalHours = hours.reduce((acc, cur) => acc + cur);
    let totalMinutes = minutes.reduce((acc, cur) => acc + cur);
   
    // as long as minutes are more than 60, add 1 to hours and subtract 60 from minutes
    while (totalMinutes >= 60) {
        totalHours++;
        totalMinutes -= 60;
    }
    // if minutes are less than 10, add 0 before minutes
    if (totalMinutes < 10) {
        totalMinutes = `0${totalMinutes}`;
    }
    // innerhtml of totalP
    totalP.innerHTML = `cet adhérants a saisie ${totalHours}h${totalMinutes} au total`;
    }




    //AJAX CHOPER LES SAISIE DE L'ANNEE ACTUELLE
    const yearbtn = document.querySelector('.yearbtn');
    function ajaxAxios(e){
        e.preventDefault();

        const url = this.href;
        axios.get(url).then(res => {
            // FAIRE CE QUE JE VEUX AVEC ANNEE ICI 
            console.log(res.data);
        }).catch(err => {
            console.log(err);
        });
    }

    yearbtn.addEventListener('click', ajaxAxios);

    const monthbtn = document.querySelector(".monthbtn");
    const ligne = document.getElementsByClassName('ligne');

    function ajaxMonth(e){
        e.preventDefault();
        
        const url = this.href;
        axios.get(url).then(res => {
            console.log(res.data);
            // FAIRE CE QUE JE VEUX AVEC ANNEE ICI
            for(let i = 0; i < ligne.length; i++){
                ligne[i].style.display = "none";
            }
            let data = res.data.data;
            // sum hours and minutes from data
            let totalHours = data.map(el => parseInt(el.split('h')[0]));
            let totalMinutes = data.map(el => parseInt(el.split('h')[1]));

            totalHours = totalHours.reduce((acc, cur) => acc + cur);
            totalMinutes = totalMinutes.reduce((acc, cur) => acc + cur);
            // as long as minutes are more than 60, add 1 to hours and subtract 60 from minutes
            while (totalMinutes >= 60) {
                totalHours++;
                totalMinutes -= 60;
            }
            // if minutes are less than 10, add 0 before minutes
            if (totalMinutes < 10) {
                totalMinutes = `0${totalMinutes}`;
            }

            // innerhtml of totalP
            totalP.innerHTML = `cet adhérants a saisie ${totalHours}h${totalMinutes} au total pour ce mois-ci`;
            console.log(res.data.data);
        }).catch(err =>{
            console.log(err);
        })
    }

    monthbtn.addEventListener('click', ajaxMonth);

