import { createRouter, createWebHistory } from 'vue-router';
import Login from '@/components/Login.vue'
import Dashboard from '@/components/dashboard/Dashboard.vue';
import Notes from '@/components/notes/Notes.vue';
import Events from '@/components/events/Events.vue';
import Contacts from '@/components/contacts/Contacts.vue';
import Companies from '@/components/companies/Companies.vue';
import CreateNote from '@/components/notes/CreateNote.vue'

const routes = [
    {
        path: '/', 
        name: 'login', 
        component: Login
    },
    {
        path: '/dashboard', 
        name: 'dashboard', 
        component: Dashboard 
    },
    { 
        path: '/notes', 
        name: 'notes', 
        component: Notes 
    },
    { 
        path: '/events', 
        name: 'events', 
        component: Events 
    },
    { 
        path: '/contacts', 
        name: 'contacts', 
        component: Contacts 
    },
    { 
        path: '/companies', 
        name: 'companies',
        component: Companies 
    },
    {
        path: '/notes/create',
        name: 'notes_create',
        component: CreateNote
    }
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;