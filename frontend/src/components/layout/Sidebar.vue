<template>
    <div class="fixed top-0 left-0 flex flex-col h-screen bg-gray-800 text-white w-64">
        <div class="flex-shrink-0 p-4">
            <div class="flex items-center justify-center mb-6">
            <svg class="h-10 w-10 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2m-2 4h-4m-4 0h-4m-2-4a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v2a2 2 0 002 2z"></path>
            </svg>
            <span class="ml-2 text-xl font-semibold">Company</span>
            </div>
            <nav class="flex-1 space-y-2">
            <router-link to="/notes" class="flex items-center p-2 rounded-lg hover:bg-gray-700 transition-colors duration-200">
                <svg class="h-6 w-6 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"></path>
                </svg>
                Notes
            </router-link>
            <router-link to="/events" class="flex items-center p-2 rounded-lg hover:bg-gray-700 transition-colors duration-200">
                <svg class="h-6 w-6 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h.01M17 11h.01M16 21H8a2 2 0 01-2-2V7a2 2 0 012-2h8a2 2 0 012 2v12a2 2 0 01-2 2z"></path>
                </svg>
                Events
            </router-link>
            <router-link to="/contacts" class="flex items-center p-2 rounded-lg hover:bg-gray-700 transition-colors duration-200">
                <svg class="h-6 w-6 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                </svg>
                Contacts
            </router-link>
            <router-link to="/companies" class="flex items-center p-2 rounded-lg hover:bg-gray-700 transition-colors duration-200">
                <svg class="h-6 w-6 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.484 9.222 5 7.5 5S4.168 5.484 3 6.253m9 0c.937.527 1.954.914 3 1.157m-3-1.157C12.832 5.484 14.832 5 16.5 5S20.168 5.484 21 6.253m-3 1.157c-.937.527-1.954.914-3 1.157m-6 0v-3.75a2 2 0 012-2H21l-3 3-3-3H7a2 2 0 00-2 2v3.75m0-4.5a2 2 0 012-2h12a2 2 0 012 2v4.5a2 2 0 01-2 2h-12a2 2 0 01-2-2v-4.5z"></path>
                </svg>
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
            <a href="#" class="flex items-center text-gray-400 hover:text-white transition-colors duration-200">
            <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path>
            </svg>
            <span class="ml-2 hidden lg:inline">Logout</span>
            </a>
        </div>
    </div>
</template>