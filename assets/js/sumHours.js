export function sumHours(data, htmlElement){
    
    // ON CHOPE LA PREMIERE PARTIE DE LA DUREE
    let hours = data.map(el => el.split('h')[0]);

    // ET ON LA CONVERTIE EN INT
    hours = hours.map(el => parseInt(el));

    // ET LA FONCTION REDUCE() POUR SUM TOUT LES EL
    let totalHours = hours.reduce((a, b) => a + b);
    
    // PAREIL POUR MINUTE MTN
    let minutes = data.map(el => el.split('h')[1].split('m')[0]);
    minutes = minutes.map(el => parseInt(el));
    let totalMinutes = minutes.reduce((a, b) => a + b);

    // SI TOTAL MIN > 60 ON FAIT LE CALCUL
    if(totalMinutes > 59){
        totalHours ++;
        totalMinutes = totalMinutes - 60;
    }
    if(totalMinutes < 10){
        totalMinutes = `0${totalMinutes}`
    }

    // ON AFFICHE LE TOTAL
    htmlElement.innerHTML = `vous avez saisie ${totalHours}h${totalMinutes} au total`;
    console.log('all donex');
    
}