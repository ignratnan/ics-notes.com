<template>
    <div class="bg-gray-100 flex items-center justify-center min-h-screen">
        <div class="bg-white rounded-xl shadow-lg p-8 w-full max-w-sm space-y-6">
            <div class="p-0 grid grid-cols-1 place-items-center">
                <img :src="logoBlack" class="h-20" alt="ICS" />
            </div>
            <hr>
            <h1 class="text-3xl font-bold text-center text-gray-800">Login to ICS-Notes</h1>

            <!-- Form with Vue event handling -->
            <form @submit.prevent="submitLogin" class="space-y-4">
                
                <!-- Email Input Field -->
                <div>
                    <label for="email" class="block text-gray-700 font-medium">Email Address</label>
                    <input 
                        type="text" 
                        id="email" 
                        v-model="form.email"
                        required 
                        class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 transition duration-200">
                </div>

                <!-- Password Input Field -->
                <div>
                    <label for="password" class="block text-gray-700 font-medium">Password</label>
                    <input 
                        type="password" 
                        id="password" 
                        v-model="form.password"
                        required 
                        class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 transition duration-200">
                </div>

                <div>
                    <button @click="goToForgotPassword" type="button"
                    class="text-blue-600 hover:underline">
                        Forgot Password?
                    </button>
                </div>

                <!-- Login Button -->
                <button 
                    type="submit"
                    class="w-full bg-indigo-600 text-white font-bold py-2 px-4 rounded-lg hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 transition duration-200">
                    Login
                </button>

            </form>
            <!-- Status Message -->
            <div v-if="message" :class="messageClass" class="p-4 rounded-lg mb-4 text-sm font-medium">
                {{ message }}
            </div>

        </div>
    </div>
</template>

<script setup>
    import { ref, reactive } from 'vue';
    import logoBlack from '@/assets/ics_logo_black.png';
    import { useRouter } from 'vue-router';
    import axios from 'axios'

    // Get the router instance
    const router = useRouter();
    // Method to handle the navigation
    const goToForgotPassword = () => {
        router.push({ name: 'forgot_password' });
    };

    const message = ref('');
    const messageClass = ref('');
    const userStatus = ref('');
    const adminStatus = ref('');


    const form = reactive({
        email: '',
        password: ''
    });

    const API_URL = 'http://localhost:8080/login';

    const submitLogin = async () => {
        // Reset messages before new submission
        message.value = '';
        messageClass.value = '';
        adminStatus.value = 0;
        userStatus.value = 0;



        try {
            const response = await axios.post(API_URL, form, {
                withCredentials: true
            });

            message.value = response.data.message;
            messageClass.value = 'bg-green-100 text-green-700';
            adminStatus.value = response.data.adminStatus;
            userStatus.value = response.data.userStatus;



            // Reset the form after successful submission
            form.email = '';
            form.password = '';

            if (adminStatus.value == 1) {
                router.push({ name: 'admin_dashboard' });
            } if (userStatus.value == 1) {
                router.push({ name: 'dashboard' })
            } else {
                messageClass.value = 'bg-red-100 text-red-700';
            }


        } catch (error) {
            const errorMessage = error.response?.data?.error || 'An unexpected error occurred.';
            message.value = errorMessage;
            messageClass.value = 'bg-red-100 text-red-700';
        }
    };
</script>
