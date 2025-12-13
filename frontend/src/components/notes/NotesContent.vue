<template>
    <div class="py-1">
        <div class="mx-auto sm:px-6 lg:px-8">
            <div name="header" class="mt-2 p-2">
                <h1 class="font-bold text-xl text-gray-800">
                    NOTES
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

                <div class="flex flex-row-reverse">
                    <router-link to="/notes/create-note">
                        <button type="button"
                            class="inline items-center px-4 py-2 my-3 bg-black border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-gray-700 active:bg-gray-900 focus:outline-none focus:border-gray-900 focus:shadow-outline-gray disabled:opacity-25 transition ease-in-out duration-150">
                            Create New Note
                        </button>
                    </router-link>
                    <router-link to="" class="mr-1">
                        <button
                        class="inline items-center px-4 py-2 my-3 bg-black border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-gray-700 active:bg-gray-900 focus:outline-none focus:border-gray-900 focus:shadow-outline-gray disabled:opacity-25 transition ease-in-out duration-150">
                        Download
                        </button>
                    </router-link>
                </div>
            </div>
                <div v-for="note in notes" :key="note.id"
                    class="max-w mb-5 bg-black">
                    <div
                        class="divide-y divide-gray-100 overflow-hidden rounded-lg border border-gray-200 bg-white shadow-sm">
                        <details class="group" open>
                            <summary
                                class="flex cursor-pointer list-none items-center justify-between p-2 text-lg font-medium text-secondary-900 group-open:bg-gray-50">
                                <div class="flex items-center justify-between">
                                    {{ note.title }}
                                </div>
                                <div class="text-secondary-500">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                        stroke-width="1.5" stroke="currentColor"
                                        class="block h-5 w-5 transition-all duration-300 group-open:rotate-180">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M19.5 8.25l-7.5 7.5-7.5-7.5" />
                                    </svg>
                                </div>
                            </summary>
                            <div v-html="note.body"
                                class="border-t border-t-gray-100 p-4 text-secondary-500"></div>
                            <hr class="">

                            <div class="p-2 group-open:bg-gray-50 flex flex-col ml-2 italic text-sm">
                                <div>
                                    Company :
                                    <a href="#">{{ note.company.company_name }}</a>
                                </div>
                                <div>
                                    Contact :
                                    <a href="#">{{ note.contact.first_name }} {{ note.contact.last_name }}</a>
                                </div>
                                <div>
                                    Event :
                                    <a href="#">{{ note.event.event_name }}</a>
                                </div>
                                <div>
                                    Created date :
                                    <a>{{ formatDate(note.created_at) }}</a>
                                </div>

                                <div class="flex flex-row-reverse">
                                    <a href="#">
                                        <button
                                            class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-black bg-gray-0 rounded-lg hover:bg-gray-400 focus:ring-4 focus:outline-none focus:ring-gray-300 dark:bg-gray-0 dark:hover:bg-gray-400 dark:focus:ring-gray-300 ease-in-out duration-150">
                                            <font-awesome-icon icon="share-from-square" />
                                        </button>
                                    </a>
                                    <button
                                        class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-black bg-gray-0 rounded-lg hover:bg-gray-400 focus:ring-4 focus:outline-none focus:ring-gray-300 dark:bg-gray-0 dark:hover:bg-gray-400 dark:focus:ring-gray-300 ease-in-out duration-150">
                                        <font-awesome-icon icon="pen" />
                                    </button>
                                    <button
                                        class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-black bg-gray-0 rounded-lg hover:bg-gray-400 focus:ring-4 focus:outline-none focus:ring-gray-300 dark:bg-gray-0 dark:hover:bg-gray-400 dark:focus:ring-gray-300 ease-in-out duration-150">
                                        <font-awesome-icon icon="trash" />
                                    </button>
                                </div>
                            </div>
                        </details>
                    </div>
                </div>
            <nav class="mt-3" aria-label="Page navigation example">
                <ul class="flex-col -space-x-px">

                </ul>
            </nav>
        </div>
    </div>
</template>

<script setup>
    import { useRouter } from 'vue-router';
    import { onMounted, ref } from 'vue';
    import axios from 'axios';
    import dayjs from 'dayjs'

    // Get the router instance
    const router = useRouter();

    const notes = ref([]);

    const BASE_URL = "http://localhost:8080/notes"

    function formatDate(dateStr) {
        return dayjs(dateStr).format('D MMMM YYYY')
    }

    onMounted(async () => {
        try {
            const resNotes = await axios.get(BASE_URL)
            notes.value = resNotes.data
        } catch (err) {
            console.error('Error fetching users:', err)
        }
    })

    // Method to handle the navigation
    const goToNoteCreate = () => {
    // Navigate to the route with the name 'note_create'
    router.push({ name: 'note_create' });
    };
</script>