import { createRouter, createWebHistory } from 'vue-router';
import Login from '@/components/Login.vue'
import Dashboard from '@/components/dashboard/Dashboard.vue';
import Notes from '@/components/notes/Notes.vue';
import Events from '@/components/events/Events.vue';
import Contacts from '@/components/contacts/Contacts.vue';
import Companies from '@/components/companies/Companies.vue';
import NotesCreateNote from '@/components/notes/CreateNote.vue'
import NotesCreateEvent from '@/components/notes/CreateEvent.vue'
import NotesCreateCompany from '@/components/notes/CreateCompany.vue'
import NotesCreateContact from '@/components/notes/CreateContact.vue'
import NotesEditNote from '@/components/notes/EditNote.vue'
import EventsCreateEvent from '@/components/events/CreateEvent.vue'
import ContactsCreateContact from '@/components/contacts/CreateContact.vue'
import CompaniesCreateCompany from '@/components/companies/CreateCompany.vue'
import CompaniesEditCompany from '@/components/companies/EditCompany.vue'
import SettingsChangePassword from '@/components/settings/ChangePassword.vue'

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
        path: '/notes/create-note',
        name: 'notes_create_note',
        component: NotesCreateNote
    },
    {
        path: '/notes/create-event',
        name: 'notes_create_event',
        component: NotesCreateEvent
    },
    {
        path: '/notes/create-contact',
        name: 'notes_create_contact',
        component: NotesCreateContact
    },
    {
        path: '/notes/create-company',
        name: 'notes_create_company',
        component: NotesCreateCompany
    },
    {
        path: '/events/create-event',
        name: 'events_create_event',
        component: EventsCreateEvent
    },
    {
        path: '/notes/edit-note/:id',
        name: 'notes_edit_note',
        component: NotesEditNote,
        props: true
    },
    {
        path: '/contacts/create-contact',
        name: 'contacts_create_contact',
        component: ContactsCreateContact
    },
    {
        path: '/companies/create-company',
        name: 'companies_create_company',
        component: CompaniesCreateCompany
    },
    {
        path: '/companies/edit-company/:id',
        name: 'companies_edit_company',
        component: CompaniesEditCompany,
        props: true
    },
    {
        path: '/settings/change-password',
        name: 'settings_change_password',
        component: SettingsChangePassword,
    }
    
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;