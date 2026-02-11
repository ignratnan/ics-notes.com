import { createRouter, createWebHistory } from 'vue-router';
import Login from '@/views/Login.vue'
import Dashboard from '@/views/user/dashboard/Dashboard.vue';
import DashboardCreateNote from '@/views/user/dashboard/CreateNote.vue';
import DashboardCreateEvent from '@/views/user/dashboard/CreateEvent.vue';
import DashboardCreateCompany from '@/views/user/dashboard/CreateCompany.vue';
import DashboardCreateContact from '@/views/user/dashboard/CreateContact.vue';
import Notes from '@/views/user/notes/Notes.vue';
import Events from '@/views/user/events/Events.vue';
import Contacts from '@/views/user/contacts/Contacts.vue';
import Companies from '@/views/user/companies/Companies.vue';
import NotesCreateNote from '@/views/user/notes/CreateNote.vue'
import NotesCreateEvent from '@/views/user/notes/CreateEvent.vue'
import NotesCreateCompany from '@/views/user/notes/CreateCompany.vue'
import NotesCreateContact from '@/views/user/notes/CreateContact.vue'
import NotesEditNote from '@/views/user/notes/EditNote.vue'
import EventsCreateEvent from '@/views/user/events/CreateEvent.vue'
import ContactsCreateContact from '@/views/user/contacts/CreateContact.vue'
import CompaniesCreateCompany from '@/views/user/companies/CreateCompany.vue'
import CompaniesEditCompany from '@/views/user/companies/EditCompany.vue'
import CompaniesDetailsCompany from '@/views/user/companies/CompanyDetails.vue'
import ResetPassword from '@/views/user/layout/ResetPassword.vue';
import ForgotPassword from '@/views/user/layout/ForgotPassword.vue';
import Settings from '@/views/user/settings/Settings.vue'

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
        path: '/dashboard/create-note', 
        name: 'dashboard_create_note', 
        component: DashboardCreateNote
    },
    {
        path: '/dashboard/create-event', 
        name: 'dashboard_create_event', 
        component: DashboardCreateEvent
    },
    {
        path: '/dashboard/create-company', 
        name: 'dashboard_create_company', 
        component: DashboardCreateCompany
    },
    {
        path: '/dashboard/create-contact', 
        name: 'dashboard_create_contact', 
        component: DashboardCreateContact
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
        path: '/companies/details-company/:id',
        name: 'companies_details_company',
        component: CompaniesDetailsCompany,
        props: true
    },
    {
        path: '/reset-password',
        name: 'reset_password',
        component: ResetPassword,
    },
    {
        path: '/forgot-password',
        name: 'forgot_password',
        component: ForgotPassword,
    },
    {
        path: '/settings',
        name: 'settings',
        component: Settings,
    },
    
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;