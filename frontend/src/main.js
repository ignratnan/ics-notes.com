import './assets/main.css';
import '@/assets/css/note.css';
import { createApp } from 'vue';
import App from './App.vue';
import router from './router';
import axios from "axios";

axios.defaults.withCredentials = true
axios.defaults.baseURL = "http://localhost:8080"

/* import the fontawesome core */
import { library } from '@fortawesome/fontawesome-svg-core';

/* import font awesome icon component */
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';

/* import specific icons */
import { faFolder, faTrash, faEdit, faPlus, faMagnifyingGlass, faPen, faUserGroup, faNoteSticky, faBuilding, faUserTie, faTag, faPenFancy, faShareFromSquare, faThumbTack, faPhone, faEnvelope, faAngleRight, faMinus, faBold, faItalic, faUnderline, faStrikethrough, faLink, faCalendarDays, faNotesMedical, faAddressBook, faBorderAll, faUser, faCircleInfo, faAngleLeft, faCircle, faSquare, faGear, faArrowRightFromBracket, faKey} from '@fortawesome/free-solid-svg-icons';

/* add icons to the library */
library.add(faFolder, faTrash, faEdit, faPlus, faMagnifyingGlass, faPen, faUserGroup, faNoteSticky, faBuilding, faUserTie, faTag, faPenFancy, faShareFromSquare, faThumbTack, faPhone, faEnvelope, faAngleRight, faMinus, faBold, faItalic, faUnderline, faStrikethrough, faLink, faCalendarDays, faNotesMedical, faAddressBook, faBorderAll, faUser, faCircleInfo, faAngleLeft, faCircle, faSquare, faGear, faArrowRightFromBracket, faKey);

const app = createApp(App);

app.component('font-awesome-icon', FontAwesomeIcon)

app.use(router);
app.mount('#app');
