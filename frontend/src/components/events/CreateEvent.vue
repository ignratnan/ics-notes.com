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
                            EVENTS <font-awesome-icon icon="angle-right" />
                            CREATE-EVENT
                        </h1>
                        <hr>
                    </div>

                    <!-- Status Message -->
                    <div v-if="message" :class="messageClass" class="p-4 rounded-lg mb-4 text-sm font-medium">
                        {{ message }}
                    </div>

                    <form @submit.prevent="submitEvent" class="space-y-4">
                        <div class="mt-4 mb-4">
                            <label for="title" class="block text-gray-700 text-sm font-bold my-2">Event</label>
                            <input type="text"
                                class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                id="title" v-model="form.event_name" required placeholder="Enter Event Name">
                        </div>
                        <div class="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
                                <span class="flex w-full rounded-md shadow-sm sm:ml-3 sm:w-auto">
                                    <button type="submit"
                                        class="inline-flex justify-center w-full rounded-md border border-transparent px-4 py-2 bg-green-600 text-base leading-6 font-medium text-white shadow-sm hover:bg-green-500 focus:outline-none focus:border-green-700 focus:shadow-outline-green transition ease-in-out duration-150 sm:text-sm sm:leading-5">
                                        Save
                                    </button>
                                </span>
                                <a href="/events">
                                    <span class="mt-3 flex w-full rounded-md shadow-sm sm:mt-0 sm:w-auto">
                                        <button type="button"
                                            class="inline-flex justify-center w-full rounded-md border border-gray-300 px-4 py-2 bg-white text-base leading-6 font-medium text-gray-700 shadow-sm hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue transition ease-in-out duration-150 sm:text-sm sm:leading-5">
                                            Cancel
                                        </button>
                                    </span>
                                </a>
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

import { onMounted, ref, reactive } from 'vue'
import axios from 'axios'
import dayjs from 'dayjs'

const message = ref('');
const messageClass = ref('');

const form = reactive({
    id: 0,
    event_name: '',
    deleted_at: null
})

const events = ref([]);
const editingEventId = ref(null);
const highestEventId = ref(null);

const API_URL = 'http://localhost:8080/events/create-event'

const fetchEvents = async () => {
    try {
        const res = await axios.get(API_URL)
        events.value = res.data
    } catch (err) {
        console.error('Error fetching users:', err)
    }
};

const submitEvent = async () => {
    message.value = '';
    messageClass.value = '';

    if (events.value.length > 0) {
        const EventIds = events.value.map(event => event.id);
        highestEventId.value = Math.max(...EventIds);
    } else {
        highestEventId.value = 2;
    }

    form.id = highestEventId.value + 1;

    const isEditing = editingEventId.value !== null;
    let url = API_URL;
    let method = 'post';

    if (isEditing) {
        url = `${API_URL}/${editingEventId.value}`;
        method = 'put';
    }

    try {
        const res = await axios({
            method: method,
            url: url,
            data: form
        });

        message.value = res.data.message;
        messageClass.value = 'bg-green-100 text-green-700';

        // Reset form and editing state
        form.id = 0;
        form.event_name = '';
        form.deleted_at = null;
        editingEventId.value = null;

        // Fetch updated posts
        await fetchEvents();
    } catch (error) {
        const errorMessage = error.response?.data?.error || 'An unexpected error occurred.';
        message.value = errorMessage;
        messageClass.value = 'bg-red-100 text-red-700';
    }
};

const cancelEdit = () => {
    form.id = 0;
    form.event_name = '';
    editingEventId.value = null;
    message.value = '';
    messageClass.value = '';
};

// Fetch posts when the component is first mounted
onMounted(fetchEvents);


function formatDate(dateStr) {
  return dayjs(dateStr).format('D MMMM YYYY')
}

</script>