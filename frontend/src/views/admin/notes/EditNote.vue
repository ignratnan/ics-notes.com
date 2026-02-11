<template>
    <div class="flex flex-row">
        <div>
            <SidebarBlock />
            <Sidebar />
        </div>
        <div class="w-full">
            <div class="py-1">
                <div class="mx-auto sm:px-6 lg:px-8">
                    <div name="header" class="mt-2 p-2">
                        <h1 class="font-bold text-xl text-gray-800">
                            NOTES <font-awesome-icon icon="angle-right" />
                            CREATE-NOTE
                        </h1>
                        <hr>
                    </div>
                    <a href="/notes/create-event">
                        <button type="button"
                            class="inline items-center px-4 py-2 my-3 bg-black border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-gray-700 active:bg-gray-900 focus:outline-none focus:border-gray-900 focus:shadow-outline-gray disabled:opacity-25 transition ease-in-out duration-150">
                            Create New Event
                        </button>
                    </a>
                    <a href="/notes/create-contact" class="ml-4">
                        <button type="button"
                            class="inline items-center px-4 py-2 my-3 bg-black border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-gray-700 active:bg-gray-900 focus:outline-none focus:border-gray-900 focus:shadow-outline-gray disabled:opacity-25 transition ease-in-out duration-150">
                            Create New Contact
                        </button>
                    </a>
                    <form>
                        <div class="bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
                            <label for="event_id"
                                class="block text-gray-700 text-sm font-bold my-2">
                                Event
                            </label>
                            <div class="flex flex-row">
                                <select v-model="note.event_id"
                                    class="w-full bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black p-2.5 dark:text-black dark:focus:ring-black dark:focus:border-black">
                                    <option value=0 disabled selected>Select Event</option>
                                    <option v-for="event in events" :key="event.id" :value="event.id">{{ event.event_name }}</option>
                                </select>
                            </div>
                            <label for="company_id"
                                class="block text-gray-700 text-sm font-bold my-2">
                                Company
                            </label>
                            <div class="flex flex-row">
                                <select v-model="note.company_id"
                                    class="w-full bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black p-2.5 dark:text-black dark:focus:ring-black dark:focus:border-black">
                                    <option value=0 disabled selected>Select Company</option>
                                    <option v-for="company in companies" :key="company.id" :value="company.id" required>{{ company.company_name }}</option>
                                </select>
                            </div>

                            <div class="">
                                <label for="contacts_id"
                                    class="block text-gray-700 text-sm font-bold my-2">
                                    Contact
                                </label>
                                <div class="flex flex-row items-center">
                                    <select v-model="note.contact_id" :disabled="!contacts.length"
                                        class="w-full bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black p-2.5 dark:text-black dark:focus:ring-black dark:focus:border-black">
                                        <option value=0 disabled selected>Select Contact</option>
                                        <option v-for="contact in contacts" :key="contact.id" :value="contact.id">{{ contact.first_name }} {{ contacts.last_name }}</option>
                                    </select>
                                </div>
                            </div>

                            <div class="mt-4 mb-4">
                                <label for="title" class="block text-gray-700 text-sm font-bold my-2">
                                    Note Title
                                </label>
                                <input v-model="note.title" type="text"
                                    class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                    id="title" placeholder="Enter Note Title">
                            </div>

                            <div class="mt-4 form-group">
                                <label for="body" class="block text-gray-700 text-sm font-bold my-2">
                                    Note
                                </label>
                                <div class="note-write">
                                    <NoteEditor v-model="note.body" />
                                </div>
                            </div>

                            <div :class="messageClass" name="message" class="mt-2 p-2">
                                {{ message }}
                            </div>

                            <div class="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
                                <span class="flex w-full rounded-md shadow-sm sm:ml-3 sm:w-auto">
                                    <button type="button" @click="submitNote"
                                        class="inline-flex justify-center w-full rounded-md border border-transparent px-4 py-2 bg-green-600 text-base leading-6 font-medium text-white shadow-sm hover:bg-green-500 focus:outline-none focus:border-green-700 focus:shadow-outline-green transition ease-in-out duration-150 sm:text-sm sm:leading-5">
                                        Save
                                    </button>
                                </span>
                                <a href="/notes">
                                    <span class="mt-3 flex w-full rounded-md shadow-sm sm:mt-0 sm:w-auto">
                                        <button type="button"
                                            class="inline-flex justify-center w-full rounded-md border border-gray-300 px-4 py-2 bg-white text-base leading-6 font-medium text-gray-700 shadow-sm hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue transition ease-in-out duration-150 sm:text-sm sm:leading-5">
                                            Cancel
                                        </button>
                                    </span>
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import Sidebar from '@/components/layout/Sidebar.vue'
import SidebarBlock from '@/components/layout/SidebarBlock.vue'
import NoteEditor from '../layout/NoteEditor.vue';

import { onMounted, ref, reactive, watch } from 'vue';
import { useRoute, useRouter } from 'vue-router'
import axios from 'axios';

const route = useRoute()
const router = useRouter()

const events = ref([])
const companies = ref([])
const contacts = ref([])
const user_me = ref({})
const BASE_URL = "http://localhost:8080"

const message = ref('');
const messageClass = ref('hidden');

const note = reactive ({
    id: 0,
    user_id: 0,
    event_id: 0,
    company_id: 0,
    contact_id: 0,
    title: "",
    body: "",
})

onMounted(async () => {
    try {
        const resMe = await axios.get(BASE_URL + "/me")
        user_me.value = resMe.data.userMe

        const resEvents = await axios.get(BASE_URL + "/events")
        events.value = resEvents.data.events

        const resCompanies = await axios.get(BASE_URL + "/companies")
        companies.value = resCompanies.data.companies

        contacts.value = []

        const resNote = await axios.get(`${BASE_URL}/notes/${route.params.id}`)
        note.id = resNote.data.note.id
        note.user_id = resNote.data.note.user_id
        note.event_id = resNote.data.note.event_id
        note.company_id = resNote.data.note.company_id
        note.contact_id = resNote.data.note.contact_id
        note.title = resNote.data.note.title
        note.body = resNote.data.note.body

    }   catch (err) {
        console.error('Error fetching users:', err)
    }
})

watch(() => note.company_id, async (companyID) => {
    contacts.value = []

    if (!companyID) return

    try {
        const resContacts = await axios.get(
            `${BASE_URL}/contacts/company/${companyID}`
        )
        contacts.value = resContacts.data.data
    } catch (err) {
        console.error('Error fetching contacts:', err)
    }
})

const submitNote = async () => {
    
    const url = `${BASE_URL}/notes/${note.id}`
    const res = await axios.put(url, note)

    message.value = res.data.message;
    messageClass.value = 'bg-green-100 text-green-700';

    note.id = 0;
    note.user_id = 0;
    note.event_id = 0;
    note.company_id = 0;
    note.contact_id = 0;
    note.title = "";
    note.body = "";

    setTimeout(() => {
        router.push({ name: 'notes' })
    }, 300)
}

</script>