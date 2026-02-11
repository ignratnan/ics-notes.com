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
                <div class="flex flex-row font-bold text-xl text-gray-800">
                    <div>
                        <button @click="goToCompanies" class="hover:underline">
                            COMPANIES
                        </button>
                    </div> 
                    <div><font-awesome-icon icon="angle-right" /></div>
                    <div>DETAILS-COMPANY</div>
                </div>
                <hr>
            </div>
            <div class="max-w mb-5 bg-black">
                <div class="px-2 divide-y divide-gray-100 overflow-hidden rounded-lg border border-gray-200 bg-gray-50 shadow-sm">
                    <div class="flex flex-row justify-between my-1 p-3 font-bold text-2xl text-gray-800 border-gray-200 shadow-md">
                        <div>
                            {{ company.company_name }}
                        </div>
                    </div>
                    
                    <div class="mb-6">
                        <div class="bg-gray-50 py-2">
                            <div class="flex flex-row">
                                <div class="font-normal text-base text-gray-800 w-2/5">
                                    <div class="flex flex-row mt-1">
                                        <div><font-awesome-icon icon="building" /></div>
                                        <div class="ml-1 w-32">Country</div>
                                        <div>:</div>
                                        <div class="ml-2 break-words">
                                            {{ company.company_country }} 
                                        </div>
                                    </div>
                                    <div class="flex flex-row mt-1">
                                        <div><font-awesome-icon icon="user-tie" /></div>
                                        <div class="ml-1 w-32">Agent Type</div>
                                        <div>:</div>
                                        <div class="ml-2 break-words">
                                            {{ company.agent_type }} 
                                        </div>
                                    </div>
                                    <div class="flex flex-row mt-1">
                                        <div><font-awesome-icon icon="tag" /></div>
                                        <div class="ml-1 w-32">Business Source</div>
                                        <div>:</div>
                                        <div class="ml-2 break-words">
                                            {{ company.business_source }} 
                                        </div>
                                    </div>                            
                                </div>
                                <div class="ml-2 font-normal text-base text-gray-800 w-3/5">
                                    <div class="flex flex-row">
                                        <div><font-awesome-icon icon="circle-info" /></div>
                                        <div class="ml-1">Details</div>
                                        <div class="ml-2">:</div>
                                        <div 
                                            class="note-content prose ml-2 break-words" 
                                            v-html="safeContent"
                                        ></div>
                                    </div>
                                    
                                    
                                </div>
                            </div>
                            
                        </div>
                    </div>

                    <div class="mb-6">
                        <div class="bg-gray-50 py-2 border-t-2">
                            <div class="flex flex-row">
                                <div class="p-2 pr-4 w-2/6 mr-2 border-r-2">
                                    <div class="p-3 font-bold text-lg text-gray-800 border-gray-200 shadow-md">
                                        Contacts
                                    </div>
                                    <div>
                                        <div v-for="contact in contacts" :key="contact.id">
                                            
                                            <div class="flex flex-row border-b-2 pb-2">
                                                <div class="text-xs mt-3 mr-2">
                                                    <font-awesome-icon icon="square" />
                                                </div>
                                                <div>
                                                    <div class="mt-2 text-base font-semibold text-gray-800 dark:text-black">
                                                        <span>
                                                            {{ contact.first_name }} {{ contact.last_name }}
                                                        </span>
                                                        <span v-if="contact.contact_gender" class="ml-1">
                                                            ({{ contact.contact_gender }})
                                                        </span>
                                                    </div>
                                                    <div class="font-normal text-sm text-gray-800 break-words italic">
                                                        {{ contact.title }} 
                                                    </div>
                                                    <div class="pt-1 flex-grow font-normal text-sm text-gray-800">
                                                        <div class="flex flex-row">
                                                            <div class="text-xs"><font-awesome-icon icon="phone" /></div>
                                                            <div class="ml-1">
                                                                {{ contact.phone_number }} 
                                                            </div>
                                                        </div>
                                                        <div class="flex flex-row">
                                                            <div><font-awesome-icon icon="envelope" /></div>
                                                            <div class="ml-1 break-all">
                                                                {{ contact.email }} 
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </div>
                                    
                                </div>
                                <div class="w-4/6 p-2 pl-4 border-l-2">
                                    <div class="p-3 font-bold text-lg text-gray-800 border-gray-200 shadow-md">
                                        Notes
                                    </div>
                                    <div class="">
                                        <div v-for="note in sanitizedNotes" :key="note.id">
                                            <div class="flex flex-row border-b-2 pb-2">
                                                <div class="text-xs mt-3 mr-2">
                                                    <font-awesome-icon icon="square" />
                                                </div>
                                                <div class="flex-1 min-w-0">
                                                    <div class="flex flex-row justify-between mb-1">
                                                        <div>
                                                            <h1 class="mt-2 text-base font-semibold text-gray-800 dark:text-black">
                                                                {{ note.title }}
                                                            </h1>
                                                        </div>
                                                        <div class="mt-2 text-sm text-gray-800 dark:text-black">
                                                            {{ formatDate(note.created_at) }}
                                                        </div>
                                                    </div>
                                                        
                                                    <div class="pt-1 pb-1 flex-grow font-normal text-sm text-gray-800">
                                                        <div class="">
                                                            <div 
                                                                class="note-content prose" 
                                                                v-html="note.safeContent"
                                                            ></div>
                                                        </div>
                                                    </div>

                                                    <div class="flex flex-row justify-between italic pt-2 flex-grow font-normal text-sm text-gray-800">
                                                        <div>
                                                            Contact :
                                                            <a href="#">{{ note.contact.first_name }} {{ note.contact.last_name }}</a>
                                                        </div>
                                                        <div>
                                                            <a href="#">{{ note.event.event_name }}</a>
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
            </div>
        </div>
    </div>
    </div>
  </div>
    
</template>

<script setup>
import Sidebar from '@/views/user/layout/Sidebar.vue'
import SidebarBlock from '@/views/user/layout/SidebarBlock.vue'

import { onMounted, reactive, ref, computed } from 'vue'
import axios from 'axios'
import { useRoute, useRouter } from 'vue-router'
import DOMPurify from 'dompurify'
import dayjs from 'dayjs'

const route = useRoute()
const router = useRouter()

const company = ref({
    company_name: '',
    company_country: '',
    agent_type: '',
    business_source: '',
    company_notes: ''
})

const contacts = ref([])
const notes = ref([])
const safeContent = ref('')

const BASE_URL = 'http://localhost:8080'

const fetchCompany = async () => {
    try {
        const resCompany = await axios.get(`${BASE_URL}/companies/${route.params.id}`)
        company.value = resCompany.data.company
        safeContent.value = DOMPurify.sanitize(resCompany.data.company.company_notes)

        const resContacts = await axios.get(`${BASE_URL}/contacts/company/${route.params.id}`)
        contacts.value = resContacts.data.data

        const resNotes = await axios.get(`${BASE_URL}/notes/company/${route.params.id}`)
        notes.value = resNotes.data.notes

    } catch (err) {
        console.error(err)
    }
}

onMounted(fetchCompany)

const goToCompanies = () => {
    router.push({ name: 'companies' });
}

function formatDate(dateStr) {
    return dayjs(dateStr).format('D MMMM YYYY')
}

const sanitizedNotes = computed(() =>
    notes.value.map(note => ({
        ...note,
        safeContent: DOMPurify.sanitize(note.body)
    }))
)

</script>