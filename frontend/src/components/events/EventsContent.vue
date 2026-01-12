<template>
    <div>
        <div :class="createClass" class="fixed inset-0 bg-gray-900 bg-opacity-75 flex items-center justify-center z-50">
            <div class="flex flex-row">          
                <div class="w-full bg-white rounded-xl">                
                    <div class="py-1">                    
                        <div class="mx-auto sm:px-12 lg:px-12">
                            <div name="header" class="mt-2 p-2 w-96">
                                <h1 class="font-bold text-xl text-gray-800 text-center">
                                    CREATE EVENT
                                </h1>
                                <hr>
                            </div>

                            <form @submit.prevent="submitEvent" class="space-y-4">
                                <div class="my-6">
                                    <label for="title" class="block text-gray-700 text-sm font-bold my-2">Event</label>
                                    <input type="text"
                                        class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                        id="title" v-model="form.event_name" required placeholder="Enter Event Name">
                                </div>
                                <div class="px-auto py-3 sm:px-0 flex justify-between">
                                    <span class="flex w-full rounded-md shadow-sm sm:mt-0 sm:w-auto">
                                        <button type="button" @click="closeCreate"
                                            class="w-40 inline-flex justify-center w-full rounded-md border border-gray-300 px-4 py-2 bg-white text-base leading-6 font-medium text-gray-700 shadow-sm hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue transition ease-in-out duration-150 sm:text-sm sm:leading-5">
                                            Cancel
                                        </button>
                                    </span>    
                                    <span class="flex w-full rounded-md shadow-sm sm:mt-0 sm:w-auto">
                                        <button type="submit"
                                            class="w-40 inline-flex justify-center w-full rounded-md border border-transparent px-4 py-2 bg-green-600 text-base leading-6 font-medium text-white shadow-sm hover:bg-green-500 focus:outline-none focus:border-green-700 focus:shadow-outline-green transition ease-in-out duration-150 sm:text-sm sm:leading-5">
                                            Save
                                        </button>
                                    </span>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="py-1">
            <div class="mx-auto sm:px-6 lg:px-8">
                <div name="header" class="mt-2 p-2">
                    <h1 class="font-bold text-xl text-gray-800">
                        EVENTS
                    </h1>
                    <hr>
                </div>

                <div class="mt-3 grid grid-cols-2">
                    <form class="flex items-center">
                        <div class="relative w-full">
                            <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                                <svg aria-hidden="true" class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor"
                                    viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                        d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                                        clip-rule="evenodd"></path>
                                </svg>
                            </div>
                            <input type="search"
                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5  dark:bg-white dark:border-gray-600 dark:placeholder-black dark:text-black dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                placeholder="Search" name="search" value="">
                        </div>
                        <button type="submit"
                            class="p-2.5 ml-2 text-sm font-medium text-white bg-gray-700 rounded-lg border border-gray-700 hover:bg-gray-800 focus:ring-4 focus:outline-none focus:ring-gray-300 dark:bg-gray-600 dark:hover:bg-gray-700 dark:focus:ring-gray-800">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                                xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                            </svg>
                            <span class="sr-only">Search</span>
                        </button>
                    </form>
        
                    <div class="grid place-content-end">
                        <button @click="openCreate"
                            class="inline items-center px-4 py-2 my-3 bg-black border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-gray-700 active:bg-gray-900 focus:outline-none focus:border-gray-900 focus:shadow-outline-gray disabled:opacity-25 transition ease-in-out duration-150">
                            Create New Event
                        </button>
                    </div>

                </div>
                <div class="grid grid-cols-4 gap-2">
                    <div v-for="event in events" :key="event.id">
                        <article class="h-full min-h-32 px-4 py-2 rounded-md shadow-md bg-white border border-gray-600 flex flex-col">  
                            <div class="flex flex-row-reverse">
                                    <span
                                        class="text-sm font-light text-gray-800 dark:text-gray-800">{{ event.user.name }} || {{ formatDate(event.created_at) }}</span>
                                </div>
                                <div class="flex-grow">
                                    <h1 class="mt-2 text-lg font-semibold text-gray-800 dark:text-black">
                                        {{ event.event_name }}
                                    </h1>
                                </div>
                                <hr>
                                <div class="flex flex-row-reverse h-10">
                                    <button @click="openDeleteModal(event.id)"
                                        class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-black bg-gray-0 rounded-lg hover:bg-gray-400 focus:ring-4 focus:outline-none focus:ring-gray-300 dark:bg-gray-0 dark:hover:bg-gray-400 dark:focus:ring-gray-300 ease-in-out duration-150">
                                        <font-awesome-icon icon="trash" />
                                    </button>
                                    <button @click="openEditModal(event.id)"
                                        class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-black bg-gray-0 rounded-lg hover:bg-gray-400 focus:ring-4 focus:outline-none focus:ring-gray-300 dark:bg-gray-0 dark:hover:bg-gray-400 dark:focus:ring-gray-300 ease-in-out duration-150">
                                        <font-awesome-icon icon="pen" />
                                    </button>
                                    <a href="#" class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-black bg-gray-0 rounded-lg hover:bg-gray-400 focus:ring-4 focus:outline-none focus:ring-gray-300 dark:bg-gray-0 dark:hover:bg-gray-400 dark:focus:ring-gray-300 ease-in-out duration-150">
                                        <button>
                                            <font-awesome-icon icon="magnifying-glass" />
                                        </button>
                                    </a>
                                </div>
                        </article>
                    </div>

                    <div v-for="event in events" :key="'edit-' + event.id">
                        <div v-if="openEditModalId === event.id" 
                            class="fixed inset-0 bg-gray-900 bg-opacity-75 flex items-center justify-center z-50 p-4">
                            <div class="flex flex-row">          
                                <div class="w-full bg-white rounded-xl">                
                                    <div class="py-1">                    
                                        <div class="mx-auto sm:px-12 lg:px-12">
                                            <div name="header" class="mt-2 p-2 w-96">
                                                <h1 class="font-bold text-xl text-gray-800 text-center">
                                                    EDIT EVENT
                                                </h1>
                                                <hr>
                                            </div>

                                            <form @submit.prevent="submitEdit(event.id)" class="space-y-4">
                                                <div class="my-6">
                                                    <label for="title" class="block text-gray-700 text-sm font-bold my-2">Event</label>
                                                    <input type="text"
                                                        class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                                        id="title" v-model="form.event_name" required>
                                                </div>
                                                <div class="px-auto py-3 sm:px-0 flex justify-between">
                                                    <span class="flex w-full rounded-md shadow-sm sm:mt-0 sm:w-auto">
                                                        <button type="button" @click="closeEditModal"
                                                            class="w-40 inline-flex justify-center w-full rounded-md border border-gray-300 px-4 py-2 bg-white text-base leading-6 font-medium text-gray-700 shadow-sm hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue transition ease-in-out duration-150 sm:text-sm sm:leading-5">
                                                            Cancel
                                                        </button>
                                                    </span>    
                                                    <span class="flex w-full rounded-md shadow-sm sm:mt-0 sm:w-auto">
                                                        <button type="submit"
                                                            class="w-40 inline-flex justify-center w-full rounded-md border border-transparent px-4 py-2 bg-green-600 text-base leading-6 font-medium text-white shadow-sm hover:bg-green-500 focus:outline-none focus:border-green-700 focus:shadow-outline-green transition ease-in-out duration-150 sm:text-sm sm:leading-5">
                                                            Save
                                                        </button>
                                                    </span>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div v-for="event in events" :key="'delete-' + event.id">
                        <div v-if="openDeleteModalId === event.id" 
                            class="fixed inset-0 bg-gray-900 bg-opacity-75 flex items-center justify-center z-50 p-4">
                            <div class="flex flex-row max-w-lg w-full">
                                <div class="w-full bg-white rounded-xl shadow-2xl overflow-hidden">
                                    <div class="py-1">
                                        <div class="sm:px-6 lg:px-8">
                                            <div name="header" class="mt-4 p-2">
                                                <h1 class="font-bold text-2xl text-center text-gray-800">
                                                    DELETE EVENT
                                                </h1>
                                                <hr class="mt-2 border-gray-200">
                                            </div>

                                            <div class="my-6 py-2 text-center">
                                                <p class="text-lg text-gray-700">Are you sure you want to delete 
                                                    <b class="text-red-600">"{{ event.event_name }}"</b>?
                                                </p>
                                            </div>

                                            <div class="bg-gray-50 p-4 flex justify-between space-x-4">
                                                <!-- Cancel Button -->
                                                <button type="button" @click="closeDeleteModal"
                                                        class="flex-1 rounded-md border border-gray-300 px-4 py-2 bg-white text-base font-medium text-gray-700 shadow-sm hover:bg-gray-100 transition ease-in-out duration-150">
                                                    Cancel
                                                </button>

                                                <!-- Delete Button -->
                                                <button type="button" @click="deleteEvent(event.id)"
                                                        class="flex-1 rounded-md border border-transparent px-4 py-2 bg-red-600 text-base font-medium text-white shadow-sm hover:bg-red-700 transition ease-in-out duration-150">
                                                    Delete
                                                </button>
                                            </div>
                                        </div>
                                    </div>
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
import { onMounted, ref, reactive } from 'vue'
import axios from 'axios'
import dayjs from 'dayjs'

const events = ref([])
const userMe = ref(null)
const createClass = ref('hidden')

const openDeleteModalId = ref(null)
const deletedEventId = ref(null)
const openEditModalId = ref(null)

const message = ref('');
const messageClass = ref('');

const form = reactive({
    id: 0,
    user_id: 0,
    event_name: '',
})

const BASE_URL = 'http://localhost:8080/events'

const fetchEvents = async () => {
    try {
        const res = await axios.get(BASE_URL)
        events.value = res.data
    } catch (err) {
        console.error('Error fetching users:', err)
    }
};

onMounted(async () => {
    try {
        const res = await axios.get(BASE_URL)
        events.value = res.data.events

        const resMe = await axios.get('http://localhost:8080/me')
        userMe.value = resMe.data.userMe

        createClass.value = 'hidden'
    } catch (err) {
        console.error('Error fetching users:', err)
    }
})

const openCreate = () => {
    form.id = 0;
    form.event_name = '';
    createClass.value = '';
}

const closeCreate = () => {
    createClass.value = 'hidden'
}

const openEditModal = async (id) => {
    try {
        // 1. Fetch the specific event data using the ID
        const url = `${BASE_URL}/${id}`; 
        const res = await axios.get(url);
        
        // 2. Populate the form with the fetched data
        form.id = res.data.id; 
        form.event_name = res.data.event_name;

        // 3. Set state variables to enter 'editing' mode and show the modal
        openEditModalId.value = id; // This likely controls your modal visibility
        
    } catch (err) {
        console.error('Error fetching event data for edit:', err);
        message.value = 'Failed to load event data for editing.';
        messageClass.value = 'bg-red-100 text-red-700';
    }
}

const closeEditModal = () => {
    // Clear the form and reset state when closing the modal
    form.id = 0;
    form.event_name = '';
    openEditModalId.value = null;
}

const openDeleteModal = (id) => {
    openDeleteModalId.value = id;
    deletedEventId.value = null;
}

const closeDeleteModal = () => {
    openDeleteModalId.value = null;
}

const submitEvent = async () => {
    message.value = '';
    messageClass.value = '';
    form.user_id = userMe.value.id

    try {
        // Simpler and often preferred for POST requests
    
        const url = `${BASE_URL}`;
        const res = await axios.post(url, form);

        message.value = res.data.message;
        messageClass.value = 'bg-green-100 text-green-700';

        // Reset form and editing state
        form.id = 0;
        form.user_id = 0;
        form.event_name = '';

        closeCreate()

        await fetchEvents();

    } catch (error) {
        const errorMessage = error.response?.data?.error || 'An unexpected error occurred.';
        message.value = errorMessage;
        messageClass.value = 'bg-red-100 text-red-700';
    }
};

const submitEdit = async (eventID) => {
    message.value = '';
    messageClass.value = '';

    try {
        // Simpler and often preferred for POST requests
        const url = `${BASE_URL}/${eventID}`;
        const res = await axios.put(url, form);

        message.value = res.data.message;
        messageClass.value = 'bg-green-100 text-green-700';

        // Reset form and editing state
        form.id = 0;
        form.user_id = 0;
        form.event_name = '';

        closeEditModal()

        // Fetch updated posts
        await fetchEvents();
    } catch (error) {
        const errorMessage = error.response?.data?.error || 'An unexpected error occurred.';
        message.value = errorMessage;
        messageClass.value = 'bg-red-100 text-red-700';
    }

}

const deleteEvent = async (eventID) => {
    message.value = '';

    try {
        const url = `${BASE_URL}/${eventID}`;
        const res = await axios.delete(url);

        message.value = `Successfully deleted: ${res.data.message}`;
    } catch (error) {
        
        const errorMessage = error.response?.data?.error || 'Failed to delete event.';
        message.value = `Error: ${errorMessage}`;
        console.error('Delete error:', error);
    }

    closeDeleteModal()
    
    await fetchEvents();
}

function formatDate(dateStr) {
  return dayjs(dateStr).format('D MMMM YYYY')
}

</script>
