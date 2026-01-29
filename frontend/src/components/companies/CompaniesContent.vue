<template>
    <div class="py-1">
        <div class="mx-auto sm:px-6 lg:px-8">
            <div name="header" class="mt-2 p-2">
                <h1 class="font-bold text-xl text-gray-800">
                    COMPANIES
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
                        <input
                            type="search"
                            v-model="search"
                            placeholder="Search company..."
                            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg block w-full pl-10 p-2.5"
                        />
                    </div>
                </form>
                <div class="flex flex-row-reverse">
                    <router-link to="/companies/create-company">
                        <button
                        class="inline items-center px-4 py-2 my-3 bg-black border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-gray-700 active:bg-gray-900 focus:outline-none focus:border-gray-900 focus:shadow-outline-gray disabled:opacity-25 transition ease-in-out duration-150">
                        Create New Company
                        </button>
                    </router-link>
                </div>
            </div>
            <div class="grid grid-cols-3 gap-2">
                <div v-for="company in filteredCompanies" :key="company.id">
                    <article class="flex flex-col h-full w-auto max-w-sm h-fit px-4 py-3 rounded-md shadow-md bg-gray-50 border border-gray-800">
                        <div class="flex flex-row-reverse mt-2">
                            <span class="text-sm font-light text-gray-800 dark:text-gray-800">
                                {{ company.user.name }} || {{ formatDate(company.created_at) }}
                            </span>
                        </div>
                        <div>
                            <h1 class="mt-2 text-lg font-semibold text-gray-800 dark:text-black break-words">
                                {{ company.company_name }}
                            </h1>
                        </div>
                        <div class="flex-grow font-normal text-sm text-gray-800">
                            <div class="flex flex-row mt-1">
                                <div><font-awesome-icon icon="building" /></div>
                                <div class="ml-1 break-words">
                                    {{ company.company_country }} 
                                </div>
                            </div>
                            <div class="flex flex-row mt-1">
                                <div><font-awesome-icon icon="user-tie" /></div>
                                <div class="ml-1 break-words">
                                    {{ company.agent_type }} 
                                </div>
                            </div>
                            <div class="flex flex-row mt-1">
                                <div><font-awesome-icon icon="tag" /></div>
                                <div class="ml-1 break-words">
                                    {{ company.business_source }} 
                                </div>
                            </div>                            
                        </div>
                        <div>
                            <div class="flex flex-row-reverse">
                                <button @click="openDeleteModal(company.id)"
                                    class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-black bg-gray-0 rounded-lg hover:bg-gray-400 focus:ring-4 focus:outline-none focus:ring-gray-300 dark:bg-gray-0 dark:hover:bg-gray-400 dark:focus:ring-gray-300 ease-in-out duration-150">
                                    <font-awesome-icon icon="trash" />
                                </button>
                                <button @click="goEdit(company.id)"
                                    class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-black bg-gray-0 rounded-lg hover:bg-gray-400 focus:ring-4 focus:outline-none focus:ring-gray-300 dark:bg-gray-0 dark:hover:bg-gray-400 dark:focus:ring-gray-300 ease-in-out duration-150">
                                    <font-awesome-icon icon="pen" />
                                </button>
                                <button @click="goDetails(company.id)"
                                    class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-black bg-gray-0 rounded-lg hover:bg-gray-400 focus:ring-4 focus:outline-none focus:ring-gray-300 dark:bg-gray-0 dark:hover:bg-gray-400 dark:focus:ring-gray-300 ease-in-out duration-150">
                                    <font-awesome-icon icon="magnifying-glass" />
                                </button>
                            </div>
                        </div>
                    </article>
                </div>
            </div>

            <div v-for="company in companies" :key="'delete-' + company.id" >
                <div v-if="openDeleteModalId === company.id"
                    class="fixed inset-0 bg-gray-900 bg-opacity-75 flex items-center justify-center z-50 p-4">
                    <div class="flex flex-row max-w-lg w-full">
                        <div class="w-full bg-white rounded-xl shadow-2xl overflow-hidden">
                            <div class="py-1">
                                <div class="sm:px-6 lg:px-8">
                                    <div name="header" class="mt-4 p-2">
                                        <h1 class="font-bold text-2xl text-center text-gray-800">
                                            DELETE COMPANY
                                        </h1>
                                        <hr class="mt-2 border-gray-200">
                                    </div>

                                    <div class="my-6 py-2 text-center">
                                        <p class="text-lg text-gray-700">Are you sure you want to delete 
                                            <b class="text-red-600">"{{ company.company_name }}"</b>?
                                        </p>
                                    </div>

                                    <div class="bg-gray-50 p-4 flex justify-between space-x-4">
                                        <!-- Cancel Button -->
                                        <button type="button" @click="closeDeleteModal"
                                                class="flex-1 rounded-md border border-gray-300 px-4 py-2 bg-white text-base font-medium text-gray-700 shadow-sm hover:bg-gray-100 transition ease-in-out duration-150">
                                            Cancel
                                        </button>

                                        <!-- Delete Button -->
                                        <button type="button" @click="deleteCompany(company.id)"
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
import { onMounted, ref, computed } from 'vue'
import axios from 'axios'
import dayjs from 'dayjs'
import { useRouter } from 'vue-router'

const companies = ref([])
const router = useRouter()

const openDeleteModalId = ref(null)
const deletedCompanyId = ref(null)

const search = ref("")

const message = ref('')
const messageClass = ref('hidden')

const BASE_URL = 'http://localhost:8080'

onMounted(async () => {
  try {
    const res = await axios.get(`${BASE_URL}/companies`)
    companies.value = res.data.companies
  } catch (err) {
    console.error('Error fetching users:', err)
  }
})

const fetchCompanies = async () => {
    try {
        const res = await axios.get(`${BASE_URL}/companies`)

        companies.value = res.data.companies
    } catch (error) {
        const errorMessage = error.response?.data?.error || 'An unexpected error occurred.';
        message.value = errorMessage;
        messageClass.value = 'bg-red-100 text-red-700';
    }
}

const goEdit = (id) => {
    router.push({ name: 'companies_edit_company', params: { id } })
}

const goDetails = (id) => {
    router.push({ name: 'companies_details_company', params: { id } })
}

const openDeleteModal = (id) => {
    openDeleteModalId.value = id;
    deletedCompanyId.value = null;
}

const closeDeleteModal = () => {
    openDeleteModalId.value = null;
}

const deleteCompany = async (companyID) => {
    message.value = '';
    messageClass.value = 'hidden';

    const oldCompanies = [...companies.value]

    companies.value = companies.value.filter(c => c.id !== companyID)

    try {
        const url = `${BASE_URL}/companies/${companyID}`;
        const res = await axios.delete(url);

        message.value = res.data.message;
        messageClass.value = 'bg-green-100 text-green-700';

    } catch (error) {
        events.value = oldCompanies
        const errorMessage = error.response?.data?.error || 'Failed to delete event.';
        message.value = `Error: ${errorMessage}`;
        console.error('Delete error:', error);
    }

    closeDeleteModal()
    await fetchCompanies()
}

const filteredCompanies = computed(() => {
    if (!search.value) return companies.value

    const keyword = search.value.toLowerCase()

    return companies.value.filter(company =>    
        company.company_name.toLowerCase().includes(keyword)
    )
})

function formatDate(dateStr) {
  return dayjs(dateStr).format('D MMMM YYYY')
}

</script>