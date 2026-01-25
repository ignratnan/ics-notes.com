<template>
    <div class="fixed top-0 left-0 flex flex-col h-screen bg-gray-800 text-white w-64">
        <div class="flex-shrink-0 p-4">
            
            <div :class="messageClass" name="message" class="mt-2 p-2">
                {{ message }}
            </div>

            <div class="flex items-left mb-4 ml-3">
                <img :src="logoWhite" class="h-12" alt="ICS" />
            </div>

            <div class="px-2 mb-4 font-bold">
                <font-awesome-icon class="mr-3" icon="user" />
                {{ userLogin }}
            </div>

            <nav class="flex-1 space-y-2">
            <router-link to="/dashboard" class="flex items-center p-2 rounded-lg hover:bg-gray-700 transition-colors duration-200">
                <font-awesome-icon class="mr-3" icon="border-all" />
                Dashboard
            </router-link>
            <router-link to="/notes" class="flex items-center p-2 rounded-lg hover:bg-gray-700 transition-colors duration-200">
                <font-awesome-icon class="mr-3" icon="notes-medical" />
                Notes
            </router-link>
            <router-link to="/events" class="flex items-center p-2 rounded-lg hover:bg-gray-700 transition-colors duration-200">
                <font-awesome-icon class="mr-3" icon="calendar-days" />
                Events
            </router-link>
            <router-link to="/contacts" class="flex items-center p-2 rounded-lg hover:bg-gray-700 transition-colors duration-200">
                <font-awesome-icon class="mr-3" icon="address-book" />
                Contacts
            </router-link>
            <router-link to="/companies" class="flex items-center p-2 rounded-lg hover:bg-gray-700 transition-colors duration-200">
                <font-awesome-icon class="mr-3" icon="building" />
                Companies
            </router-link>
            </nav>
        </div>

        <div class="mt-auto p-4">
        
            <div class="w-56 p-2 mb-2 bg-gray-700">
                <ul class="list-disc list-inside">
                    <li>
                        <button class="hover:text-gray-400">
                            Reset Password
                        </button>
                    </li>
                    <li>
                        <button @click="migrateNotes" class="hover:text-gray-400">
                            Re-create Notes
                        </button>
                    </li>
                    <li>
                        <button @click="migrateCompanies" class="hover:text-gray-400">
                            Re-create Companies
                        </button>
                    </li>
                </ul>
            </div>
            <div class="flex justify-between">
                <a href="#" class="flex items-center text-white hover:text-gray-400 transition-colors duration-200">
                <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37a1.724 1.724 0 002.572-1.065z"></path>
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                </svg>
                <span class="ml-2 hidden lg:inline">Settings</span>
                </a>
                <button @click="handleLogout" class="flex items-center text-white hover:text-gray-400 transition-colors duration-200">
                <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path>
                </svg>
                <span class="ml-2 hidden lg:inline">Logout</span>
                </button>
            </div>
        </div>
    </div>
</template>

<script setup>
import { onMounted, ref } from 'vue'
import logoWhite from '@/assets/ics_logo_white.png'
import { useRouter } from 'vue-router';
import axios from 'axios';

const router = useRouter();
const BASE_URL = 'http://localhost:8080'

const userLogin = ref('');
const message = ref('')
const messageClass = ref('hidden')

onMounted(async () => {
    try {
        const res = await axios.get(`${BASE_URL}/me`)
        
        userLogin.value = res.data.userLogin
    } catch (err) {
        console.error('Error fetching users:', err)
    }
})

const handleLogout = async () => {
    try {
        await axios.post(`${BASE_URL}/logout`); 
        router.push('/'); 
    } catch (error) {
        console.error("Logout failed, but proceeding with redirect:", error);
        router.push('/'); 
    }
}

const migrateNotes = async () => {
    try {
        const res = await axios.get(`${BASE_URL}/migrate-notes`);

        message.value = res.data.message
        messageClass.value = 'bg-green-100 text-green-700';


    } catch (error) {
        console.error("Logout failed, but proceeding with redirect:", error);
    }
}

const migrateCompanies = async () => {
    try {
        const res = await axios.get(`${BASE_URL}/migrate-companies`);

        message.value = res.data.message
        messageClass.value = 'bg-green-100 text-green-700';

    } catch (error) {
        console.error("Logout failed, but proceeding with redirect:", error);
    }
}
</script>