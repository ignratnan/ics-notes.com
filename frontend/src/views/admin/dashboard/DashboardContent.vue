<template>
    <div>
        <div class="py-1">
            <div class="mx-auto sm:px-6 lg:px-8">
                <div name="header" class="mt-2 p-2">
                    <h1 class="font-bold text-xl text-gray-800">
                        DASHBOARD
                    </h1>
                    <hr>
                </div>

                <div name="content">
                    <div class="p-4">
                        <div class="font-bold text-xl text-gray-800">
                    
                        </div>
                        <div class="flex justify-between">
                            <div :class="notes_back" class="w-56 p-4 pb-6 rounded-t-xl">
                                <button @click="showNotes" type="button" class="flex items-center h-32 w-full border-2 rounded-md shadow-md bg-white hover:bg-gray-100">
                                    <div class="p-2 justify-items-center w-full">
                                        <div>
                                            <font-awesome-icon icon="note-sticky" class="text-4xl" />
                                        </div>
                                        <div class="mt-2 font-bold text-base text-gray-800">Notes</div>
                                    </div>
                                </button>
                                <div class="mt-1 flex flex-row w-full">
                                    <div class="flex items-center w-2/4 border-2 shadow-md bg-white hover:bg-gray-100">
                                        <div class="p-2 justify-items-center w-full">
                                            <div class="font-bold text-base text-gray-800">
                                                {{ notes_total }}
                                            </div>
                                        </div>
                                    </div>
                                    <a :href="downloadNotes" class="w-1/4 ml-1">
                                        <button type="button" class="flex items-center w-full border-2 shadow-md bg-white hover:bg-gray-100">
                                            <div class="p-2 justify-items-center w-full">
                                                <div>
                                                    <font-awesome-icon icon="download" class="text-xmd" />
                                                </div>
                                            </div>
                                        </button>
                                    </a>
                                    <button @click="toCreateNote" type="button" class="flex items-center ml-1 w-1/4 border-2 shadow-md bg-white hover:bg-gray-100">
                                        <div class="p-2 justify-items-center w-full">
                                            <div>
                                                <font-awesome-icon icon="plus" class="text-md" />
                                            </div>
                                        </div>
                                    </button>
                                </div>
                            </div>
                            <div :class="events_back" class="w-56 p-4 pb-6 rounded-t-xl">
                                <button @click="showEvents" type="button" class="flex items-center h-32 w-full border-2 rounded-md shadow-md bg-white hover:bg-gray-100">
                                    <div class="p-2 justify-items-center w-full">
                                        <div>
                                            <font-awesome-icon icon="calendar-days" class="text-4xl" />
                                        </div>
                                        <div class="mt-2 font-bold text-base text-gray-800">Events</div>
                                    </div>
                                </button>
                                <div class="mt-1 flex flex-row w-full">
                                    <div class="flex items-center w-2/4 border-2 shadow-md bg-white hover:bg-gray-100">
                                        <div class="p-2 justify-items-center w-full">
                                            <div class="font-bold text-base text-gray-800">
                                                {{ events_total }}
                                            </div>
                                        </div>
                                    </div>
                                    <a :href="downloadEvents" class="w-1/4 ml-1">
                                        <button type="button" class="flex items-center w-full border-2 shadow-md bg-white hover:bg-gray-100">
                                            <div class="p-2 justify-items-center w-full">
                                                <div>
                                                    <font-awesome-icon icon="download" class="text-xmd" />
                                                </div>
                                            </div>
                                        </button>
                                    </a>
                                    
                                    <button @click="toCreateEvent" type="button" class="flex items-center ml-1 w-1/4 border-2 shadow-md bg-white hover:bg-gray-100">
                                        <div class="p-2 justify-items-center w-full">
                                            <div>
                                                <font-awesome-icon icon="plus" class="text-md" />
                                            </div>
                                        </div>
                                    </button>
                                </div>
                            </div>
                            <div :class="companies_back" class="w-56 p-4 pb-6 rounded-t-xl">
                                <button @click="showCompanies" type="button" class="flex items-center h-32 w-full border-2 rounded-md shadow-md bg-white hover:bg-gray-100">
                                    <div class="p-2 justify-items-center w-full">
                                        <div>
                                            <font-awesome-icon icon="building" class="text-4xl" />
                                        </div>
                                        <div class="mt-2 font-bold text-base text-gray-800">Companies</div>
                                    </div>
                                </button>
                                <div class="mt-1 flex flex-row w-full">
                                    <div class="flex items-center w-2/4 border-2 shadow-md bg-white hover:bg-gray-100">
                                        <div class="p-2 justify-items-center w-full">
                                            <div class="font-bold text-base text-gray-800">
                                                {{ companies_total }}
                                            </div>
                                        </div>
                                    </div>
                                    <a :href="downloadCompanies" class="w-1/4 ml-1">
                                        <button type="button" class="flex items-center w-full border-2 shadow-md bg-white hover:bg-gray-100">
                                            <div class="p-2 justify-items-center w-full">
                                                <div>
                                                    <font-awesome-icon icon="download" class="text-xmd" />
                                                </div>
                                            </div>
                                        </button>
                                    </a>
                                    <button @click="toCreateCompany" type="button" class="flex items-center ml-1 w-1/4 border-2 shadow-md bg-white hover:bg-gray-100">
                                        <div class="p-2 justify-items-center w-full">
                                            <div>
                                                <font-awesome-icon icon="plus" class="text-md" />
                                            </div>
                                        </div>
                                    </button>
                                </div>
                            </div>
                            <div :class="contacts_back" class="w-56 p-4 pb-6 rounded-t-xl">
                                <button @click="showContacts" type="button" class="flex items-center h-32 w-full border-2 rounded-md shadow-md bg-white hover:bg-gray-100">
                                    <div class="p-2 justify-items-center w-full">
                                        <div>
                                            <font-awesome-icon icon="address-book" class="text-4xl" />
                                        </div>
                                        <div class="mt-2 font-bold text-base text-gray-800">Contacts</div>
                                    </div>
                                </button>
                                <div class="mt-1 flex flex-row w-full">
                                    <div class="flex items-center w-2/4 border-2 shadow-md bg-white hover:bg-gray-100">
                                        <div class="p-2 justify-items-center w-full">
                                            <div class="font-bold text-base text-gray-800">
                                                {{ contacts_total }}
                                            </div>
                                        </div>
                                    </div>
                                    <a :href="downloadContacts" class="w-1/4 ml-1">
                                        <button type="button" class="flex items-center w-full border-2 shadow-md bg-white hover:bg-gray-100">
                                            <div class="p-2 justify-items-center w-full">
                                                <div>
                                                    <font-awesome-icon icon="download" class="text-xmd" />
                                                </div>
                                            </div>
                                        </button>
                                    </a>
                                    
                                    <button @click="toCreateContact" type="button" class="flex items-center ml-1 w-1/4 border-2 shadow-md bg-white hover:bg-gray-100">
                                        <div class="p-2 justify-items-center w-full">
                                            <div>
                                                <font-awesome-icon icon="plus" class="text-md" />
                                            </div>
                                        </div>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="border border-gray-300 shadow-md pb-4 rounded-b-lg bg-gray-200">
                            <div :class="notes_class" class="">
                                <div class="">
                                    <div class="h-10 flex flex-row items-center justify-between border-t font-bold text-base text-gray-800">
                                        <div class="px-4 grow">
                                            Title
                                        </div>
                                        <div class="px-4 w-64">
                                            Company
                                        </div>
                                        <div class="px-4 w-48 text-right">
                                            Created At
                                        </div>
                                    </div>
                                    <hr>
                                </div>
                                <div v-for="note in notes" :key="note.id" class="bg-gray-50">
                                    <div class="h-10 flex flex-row items-center justify-between">
                                        <div class="px-4 grow">
                                            {{ note.title }}
                                        </div>
                                        <div class="px-4 w-64">
                                            {{ note.company.company_name }}
                                        </div>
                                        <div class="px-4 w-48 text-right">
                                            {{ formatDate(note.created_at) }}
                                        </div>
                                    </div>
                                    <hr>
                                </div>
                            </div>
                            <div :class="events_class" class="">
                                <div>
                                    <div class="h-10 flex flex-row items-center justify-between border-t font-bold text-base text-gray-800">
                                        <div class="px-4 grow">
                                            Event
                                        </div>
                                        <div class="px-4 w-64">
                                            Created By
                                        </div>
                                        <div class="px-4 w-48 text-right">
                                            Created At
                                        </div>
                                    </div>
                                    <hr>
                                </div>
                                <div v-for="event in events" :key="event.id" class="bg-gray-50">
                                    <div class="h-10 flex flex-row items-center justify-between">
                                        <div class="px-4 grow">
                                            {{ event.event_name }}
                                        </div>
                                        <div class="px-4 w-64">
                                            {{ event.user.name }}
                                        </div>
                                        <div class="px-4 w-48 text-right">
                                            {{ formatDate(event.created_at) }}
                                        </div>
                                    </div>
                                    <hr>
                                </div>
                            </div>
                            <div :class="companies_class" class="">
                                <div>
                                    <div class="h-10 flex flex-row items-center justify-between border-t font-bold text-base text-gray-800">
                                        <div class="px-4 grow">
                                            Company
                                        </div>
                                        <div class="px-4 w-64">
                                            Country
                                        </div>
                                        <div class="px-4 w-48 text-right">
                                            Created At
                                        </div>
                                    </div>
                                    <hr>
                                </div>
                                <div v-for="company in companies" :key="company.id" class="bg-gray-50">
                                    <div class="h-10 flex flex-row items-center justify-between">
                                        <div class="px-4 grow">
                                            {{ company.company_name }}
                                        </div>
                                        <div class="px-4 w-64">
                                            {{ company.company_country }}
                                        </div>
                                        <div class="px-4 w-48 text-right">
                                            {{ formatDate(company.created_at) }}
                                        </div>
                                    </div>
                                    <hr>
                                </div>
                            </div>
                            <div :class="contacts_class" class="">
                                <div>
                                    <div class="h-10 flex flex-row items-center justify-between border-t font-bold text-base text-gray-800">
                                        <div class="px-4 grow">
                                            Contact
                                        </div>
                                        <div class="px-4 w-64">
                                            Company
                                        </div>
                                        <div class="px-4 w-48 text-right">
                                            Created At
                                        </div>
                                    </div>
                                    <hr>
                                </div>
                                <div v-for="contact in contacts" :key="contact.id" class="bg-gray-50">
                                    <div class="h-10 flex flex-row items-center justify-between">
                                        <div class="px-4 grow">
                                            {{ contact.first_name }} {{ contact.last_name }}
                                        </div>
                                        <div class="px-4 w-64">
                                            {{ contact.company.company_name }}
                                        </div>
                                        <div class="px-4 w-48 text-right">
                                            {{ formatDate(contact.created_at) }}
                                        </div>
                                    </div>
                                    <hr>
                                </div>
                            </div>
                            
                        </div>
        
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
    import { useRouter, useRoute } from 'vue-router';
    import { onMounted, ref, computed } from 'vue';
    import axios from 'axios';
    import dayjs from 'dayjs'

    const router = useRouter();
    const route = useRoute();

    const notes = ref([]);
    const my_notes = ref([]);
    const events = ref([]);
    const contacts = ref([]);
    const companies = ref([]);

    const notes_total = ref(0);
    const my_notes_total = ref(0);
    const events_total = ref(0);
    const companies_total = ref(0);
    const contacts_total = ref(0);

    const notes_class = ref('hidden');
    const my_notes_class = ref('');
    const events_class = ref('hidden');
    const companies_class = ref('hidden');
    const contacts_class = ref('hidden');

    const notes_back = ref('bg-white');
    const my_notes_back = ref('bg-gray-200 border border-gray-300');
    const events_back = ref('bg-white');
    const companies_back = ref('bg-white');
    const contacts_back = ref('bg-white');

    const search = ref("");
    const show = ref("")

    const message = ref('');
    const messageClass = ref('hidden');

    const BASE_URL = "http://localhost:8080"
    const downloadNotes = `${BASE_URL}/notes/export/csv`
    const downloadEvents = `${BASE_URL}/events/export/csv`
    const downloadCompanies = `${BASE_URL}/companies/export/csv`
    const downloadContacts = `${BASE_URL}/contacts/export/csv`





    function formatDate(dateStr) {
        return dayjs(dateStr).format('D-MMM-YYYY')
    }

    onMounted(async () => {
        try {
            const res = await axios.get(`${BASE_URL}/dashboard`, {
                params: {
                    show: route.query.show || 'notes'
                }
            })
            notes.value = res.data.notes
            my_notes.value = res.data.my_notes
            events.value = res.data.events
            companies.value = res.data.companies
            contacts.value = res.data.contacts

            notes_total.value = res.data.notes_total
            my_notes_total.value = res.data.my_notes_total
            events_total.value = res.data.events_total
            companies_total.value = res.data.companies_total
            contacts_total.value = res.data.contacts_total

            show.value = res.data.show

            getShow(show.value)

        } catch (err) {
            console.error('Error fetching users:', err)
        }
    })

    const getShow = (show) => {
        switch (show) {
            case 'notes':
                showNotes()
                break
            case 'my_notes':
                showMyNotes()
                break
            case 'events':
                showEvents()
                break
            case 'companies':
                showCompanies()
                break
            case 'contacts':
                showContacts()
                break
            default:
                showMyNotes()
                break
        }
    }


    const fetchDashboard = async () => {
        try {
            const res = await axios.get(`${BASE_URL}/dashboard`)
            notes.value = res.data.notes
            events.value = res.data.events
            companies.value = res.data.companies
            contacts.value = res.data.contacts

            notes_total.value = res.data.notes_total
            my_notes_total.value = res.data.my_notes_total
            events_total.value = res.data.events_total
            companies_total.value = res.data.companies_total
            contacts_total.value = res.data.contacts_total

        } catch (err) {
            console.error('Error fetching users:', err)
        }
    }

    const showNotes = () => {
        my_notes_class.value = 'hidden';
        events_class.value = 'hidden';
        companies_class.value = 'hidden';
        contacts_class.value = 'hidden';
        notes_class.value = '';

        my_notes_back.value = 'bg-white';
        events_back.value = 'bg-white';
        companies_back.value = 'bg-white';
        contacts_back.value = 'bg-white';
        notes_back.value = 'bg-gray-200 border border-gray-300';
    }

    const showMyNotes = () => {
        notes_class.value = 'hidden';
        events_class.value = 'hidden';
        companies_class.value = 'hidden';
        contacts_class.value = 'hidden';
        my_notes_class.value = '';

        notes_back.value = 'bg-white';
        events_back.value = 'bg-white';
        companies_back.value = 'bg-white';
        contacts_back.value = 'bg-white';
        my_notes_back.value = 'bg-gray-200 border border-gray-300';
    }

    const showEvents = () => {
        notes_class.value = 'hidden';
        my_notes_class.value = 'hidden';
        companies_class.value = 'hidden';
        contacts_class.value = 'hidden';
        events_class.value = '';

        notes_back.value = 'bg-white';
        my_notes_back.value = 'bg-white';
        companies_back.value = 'bg-white';
        contacts_back.value = 'bg-white';
        events_back.value = 'bg-gray-200 border border-gray-300';
    }

    const showCompanies = () => {
        notes_class.value = 'hidden';
        my_notes_class.value = 'hidden';
        events_class.value = 'hidden';
        contacts_class.value = 'hidden';
        companies_class.value = '';

        notes_back.value = 'bg-white';
        my_notes_back.value = 'bg-white';
        events_back.value = 'bg-white';
        contacts_back.value = 'bg-white';
        companies_back.value = 'bg-gray-200 border border-gray-300';
    }

    const showContacts = () => {
        notes_class.value = 'hidden';
        my_notes_class.value = 'hidden';
        events_class.value = 'hidden';
        companies_class.value = 'hidden';
        contacts_class.value = '';

        notes_back.value = 'bg-white';
        my_notes_back.value = 'bg-white';
        events_back.value = 'bg-white';
        companies_back.value = 'bg-white';
        contacts_back.value = 'bg-gray-200 border border-gray-300';
    }

    const toCreateNote = () => {
        router.push({ name: 'admin_dashboard_create_note' })
    }

    const toCreateEvent = () => {
        router.push({ name: 'admin_dashboard_create_event' })
    }

    const toCreateCompany = () => {
        router.push({ name: 'admin_dashboard_create_company' })
    }

    const toCreateContact = () => {
        router.push({ name: 'admin_dashboard_create_contact' })
    }

</script>