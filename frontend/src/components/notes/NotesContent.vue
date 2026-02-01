<template>
    <div class="py-1">
        <div class="mx-auto sm:px-6 lg:px-8">
            <div name="header" class="mt-2 p-2">
                <h1 class="font-bold text-xl text-gray-800">
                    NOTES
                </h1>
                <hr>
            </div>

            <div :class="messageClass" name="message" class="mt-2 p-2">
                {{ message }}
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
                    <button type="button" @click="goToNoteCreate"
                        class="inline items-center px-4 py-2 my-3 bg-black border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-gray-700 active:bg-gray-900 focus:outline-none focus:border-gray-900 focus:shadow-outline-gray disabled:opacity-25 transition ease-in-out duration-150">
                        Create New Note
                    </button>
                    <router-link to="" class="mr-1">
                        <button
                        class="inline items-center px-4 py-2 my-3 bg-black border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-gray-700 active:bg-gray-900 focus:outline-none focus:border-gray-900 focus:shadow-outline-gray disabled:opacity-25 transition ease-in-out duration-150">
                        Download
                        </button>
                    </router-link>
                </div>
            </div>

            <div v-for="note in sanitizedNotes" :key="note.id"
                class="max-w mb-5 bg-black">
                <div
                    class="divide-y divide-gray-100 overflow-hidden rounded-lg border border-gray-200 bg-white shadow-sm">
                    <details class="group" open>
                        <summary
                            class="flex cursor-pointer list-none items-center justify-between p-2 group-open:bg-gray-50">
                            <div class="text-lg font-medium text-secondary-900">
                                {{ note.title }}
                            </div>
                            <div class="flex flex-row">
                                <div class="text-sm italic text-secondary-900 mr-4">
                                    {{ formatDate(note.created_at) }}
                                </div>
                                <div class="text-secondary-500">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                        stroke-width="1.5" stroke="currentColor"
                                        class="block h-5 w-5 transition-all duration-300 group-open:rotate-180">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M19.5 8.25l-7.5 7.5-7.5-7.5" />
                                    </svg>
                                </div>
                            </div>
                            
                        </summary>
                        <div class="p-4">
                            <div 
                                class="note-content prose" 
                                v-html="note.safeContent"
                            ></div>
                        </div>
                        
                        <hr class="">

                        <div class="p-2 group-open:bg-gray-50 flex flex-col ml-2 italic text-secondary-500 text-sm">
                            <div class="flex flex-row justify-between">
                                <div>
                                    <div class="flex flex-row">
                                        <div class="w-16">Company</div>
                                        <div class="mr-2">:</div>
                                        <button @click="goCompanyDetails(note.company.id)" class="hover:underline">
                                            {{ note.company.company_name }}
                                        </button>
                                    </div>
                                    <div class="flex flex-row">
                                        <div class="w-16">Contact</div>
                                        <div class="mr-2">:</div>
                                        <button @click="goContacts(note.contact)" class="hover:underline">
                                            {{ note.contact.first_name }} {{ note.contact.last_name }}
                                        </button>
                                    </div>
                                    <div class="flex flex-row">
                                        <div class="w-16">Event</div>
                                        <div class="mr-2">:</div>
                                        <button>{{ note.event.event_name }}</button>
                                    </div>
                                </div> 
                            </div>
                            


                            <div class="flex flex-row-reverse">
                                <button
                                    class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-black bg-gray-0 rounded-lg hover:bg-gray-400 focus:ring-4 focus:outline-none focus:ring-gray-300 dark:bg-gray-0 dark:hover:bg-gray-400 dark:focus:ring-gray-300 ease-in-out duration-150">
                                    <font-awesome-icon icon="share-from-square" />
                                </button>
                                <button @click="goToNoteEdit(note.id)"
                                    class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-black bg-gray-0 rounded-lg hover:bg-gray-400 focus:ring-4 focus:outline-none focus:ring-gray-300 dark:bg-gray-0 dark:hover:bg-gray-400 dark:focus:ring-gray-300 ease-in-out duration-150">
                                    <font-awesome-icon icon="pen" />
                                </button>
                                <button @click="openDeleteModal(note.id)"
                                    class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-black bg-gray-0 rounded-lg hover:bg-gray-400 focus:ring-4 focus:outline-none focus:ring-gray-300 dark:bg-gray-0 dark:hover:bg-gray-400 dark:focus:ring-gray-300 ease-in-out duration-150">
                                    <font-awesome-icon icon="trash" />
                                </button>
                            </div>
                        </div>
                    </details>
                </div>
            </div>

            <div v-for="note in notes" :key="'delete-' + note.id" >
                <div v-if="openDeleteModalId === note.id"
                    class="fixed inset-0 bg-gray-900 bg-opacity-75 flex items-center justify-center z-50 p-4">
                    <div class="flex flex-row max-w-lg w-full">
                        <div class="w-full bg-white rounded-xl shadow-2xl overflow-hidden">
                            <div class="py-1">
                                <div class="sm:px-6 lg:px-8">
                                    <div name="header" class="mt-4 p-2">
                                        <h1 class="font-bold text-2xl text-center text-gray-800">
                                            DELETE NOTE
                                        </h1>
                                        <hr class="mt-2 border-gray-200">
                                    </div>

                                    <div class="my-6 py-2 text-center">
                                        <p class="text-lg text-gray-700">Are you sure you want to delete 
                                            <b class="text-red-600">"{{ note.title }}"</b>?
                                        </p>
                                    </div>

                                    <div class="bg-gray-50 p-4 flex justify-between space-x-4">
                                        <!-- Cancel Button -->
                                        <button type="button" @click="closeDeleteModal"
                                                class="flex-1 rounded-md border border-gray-300 px-4 py-2 bg-white text-base font-medium text-gray-700 shadow-sm hover:bg-gray-100 transition ease-in-out duration-150">
                                            Cancel
                                        </button>

                                        <!-- Delete Button -->
                                        <button type="button" @click="deleteNote(note.id)"
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
</template>

<script setup>
    import { useRouter } from 'vue-router';
    import { onMounted, ref, computed } from 'vue';
    import axios from 'axios';
    import dayjs from 'dayjs'
    import DOMPurify from 'dompurify'

    // Get the router instance
    const router = useRouter();

    const notes = ref([]);

    const openDeleteModalId = ref(null)
    const deletedContactId = ref(null)

    const message = ref('');
    const messageClass = ref('hidden');

    const BASE_URL = "http://localhost:8080"

    function formatDate(dateStr) {
        return dayjs(dateStr).format('D MMMM YYYY')
    }

    onMounted(async () => {
        try {
            const resNotes = await axios.get(`${BASE_URL}/notes`)
            notes.value = resNotes.data.getUserNotes

        } catch (err) {
            console.error('Error fetching users:', err)
        }
    })

    const fetcNotes = async () => {
        try {
            const resNotes = await axios.get(`${BASE_URL}/notes`)
            notes.value = resNotes.data.getUserNotes
            user_id.value = resNotes.data.userID

        } catch (err) {
            console.error('Error fetching users:', err)
        }
    }

    const sanitizedNotes = computed(() =>
        notes.value.map(note => ({
            ...note,
            safeContent: DOMPurify.sanitize(note.body)
        }))
    )

    // Method to handle the navigation
    const goToNoteCreate = () => {
        router.push({ name: 'notes_create_note' });
    }

    const goToNoteEdit = (id) => {
        router.push({ name: 'notes_edit_note', params: { id } });
    }

    const openDeleteModal = (id) => {
        openDeleteModalId.value = id;
        deletedContactId.value = null;
    }

    const closeDeleteModal = () => {
        openDeleteModalId.value = null;
    }

    const deleteNote = async (id) => {
        message.value = '';
        messageClass.value = 'hidden';

        try {
            const url = `${BASE_URL}/notes/${id}`;
            const res = await axios.delete(url);

            message.value = res.data.message;
            messageClass.value = 'bg-green-100 text-green-700';

        } catch (error) {
        
            const errorMessage = error.response?.data?.error || 'Failed to delete event.';
            message.value = `Error: ${errorMessage}`;
            messageClass.value = 'bg-red-100 text-red-700';
            console.error('Delete error:', error);
        }

        closeDeleteModal()
        await fetcNotes()
    }

    const goCompanyDetails = (id) => {
        router.push({ name: 'companies_details_company', params: { id } })
    }

    const goContacts = (contact) => {
        const keyword = `${contact.first_name} ${contact.last_name}`

        router.push({
            name: 'contacts',
            query: {
                search: keyword
            }
        })
    }

</script>

<style scoped>
.prose-note p {
  margin-top: 0.25em;
  margin-bottom: 0.25em;
  line-height: 1.4;
}

.prose-note ul,
.prose-note ol {
  margin-top: 0.25em;
  margin-bottom: 0.25em;
}
</style>