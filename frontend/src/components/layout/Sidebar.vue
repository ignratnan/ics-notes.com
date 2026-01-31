<template>
    <div class="fixed top-0 left-0 flex flex-col h-screen bg-gray-800 text-white w-64">
        <div class="flex-shrink-0 p-4">
            
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

        <div class="w-64 p-2 mb-2 bg-gray-700">
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

        <div class="mt-auto p-4">
        
            

            <div class="flex justify-between">
                <button @click="goSettings" class="flex items-center text-white hover:text-gray-400 transition-colors duration-200">
                    <font-awesome-icon icon="gear" />
                    <span class="ml-2 hidden lg:inline">Settings</span>
                </button>
                
                
                <button @click="handleLogout" class="flex items-center text-white hover:text-gray-400 transition-colors duration-200">
                    <font-awesome-icon icon="arrow-right-from-bracket" />
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

const goSettings = () => {
    router.push({ name: 'settings' })
}
</script>