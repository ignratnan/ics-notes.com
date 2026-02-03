<template>
    <div class="bg-gray-100 flex items-center justify-center min-h-screen">
        <div class="bg-white rounded-xl shadow-lg p-8 w-full max-w-sm space-y-6">
            <div class="p-0 grid grid-cols-1 place-items-center">
                <img :src="logoBlack" class="h-20" alt="ICS" />
            </div>
            <hr>
            <h1 :class="infoBefore" class="text-base font-bold text-center text-gray-800">Send email to reset your password</h1>
            <h1 :class="infoAfter" class="text-base font-bold text-center text-gray-800">{{ message }}</h1>

            <div :class="formBefore">
                <form @submit.prevent="submit" class="space-y-4">
                    <div class="mb-8">
                        <label for="email" class="block text-gray-700 font-medium">Email Address</label>
                        <input 
                            type="email" 
                            id="email" 
                            v-model="email"
                            required
                            autocomplete="off" 
                            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 transition duration-200">
                    </div>
                    <div class="flex flex-row gap-2">
                        <button @click="goToLogin"
                            class="w-full bg-red-600 text-white font-bold py-2 px-4 rounded-lg hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 transition duration-200">
                            Cancel
                        </button>
                        <button 
                            type="submit"
                            class="w-full bg-indigo-600 text-white font-bold py-2 px-4 rounded-lg hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 transition duration-200">
                            Send
                        </button>
                    </div>
                </form>
            </div>

            <div :class="formLoading" class="flex justify-center">
                <img :src="loading" class="w-8" alt="Loading..." />
            </div>

            <div :class="formAfter" class="mb-8">
                <label for="email" class="block text-gray-700 font-medium">Email Address</label>
                <input 
                    type="email" 
                    id="email" 
                    v-model="email"
                    required
                    autocomplete="off"
                    readonly
                    class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 transition duration-200">
            </div>
        </div>
    </div>
</template>

<script setup>
    import { ref, reactive } from 'vue';
    import logoBlack from '@/assets/ics_logo_black.png';
    import loading from '@/assets/loading.gif';

    import { useRouter } from 'vue-router';
    import axios from 'axios'

    // Get the router instance
    const router = useRouter();
    // Method to handle the navigation
    const goToLogin = () => {
        router.push({ name: 'login' });
    };

    const message = ref('');

    const infoBefore = ref('');
    const infoAfter = ref('hidden');

    const formBefore = ref('');
    const formLoading = ref('hidden')
    const formAfter = ref('hidden');

    const email = ref('')

    const BASE_URL = 'http://localhost:8080';

    const submit = async () => {
        formBefore.value = 'hidden'
        formAfter.value = ''
        formLoading.value = ''

        const res = await axios.post(`${BASE_URL}/forgot-password`, {
            email: email.value
        })
        formLoading.value = 'hidden'
        message.value = res.data.message
        infoBefore.value = 'hidden'
        infoAfter.value = ''
        
    }
       
</script>
