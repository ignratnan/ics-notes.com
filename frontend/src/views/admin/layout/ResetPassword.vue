<template>
    <div class="bg-gray-100 flex items-center justify-center min-h-screen">
        <div class="bg-white rounded-xl shadow-lg p-8 w-full max-w-sm space-y-6">
            <div class="p-0 grid grid-cols-1 place-items-center">
                <img :src="logoBlack" class="h-20" alt="ICS" />
            </div>
            <hr>
            <h1 :class="infoBefore" class="text-lg font-bold text-center text-gray-800">Create new password</h1>
            <h1 :class="infoAfter" class="text-lg font-bold text-center text-gray-800">{{ message }}</h1>

            <div :class="formBefore">
                <form @submit.prevent="resetPassword" class="space-y-4">
                    <div class="mb-8">
                        <label for="password" class="block text-gray-700 font-medium">New Password</label>
                        <input 
                            type="password" 
                            id="password" 
                            v-model="form.password"
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
                            Save
                        </button>
                    </div>
                </form>
            </div>

            <div :class="formAfter" class="flex flex-row gap-2">
                <button @click="goToLogin"
                    class="w-full bg-indigo-600 text-white font-bold py-2 px-4 rounded-lg hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 transition duration-200">
                    Login
                </button>
            </div>
            
        </div>
    </div>
</template>

<script setup>
    import { ref, reactive, onMounted } from 'vue';
    import logoBlack from '@/assets/ics_logo_black.png';
    import { useRouter, useRoute } from 'vue-router';
    import axios from 'axios'

    // Get the router instance
    const router = useRouter();
    const route = useRoute();
    // Method to handle the navigation
    const goToLogin = () => {
        router.push({ name: 'login' });
    };

    const message = ref('');
    
    const infoBefore = ref('');
    const infoAfter = ref('hidden');

    const formBefore = ref('');
    const formAfter = ref('hidden');

    const form = reactive({
        password: '',
        token: '',
    });

    const apiUrl = import.meta.env.VITE_API_URL
    const BASE_URL = apiUrl

    onMounted(() => {
        if (!route.query.token) {
            router.push({ name: 'login' });
        }
    });

    const resetPassword = async () => {
        form.token = route.query.token
        message.value = '';
        try {
            const url = `${BASE_URL}/reset-password`;
            const res = await axios.post(url, form)

            message.value = res.data.message;
            infoBefore.value = 'hidden'
            infoAfter.value = 'bg-green-100 text-green-700';
            formBefore.value = 'hidden'
            formAfter.value = ''
            
            form.token = '';
            form.password = '';


        } catch (error) {
            const errorMessage = error.response?.data?.error || 'An unexpected error occurred.';
            message.value = errorMessage;
            infoAfter.value = 'bg-red-100 text-red-700';
        }
    };
</script>
