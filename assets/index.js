
import 'flatpickr';
import 'flatpickr/dist/l10n/fr';
require("flatpickr/dist/themes/material_green.css");




document.querySelector('.flatpickr').flatpickr({
    locale: 'fr',
    dateFormat: 'd/m/Y',
})