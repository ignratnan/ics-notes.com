import './assets/main.css';
import { createApp } from 'vue';
import App from './App.vue';
import router from './router';

/* import the fontawesome core */
import { library } from '@fortawesome/fontawesome-svg-core';

/* import font awesome icon component */
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';

/* import specific icons */
import { faFolder, faTrash, faEdit, faPlus, faMagnifyingGlass, faPen, faUserGroup, faNoteSticky, faBuilding, faUserTie, faTag, faPenFancy, faShareFromSquare, faThumbTack, faPhone, faEnvelope, faAngleRight, faMinus, faBold, faItalic, faUnderline, faStrikethrough, faLink} from '@fortawesome/free-solid-svg-icons';

/* add icons to the library */
library.add(faFolder, faTrash, faEdit, faPlus, faMagnifyingGlass, faPen, faUserGroup, faNoteSticky, faBuilding, faUserTie, faTag, faPenFancy, faShareFromSquare, faThumbTack, faPhone, faEnvelope, faAngleRight, faMinus, faBold, faItalic, faUnderline, faStrikethrough, faLink);

const app = createApp(App);

/* add font awesome icon component globally */
app.component('font-awesome-icon', FontAwesomeIcon);

app.use(router);
app.mount('#app');
