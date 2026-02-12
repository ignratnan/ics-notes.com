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
                            CREATE-EVENT
                        </h1>
                        <hr>
                    </div>
                    <form @submit.prevent="submitEvent">
                        <div class="mt-4 mb-4">
                            <label for="title" class="block text-gray-700 text-sm font-bold my-2">
                                Event
                            </label>
                            <input type="text" v-model="form.event_name"
                                class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                id="title" placeholder="Enter Event Name">
                        </div>

                        <div :class="messageClass" name="message" class="mt-2 p-2">
                            {{ message }}
                        </div>
                        
                        <div class="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
                                <span class="flex w-full rounded-md shadow-sm sm:ml-3 sm:w-auto">
                                    <button type="submit"
                                        class="inline-flex justify-center w-full rounded-md border border-transparent px-4 py-2 bg-green-600 text-base leading-6 font-medium text-white shadow-sm hover:bg-green-500 focus:outline-none focus:border-green-700 focus:shadow-outline-green transition ease-in-out duration-150 sm:text-sm sm:leading-5">
                                        Save
                                    </button>
                                </span>
                                <span class="mt-3 flex w-full rounded-md shadow-sm sm:mt-0 sm:w-auto">
                                    <button type="button" @click="router.push({ name: 'notes_create_note' })"
                                        class="inline-flex justify-center w-full rounded-md border border-gray-300 px-4 py-2 bg-white text-base leading-6 font-medium text-gray-700 shadow-sm hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue transition ease-in-out duration-150 sm:text-sm sm:leading-5">
                                        Cancel
                                    </button>
                                </span>
                            </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import Sidebar from '@/views/admin/layout/Sidebar.vue'
import SidebarBlock from '@/views/admin/layout/SidebarBlock.vue'

import { reactive, ref } from 'vue'
import { useRouter } from 'vue-router'
import axios from 'axios'

const router = useRouter()

const message = ref('')
const messageClass = ref('hidden')

const form = reactive({
    event_name: ''
});

const BASE_URL = 'http://localhost:8080';

const submitEvent = async () => {
    message.value = '';
    messageClass.value = 'hidden';

    try {    
        const url = `${BASE_URL}/events`;
        const res = await axios.post(url, form);

        message.value = res.data.message;
        messageClass.value = 'bg-green-100 text-green-700';

        setTimeout(() => {
            router.push({ name: 'notes_create_note' })
        }, 300)

    } catch (error) {
        const errorMessage = error.response?.data?.error || 'An unexpected error occurred.';
        message.value = errorMessage;
        messageClass.value = 'bg-red-100 text-red-700';
    }

    
};


</script>