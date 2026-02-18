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
import CompaniesCreateCompany from '@/views/user/companies/CreateCompany.vue'
import CompaniesEditCompany from '@/views/user/companies/EditCompany.vue'
import CompaniesDetailsCompany from '@/views/user/companies/CompanyDetails.vue'
import ResetPassword from '@/views/user/layout/ResetPassword.vue';
import ForgotPassword from '@/views/user/layout/ForgotPassword.vue';
import Settings from '@/views/user/settings/Settings.vue'

import AdminDashboard from '@/views/admin/dashboard/Dashboard.vue';
import AdminDashboardCreateNote from '@/views/admin/dashboard/CreateNote.vue';
import AdminDashboardCreateEvent from '@/views/admin/dashboard/CreateEvent.vue';
import AdminDashboardCreateCompany from '@/views/admin/dashboard/CreateCompany.vue';
import AdminDashboardCreateContact from '@/views/admin/dashboard/CreateContact.vue';
import AdminNotes from '@/views/admin/notes/Notes.vue';
import AdminEvents from '@/views/admin/events/Events.vue';
import AdminContacts from '@/views/admin/contacts/Contacts.vue';
import AdminCompanies from '@/views/admin/companies/Companies.vue';
import AdminNotesCreateNote from '@/views/admin/notes/CreateNote.vue'
import AdminNotesCreateEvent from '@/views/admin/notes/CreateEvent.vue'
import AdminNotesCreateCompany from '@/views/admin/notes/CreateCompany.vue'
import AdminNotesCreateContact from '@/views/admin/notes/CreateContact.vue'
import AdminNotesEditNote from '@/views/admin/notes/EditNote.vue'
import AdminCompaniesCreateCompany from '@/views/admin/companies/CreateCompany.vue'
import AdminCompaniesEditCompany from '@/views/admin/companies/EditCompany.vue'
import AdminCompaniesDetailsCompany from '@/views/admin/companies/CompanyDetails.vue'
import AdminResetPassword from '@/views/admin/layout/ResetPassword.vue';
import AdminForgotPassword from '@/views/admin/layout/ForgotPassword.vue';
import AdminSettings from '@/views/admin/settings/Settings.vue'

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
        path: '/notes/edit-note/:id',
        name: 'notes_edit_note',
        component: NotesEditNote,
        props: true
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

    {
        path: '/admin/dashboard', 
        name: 'admin_dashboard', 
        component: AdminDashboard 
    },
    {
        path: '/admin/dashboard/create-note', 
        name: 'admin_dashboard_create_note', 
        component: AdminDashboardCreateNote
    },
    {
        path: '/admin/dashboard/create-event', 
        name: 'admin_dashboard_create_event', 
        component: AdminDashboardCreateEvent
    },
    {
        path: '/admin/dashboard/create-company', 
        name: 'admin_dashboard_create_company', 
        component: AdminDashboardCreateCompany
    },
    {
        path: '/admin/dashboard/create-contact', 
        name: 'admin_dashboard_create_contact', 
        component: AdminDashboardCreateContact
    },
    { 
        path: '/admin/notes', 
        name: 'admin_notes', 
        component: AdminNotes 
    },
    { 
        path: '/admin/events', 
        name: 'admin_events', 
        component: AdminEvents 
    },
    { 
        path: '/admin/contacts', 
        name: 'admin_contacts', 
        component: AdminContacts 
    },
    { 
        path: '/admin/companies', 
        name: 'admin_companies',
        component: AdminCompanies 
    },
    {
        path: '/admin/notes/create-note',
        name: 'admin_notes_create_note',
        component: AdminNotesCreateNote
    },
    {
        path: '/admin/notes/create-event',
        name: 'admin_notes_create_event',
        component: AdminNotesCreateEvent
    },
    {
        path: '/admin/notes/create-contact',
        name: 'admin_notes_create_contact',
        component: AdminNotesCreateContact
    },
    {
        path: '/admin/notes/create-company',
        name: 'admin_notes_create_company',
        component: AdminNotesCreateCompany
    },
    {
        path: '/admin/notes/edit-note/:id',
        name: 'admin_notes_edit_note',
        component: AdminNotesEditNote,
        props: true
    },
    {
        path: '/admin/companies/create-company',
        name: 'admin_companies_create_company',
        component: AdminCompaniesCreateCompany
    },
    {
        path: '/admin/companies/edit-company/:id',
        name: 'admin_companies_edit_company',
        component: AdminCompaniesEditCompany,
        props: true
    },
    {
        path: '/admin/companies/details-company/:id',
        name: 'admin_companies_details_company',
        component: AdminCompaniesDetailsCompany,
        props: true
    },
    {
        path: '/admin/reset-password',
        name: 'admin_reset_password',
        component: AdminResetPassword,
    },
    {
        path: '/admin/forgot-password',
        name: 'admin_forgot_password',
        component: AdminForgotPassword,
    },
    {
        path: '/admin/settings',
        name: 'admin_settings',
        component: AdminSettings,
    },


    
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;