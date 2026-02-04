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

                <div name="content"  >
                    <div class="p-4 my-2">
                        <div class="font-bold text-xl text-gray-800">
                    
                        </div>
                        <div class="flex flex-row justify-around my-2">
                            <div class="w-48 flex flex-col justify-center">
                                <button @click="" type="button" class="mx-2 flex items-center h-32 w-full border-2 rounded-md shadow-md hover:bg-gray-100">
                                    <div class="p-2 justify-items-center w-full">
                                        <div>
                                            <font-awesome-icon icon="note-sticky" class="text-4xl" />
                                        </div>
                                        <div class="mt-2 font-bold text-base text-gray-800">My Notes</div>
                                    </div>
                                </button>
                                <div class="mt-1 mx-2 flex flex-row w-full">
                                    <div class="flex items-center w-2/4 border-2 shadow-md hover:bg-gray-100">
                                        <div class="p-2 justify-items-center w-full">
                                            <div class="font-bold text-base text-gray-800">
                                                {{ my_notes_total }}
                                            </div>
                                        </div>
                                    </div>
                                    <button @click="" type="button" class="flex items-center ml-1 w-1/4 border-2 shadow-md hover:bg-gray-100">
                                        <div class="p-2 justify-items-center w-full">
                                            <div>
                                                <font-awesome-icon icon="magnifying-glass" class="text-xmd" />
                                            </div>
                                        </div>
                                    </button>
                                    <button @click="" type="button" class="flex items-center ml-1 w-1/4 border-2 shadow-md hover:bg-gray-100">
                                        <div class="p-2 justify-items-center w-full">
                                            <div>
                                                <font-awesome-icon icon="plus" class="text-md" />
                                            </div>
                                        </div>
                                    </button>
                                </div>
                            </div>
                            <div class="w-48">
                                <button @click="" type="button" class="mx-2 flex items-center h-32 w-full border-2 rounded-md shadow-md hover:bg-gray-100">
                                    <div class="p-2 justify-items-center w-full">
                                        <div>
                                            <font-awesome-icon icon="calendar-days" class="text-4xl" />
                                        </div>
                                        <div class="mt-2 font-bold text-base text-gray-800">Events</div>
                                    </div>
                                </button>
                                <div class="mt-1 mx-2 flex flex-row w-full">
                                    <div class="flex items-center w-2/4 border-2 shadow-md hover:bg-gray-100">
                                        <div class="p-2 justify-items-center w-full">
                                            <div class="font-bold text-base text-gray-800">
                                                {{ events_total }}
                                            </div>
                                        </div>
                                    </div>
                                    <button @click="" type="button" class="flex items-center ml-1 w-1/4 border-2 shadow-md hover:bg-gray-100">
                                        <div class="p-2 justify-items-center w-full">
                                            <div>
                                                <font-awesome-icon icon="magnifying-glass" class="text-xmd" />
                                            </div>
                                        </div>
                                    </button>
                                    <button @click="" type="button" class="flex items-center ml-1 w-1/4 border-2 shadow-md hover:bg-gray-100">
                                        <div class="p-2 justify-items-center w-full">
                                            <div>
                                                <font-awesome-icon icon="plus" class="text-md" />
                                            </div>
                                        </div>
                                    </button>
                                </div>
                            </div>
                            <div class="w-48">
                                <button @click="" type="button" class="mx-2 flex items-center h-32 w-full border-2 rounded-md shadow-md hover:bg-gray-100">
                                    <div class="p-2 justify-items-center w-full">
                                        <div>
                                            <font-awesome-icon icon="building" class="text-4xl" />
                                        </div>
                                        <div class="mt-2 font-bold text-base text-gray-800">Companies</div>
                                    </div>
                                </button>
                                <div class="mt-1 mx-2 flex flex-row w-full">
                                    <div class="flex items-center w-2/4 border-2 shadow-md hover:bg-gray-100">
                                        <div class="p-2 justify-items-center w-full">
                                            <div class="font-bold text-base text-gray-800">
                                                {{ companies_total }}
                                            </div>
                                        </div>
                                    </div>
                                    <button @click="" type="button" class="flex items-center ml-1 w-1/4 border-2 shadow-md hover:bg-gray-100">
                                        <div class="p-2 justify-items-center w-full">
                                            <div>
                                                <font-awesome-icon icon="magnifying-glass" class="text-xmd" />
                                            </div>
                                        </div>
                                    </button>
                                    <button @click="" type="button" class="flex items-center ml-1 w-1/4 border-2 shadow-md hover:bg-gray-100">
                                        <div class="p-2 justify-items-center w-full">
                                            <div>
                                                <font-awesome-icon icon="plus" class="text-md" />
                                            </div>
                                        </div>
                                    </button>
                                </div>
                            </div>
                            <div class="w-48">
                                <button @click="" type="button" class="mx-2 flex items-center h-32 w-full border-2 rounded-md shadow-md hover:bg-gray-100">
                                    <div class="p-2 justify-items-center w-full">
                                        <div>
                                            <font-awesome-icon icon="address-book" class="text-4xl" />
                                        </div>
                                        <div class="mt-2 font-bold text-base text-gray-800">Contacts</div>
                                    </div>
                                </button>
                                <div class="mt-1 mx-2 flex flex-row w-full">
                                    <div class="flex items-center w-2/4 border-2 shadow-md hover:bg-gray-100">
                                        <div class="p-2 justify-items-center w-full">
                                            <div class="font-bold text-base text-gray-800">
                                                {{ contacts_total }}
                                            </div>
                                        </div>
                                    </div>
                                    <button @click="" type="button" class="flex items-center ml-1 w-1/4 border-2 shadow-md hover:bg-gray-100">
                                        <div class="p-2 justify-items-center w-full">
                                            <div>
                                                <font-awesome-icon icon="magnifying-glass" class="text-xmd" />
                                            </div>
                                        </div>
                                    </button>
                                    <button @click="" type="button" class="flex items-center ml-1 w-1/4 border-2 shadow-md hover:bg-gray-100">
                                        <div class="p-2 justify-items-center w-full">
                                            <div>
                                                <font-awesome-icon icon="plus" class="text-md" />
                                            </div>
                                        </div>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div v-for="event in events" :key="event.id">
                                {{ event.event_name }}
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

    const router = useRouter();

    const notes = ref([]);
    const events = ref([]);
    const contacts = ref([]);
    const companies = ref([]);
    const notes_total = ref(0);
    const my_notes_total = ref(0);
    const events_total = ref(0);
    const companies_total = ref(0);
    const contacts_total = ref(0);

    const search = ref("");

    const message = ref('');
    const messageClass = ref('hidden');

    const BASE_URL = "http://localhost:8080"

    function formatDate(dateStr) {
        return dayjs(dateStr).format('D MMMM YYYY')
    }

    onMounted(async () => {
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
    })

    const fetcDashboard = async () => {
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

</script>