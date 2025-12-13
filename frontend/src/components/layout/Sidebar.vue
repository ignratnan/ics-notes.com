<template>
    <div class="fixed top-0 left-0 flex flex-col h-screen bg-gray-800 text-white w-64">
        <div class="flex-shrink-0 p-4">
            <div class="flex items-left mb-6 ml-3">
                <img :src="logoWhite" class="h-12" alt="ICS" />
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

        <div class="mt-auto p-4 flex justify-between items-center">
            <a href="#" class="flex items-center text-gray-400 hover:text-white transition-colors duration-200">
            <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37a1.724 1.724 0 002.572-1.065z"></path>
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
            </svg>
            <span class="ml-2 hidden lg:inline">Settings</span>
            </a>
            <button @click="handleLogout" class="flex items-center text-gray-400 hover:text-white transition-colors duration-200">
            <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path>
            </svg>
            <span class="ml-2 hidden lg:inline">Logout</span>
            </button>
        </div>
    </div>
</template>

<script setup>
import logoWhite from '@/assets/ics_logo_white.png'
import { useRouter } from 'vue-router';
import axios from 'axios'; // You need to import axios

const router = useRouter();

const handleLogout = async () => {
    try {
        // 1. Call the backend's logout endpoint (which sets MaxAge=-1 for the cookie)
        // Make sure your Axios config has withCredentials: true set!
        await axios.post('http://localhost:8080/logout'); 
        
        // 2. Redirect the user to the login page after successful logout
        router.push('/'); 
    } catch (error) {
        console.error("Logout failed, but proceeding with redirect:", error);
        // Even if the request fails (e.g., session already expired), 
        // we should redirect the user to prevent them from staying on a protected page.
        router.push('/'); 
    }
}
</script>