<template>
    <div class="bg-gray-100 flex items-center justify-center min-h-screen">
        <div class="bg-white rounded-xl shadow-lg p-8 w-full max-w-sm space-y-6">
            <div class="p-0 grid grid-cols-1 place-items-center">
                <img :src="logoBlack" class="h-20" alt="ICS" />
            </div>
            <hr>
            <h1 class="text-3xl font-bold text-center text-gray-800">Login to ICS-Notes</h1>

            <!-- Form with Vue event handling -->
            <form class="space-y-4">
                
                <!-- Email Input Field -->
                <div>
                    <label for="email" class="block text-gray-700 font-medium">Email Address</label>
                    <input 
                        type="email" 
                        id="email" 
                        required 
                        class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 transition duration-200">
                </div>

                <!-- Password Input Field -->
                <div>
                    <label for="password" class="block text-gray-700 font-medium">Password</label>
                    <input 
                        type="password" 
                        id="password" 
                        required 
                        class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 transition duration-200">
                </div>

                <!-- Login Button -->
                <button 
                    type="submit" @click="goToDashboard"
                    class="w-full bg-indigo-600 text-white font-bold py-2 px-4 rounded-lg hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 transition duration-200">
                    Login
                </button>

            </form>

        </div>
    </div>
</template>

<script setup>
    import logoBlack from '@/assets/ics_logo_black.png'
    import { useRouter } from 'vue-router';

    // Get the router instance
    const router = useRouter();

    // Method to handle the navigation
    const goToDashboard = () => {
    // Navigate to the route with the name 'dashboard'
    router.push({ name: 'dashboard' });
    };
</script>